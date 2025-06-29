module voting_contracts::proposal;

use std::string::String;
use voting_contracts::dashboard::AdminCapability;

public struct Proposal has key {
    id: UID,
    title: String,
    description: String,
    upvotes_count: u64,
    downvotes_count: u64,
    expires_at: u64,
    creator: address,
    voters_registry: vector<address>,
}

public fun create(
    _admin_cap: &AdminCapability, // only sender with admin capability can call
    title: String,
    description: String,
    expires_at: u64,
    ctx: &mut TxContext,
) {
    let proposal: Proposal = Proposal {
        id: object::new(ctx),
        title,
        description,
        upvotes_count: 0,
        downvotes_count: 0,
        expires_at,
        creator: ctx.sender(),
        voters_registry: vector[],
    };

    transfer::share_object(proposal);
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

public fun voters(self: &Proposal): vector<address> {
    return self.voters_registry
}
