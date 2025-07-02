module voting_contracts::utils;

use std::debug;
use sui::test_scenario;
use voting_contracts::dashboard::{Self, Dashboard, AdminCapability, register_proposal};
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

public fun create_and_register_proposal(): ID {
    let admin = @0xAd319;
    let mut proposal_id;
    // Issue Admin Cap
    let mut scenario = test_scenario::begin(admin);
    {
        dashboard::issue_admin_cap(scenario.ctx());
    };

    // Issue OTW, config, etc and create new proposal
    scenario.next_tx(admin);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();
        let one_time_witness = dashboard::issue_one_time_witness();
        let dashboard_config = dashboard::issue_admin_config(scenario.ctx());
        dashboard::new(one_time_witness, &admin_cap, scenario.ctx(), dashboard_config);
        test_scenario::return_to_sender(&scenario, admin_cap);
    };

    // Issue OTW, config, etc and create new proposal

    scenario.next_tx(admin);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();
        proposal_id = create_proposal(&admin_cap, scenario.ctx());
        let mut dashboard = test_scenario::take_shared<Dashboard>(&scenario);
        dashboard.register_proposal(&admin_cap, proposal_id);

        test_scenario::return_shared(dashboard);
        test_scenario::return_to_sender(&scenario, admin_cap);
    };

    scenario.end();
    return proposal_id
}
