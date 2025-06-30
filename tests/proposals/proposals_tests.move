#[allow(unused_use)]
#[test_only]
module voting_contracts::proposals_tests;

use std::debug;
use sui::test_scenario::{Self, take_shared, return_shared};
use voting_contracts::dashboard::{Self, AdminCapability, DashboardConfig, Dashboard};
use voting_contracts::proposal::{Self, Proposal};
use voting_contracts::utils::create_proposal;

#[test]
public fun test_register_proposal_as_admin() {
    let admin = @0xAd319;

    let mut scenario = test_scenario::begin(admin);
    {
        dashboard::issue_admin_cap(scenario.ctx());
    };

    scenario.next_tx(admin);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();

        let one_time_witness = dashboard::issue_one_time_witness();
        let dashboard_config = dashboard::issue_admin_config(scenario.ctx());
        dashboard::new(one_time_witness, &admin_cap, scenario.ctx(), dashboard_config);

        test_scenario::return_to_sender(&scenario, admin_cap);
    };

    scenario.next_tx(admin);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();
        let proposal_id = create_proposal(&admin_cap, scenario.ctx());
        debug::print(&b"----- Proposal ID -----".to_string());
        debug::print(&proposal_id);
        let mut dashboard = test_scenario::take_shared<Dashboard>(&scenario);
        dashboard.register_proposal(proposal_id);
        let proposals = dashboard.get_proposal_ids();
        debug::print(&b"----- All Proposal IDs -----".to_string());
        debug::print(&proposals);
        assert!(proposals.length() == 1 && proposals.contains(&proposal_id));

        test_scenario::return_shared(dashboard);
        test_scenario::return_to_sender(&scenario, admin_cap);
    };

    scenario.end();
}

// public fun test_register_proposal_as_non_admin() {
//     let admin = @0xAd319;
//     let user = @0xb539;
//     let mut scenario = test_scenario::begin(admin);
//     {
//         dashboard::issue_admin_cap(scenario.ctx());
//     };
//     {
//         let admin_cap = scenario.take_from_sender<AdminCapability>();
//         let one_time_witness = dashboard::issue_one_time_witness();
//         let config = scenario.take_from_sender<DashboardConfig>();
//         dashboard::new(one_time_witness, &admin_cap, scenario.ctx(), config);
//     };
//     scenario.next_tx(user);
//     {};
//     scenario.end();
// }
