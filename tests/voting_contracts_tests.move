#[allow(unused_use)]
#[test_only]
module voting_contracts::voting_contracts_tests;

use std::debug;
use sui::test_scenario::{Self, EEmptyInventory};
use voting_contracts::dashboard::{Self, Dashboard, AdminCapability};
use voting_contracts::proposal::{Self, Proposal};

#[test]
fun test_create_proposal_with_admin_cap() {
    let one_day_ms: u64 = 86400 * 1000; // 24 hours in milliseconds
    let seven_days_ms: u64 = 7 * one_day_ms;

    let admin = @0xAd319;

    let mut scenario = test_scenario::begin(admin);

    {
        dashboard::issue_admin_cap(scenario.ctx());
    };

    let current_timestamp_ms = scenario.ctx().epoch_timestamp_ms();
    scenario.next_tx(admin);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();
        let title = b"Title 1".to_string();
        let desc = b"Description 1".to_string();

        let expires_at = current_timestamp_ms + seven_days_ms;
        debug::print(&expires_at);
        proposal::create(
            &admin_cap,
            title,
            desc,
            expires_at,
            scenario.ctx(),
        );
        test_scenario::return_to_sender(&scenario, admin_cap);
    };

    // Initial Proposal test
    scenario.next_tx(admin);
    {
        let proposal: Proposal = scenario.take_shared<Proposal>();
        assert!(proposal.title() == b"Title 1".to_string());
        assert!(proposal.description() == b"Description 1".to_string());
        let (upvotes, downvotes) = proposal.votes();
        assert!(upvotes == 0 && downvotes == 0);
        assert!(proposal.creator() == admin);
        assert!(proposal.voters().length() == 0);
        let expires_at = current_timestamp_ms + seven_days_ms;
        assert!(proposal.expires_at() == expires_at);
        test_scenario::return_shared(proposal);
    };

    scenario.end();
}
#[test]
#[expected_failure(abort_code = test_scenario::EEmptyInventory)]
fun test_create_proposal_with_no_admin_cap_failure() {
    let one_day_ms: u64 = 86400 * 1000; // 24 hours in milliseconds
    let seven_days_ms: u64 = 7 * one_day_ms;

    let admin = @0xAd319;
    let not_admin = @0x907Ad319;
    let mut scenario = test_scenario::begin(admin);

    {
        dashboard::issue_admin_cap(scenario.ctx());
    };

    let current_timestamp_ms = scenario.ctx().epoch_timestamp_ms();
    scenario.next_tx(not_admin);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();
        let title = b"Title 1".to_string();
        let desc = b"Description 1".to_string();

        let expires_at = current_timestamp_ms + seven_days_ms;
        debug::print(&expires_at);
        proposal::create(
            &admin_cap,
            title,
            desc,
            expires_at,
            scenario.ctx(),
        );
        test_scenario::return_to_sender(&scenario, admin_cap);
    };

    scenario.end();
}
