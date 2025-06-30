module voting_contracts::utils;

use std::debug;
use sui::object::borrow_id;
use voting_contracts::dashboard::{AdminCapability, register_proposal};
use voting_contracts::proposal;

// Helper Functions

public fun create_proposal(admin_cap: &AdminCapability, ctx: &mut TxContext): ID {
    let current_timestamp_ms = ctx.epoch_timestamp_ms();

    let one_day_ms: u64 = 86400 * 1000; // 24 hours in milliseconds
    let seven_days_ms: u64 = 7 * one_day_ms;

    let title = b"Title 1".to_string();
    let desc = b"Description 1".to_string();
    let expires_at = current_timestamp_ms + seven_days_ms;

    debug::print(&b"----- Current Epoch Timestamp -----".to_string());
    debug::print(&current_timestamp_ms);
    debug::print(&b"----- Expires at -----".to_string());
    debug::print(&expires_at);
    let proposal_id = proposal::create(
        admin_cap,
        title,
        desc,
        expires_at,
        ctx,
    );

    return proposal_id
}

public fun new_proposal(admin_cap: &AdminCapability, ctx: &mut TxContext): ID {
    let current_timestamp_ms = ctx.epoch_timestamp_ms();

    let one_day_ms: u64 = 86400 * 1000; // 24 hours in milliseconds
    let seven_days_ms: u64 = 7 * one_day_ms;

    let title = b"Title 1".to_string();
    let desc = b"Description 1".to_string();
    let expires_at = current_timestamp_ms + seven_days_ms;
    let proposal_id = proposal::create(
        admin_cap,
        title,
        desc,
        expires_at,
        ctx,
    );

    return proposal_id
}
