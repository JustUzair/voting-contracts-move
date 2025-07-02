module voting_contracts::proposal;

use std::string::String;
use sui::event;
use sui::table::{Self, Table};
use sui::url::{Url, new_unsafe_from_bytes};
use voting_contracts::dashboard::AdminCapability;

// ########## Constants ##########
const E_DUPLICATE_VOTE: u64 = 3;
const E_ADMIN_VOTE: u64 = 4;
const E_PROPOSAL_STATUS_NOT_CHANGED: u64 = 5;
const E_VOTING_ENDED: u64 = 6;

// ########## Events ##########

public struct ProposalCreated has copy, drop {
    id: ID,
    title: String,
    creator: address,
    message: String,
}

public struct VoteRegistered has copy, drop {
    proposal_id: ID,
    voter: address,
    upvote: bool,
}

public struct ProofOfVoteNFTMinted has copy, drop {
    proposal_id: ID,
    upvote: bool,
    minted_to: address,
}

// ########## Enum ##########
public enum ProposalStatus has copy, drop, store {
    ACTIVE,
    ENDED,
}

// ########## Storage Structs ##########

public struct Proposal has key {
    id: UID,
    title: String,
    description: String,
    upvotes_count: u64,
    downvotes_count: u64,
    expires_at: u64,
    creator: address,
    status: ProposalStatus,
    voters_registry: Table<address, bool>,
}

public struct ProofOfVoteNFT has key, store {
    id: UID,
    proposal_id: ID,
    name: String,
    description: String,
    upvote: bool,
    minted_to: address,
    url: Url,
}

// ########## Functions ##########
// ########## Public Functions ##########

/*
 * @param _admin_cap - capability struct access to the admin account
 * @param title - Title of the proposal
 * @param description - Description of the proposal
 * @param expires_at - Expires at timestamp for the proposal
 * @param ctx - TxContext
 * @dev Admin only function to create a proposal
*/
public fun create(
    _admin_cap: &AdminCapability, // only sender with admin capability can call
    title: String,
    description: String,
    expires_at: u64,
    ctx: &mut TxContext,
): ID {
    let proposal: Proposal = Proposal {
        id: object::new(ctx),
        title,
        description,
        upvotes_count: 0,
        downvotes_count: 0,
        expires_at,
        creator: ctx.sender(),
        status: ProposalStatus::ACTIVE,
        voters_registry: table::new(ctx),
    };
    event::emit(ProposalCreated {
        id: object::id(&proposal),
        title: title(&proposal),
        creator: creator(&proposal),
        message: b"Proposal Created".to_string(),
    });
    let proposal_id = proposal.id.to_inner();
    transfer::share_object(proposal);
    return proposal_id
}

public fun vote(self: &mut Proposal, ctx: &mut TxContext, upvote: bool) {
    assert!(self.status == ProposalStatus::ACTIVE, E_VOTING_ENDED);
    let voter = ctx.sender();
    assert!(!(ctx.sender() == self.creator), E_ADMIN_VOTE);
    assert!(!self.voters_registry.contains(voter), E_DUPLICATE_VOTE);
    if (upvote) {
        self.upvotes_count = self.upvotes_count + 1;
    } else {
        self.downvotes_count = self.downvotes_count + 1;
    };
    self.voters_registry.add(voter, true);
    issue_vote_nft(self, ctx, upvote, voter);
    event::emit(VoteRegistered {
        proposal_id: object::id(self),
        voter,
        upvote,
    });
}

public fun change_proposal_status(
    self: &mut Proposal,
    _admin_cap: &AdminCapability,
    status: ProposalStatus,
) {
    assert!(status != self.status, E_PROPOSAL_STATUS_NOT_CHANGED);
    self.status = status;
}

// ########## Private Functions ##########
fun issue_vote_nft(self: &Proposal, ctx: &mut TxContext, upvote: bool, recipient: address) {
    let mut name = b"NFT: ".to_string();
    name.append(self.title);
    let mut description = b"Proof Of Vote for NFT: ".to_string();
    let proposal_address = object::id_address(self).to_string();
    description.append(proposal_address);
    let upvote_image = new_unsafe_from_bytes(
        b"https://fuchsia-eldest-xerinae-808.mypinata.cloud/ipfs/bafybeihvcevz7iaco6gvu4ugp4i4uffkvta7f63xh5w763iekhkuosbwyu",
    );
    let downvote_image = new_unsafe_from_bytes(
        b"https://fuchsia-eldest-xerinae-808.mypinata.cloud/ipfs/bafybeiftxqmitfixvhutfws6tzp6qoc5mwki7x7p5rjsmpargnamis677m",
    );
    let povNft = ProofOfVoteNFT {
        id: object::new(ctx),
        proposal_id: object::id(self),
        name,
        description,
        url: match (upvote) {
            true => upvote_image,
            false => downvote_image,
        },
        minted_to: ctx.sender(),
        upvote,
    };
    event::emit(ProofOfVoteNFTMinted {
        proposal_id: object::id(self),
        upvote,
        minted_to: ctx.sender(),
    });
    transfer::transfer(povNft, recipient);
}

// ########## View-only Functions ##########
public fun getURL(self: &ProofOfVoteNFT): Url {
    return self.url
}

public fun getVoteType(self: &ProofOfVoteNFT): String {
    return match (self.upvote) {
        true => b"upvote".to_string(),
        false => b"downvote".to_string(),
    }
}

public fun title(self: &Proposal): String {
    return self.title
}

public fun description(self: &Proposal): String {
    return self.description
}

public fun votes(self: &Proposal): (u64, u64) {
    return (self.upvotes_count, self.downvotes_count)
}

public fun expires_at(self: &Proposal): u64 {
    return self.expires_at
}

public fun creator(self: &Proposal): address {
    return self.creator
}

public fun has_voted(self: &Proposal, voter: address): bool {
    return self.voters_registry.contains(voter)
}

public fun status(self: &Proposal): &ProposalStatus {
    return &self.status
}

#[test_only]
public fun enum_active(): ProposalStatus { return ProposalStatus::ACTIVE }
#[test_only]
public fun enum_ended(): ProposalStatus {
    return ProposalStatus::ENDED
}
