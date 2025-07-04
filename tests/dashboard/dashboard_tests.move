#[allow(unused_use)]
#[test_only]
module voting_contracts::voting_contracts_tests;

use std::debug;
use sui::test_scenario::{Self, EEmptyInventory};
use voting_contracts::dashboard::{Self, Dashboard, AdminCapability};
use voting_contracts::proposal::{Self, Proposal};
use voting_contracts::utils::create_proposal;

// Constants for test files
const ADMIN: address = @0xAd319;

#[test]
fun test_create_proposal_with_admin_cap() {
    let mut scenario = test_scenario::begin(ADMIN);
    let current_timestamp_ms = scenario.ctx().epoch_timestamp_ms();

    let one_day_ms: u64 = 86400 * 1000; // 24 hours in milliseconds
    let seven_days_ms: u64 = 7 * one_day_ms;
    {
        dashboard::issue_admin_cap(scenario.ctx());
    };

    scenario.next_tx(ADMIN);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();
        create_proposal(&admin_cap, scenario.ctx());
        test_scenario::return_to_sender(&scenario, admin_cap);
    };

    // Initial Proposal test
    scenario.next_tx(ADMIN);
    {
        let proposal: Proposal = scenario.take_shared<Proposal>();
        assert!(proposal.title() == b"Title 1".to_string());
        assert!(proposal.description() == b"Description 1".to_string());
        let (upvotes, downvotes) = proposal.votes();
        assert!(upvotes == 0 && downvotes == 0);
        assert!(proposal.creator() == ADMIN);
        let expires_at = current_timestamp_ms + seven_days_ms;
        assert!(proposal.expires_at() == expires_at);
        test_scenario::return_shared(proposal);
    };

    scenario.end();
}
#[test]
#[expected_failure(abort_code = test_scenario::EEmptyInventory)]
fun test_create_proposal_with_no_admin_cap_failure() {
    let not_admin = @0x907Ad319;
    let mut scenario = test_scenario::begin(ADMIN);
    {
        dashboard::issue_admin_cap(scenario.ctx());
    };

    scenario.next_tx(not_admin);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();
        create_proposal(&admin_cap, scenario.ctx());
        test_scenario::return_to_sender(&scenario, admin_cap);
    };

    scenario.end();
}
