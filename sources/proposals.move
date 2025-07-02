module voting_contracts::proposal;

use std::string::String;
use sui::event;
use sui::table::{Self, Table};
use voting_contracts::dashboard::AdminCapability;

// ########## Constants ##########
const E_DUPLICATE_VOTE: u64 = 3;
const E_ADMIN_VOTE: u64 = 4;

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

// ########## Structs ##########

public struct Proposal has key {
    id: UID,
    title: String,
    description: String,
    upvotes_count: u64,
    downvotes_count: u64,
    expires_at: u64,
    creator: address,
    voters_registry: Table<address, bool>,
}

// ########## Constructor ##########

// ########## Functions ##########

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

// ########## Public Functions ##########
public fun vote(self: &mut Proposal, ctx: &TxContext, upvote: bool) {
    let voter = ctx.sender();
    assert!(!(ctx.sender() == self.creator), E_ADMIN_VOTE);
    assert!(!self.voters_registry.contains(voter), E_DUPLICATE_VOTE);
    if (upvote) {
        self.upvotes_count = self.upvotes_count + 1;
    } else {
        self.downvotes_count = self.downvotes_count + 1;
    };
    self.voters_registry.add(voter, true);
    event::emit(VoteRegistered {
        proposal_id: object::id(self),
        voter,
        upvote,
    });
}
// ########## View-only Functions ##########

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
