#[allow(unused_use)]
#[test_only]
module voting_contracts::proposals_tests;

use std::debug;
use sui::test_scenario::{Self, take_shared, return_shared};
use voting_contracts::dashboard::{Self, AdminCapability, DashboardConfig, Dashboard};
use voting_contracts::proposal::{Self, Proposal, E_ADMIN_VOTE, E_DUPLICATE_VOTE, ProofOfVoteNFT};
use voting_contracts::utils::{create_proposal, create_and_register_proposal};

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
        dashboard.register_proposal(&admin_cap, proposal_id);
        let proposals = dashboard.get_proposal_ids();
        debug::print(&b"----- All Proposal IDs -----".to_string());
        debug::print(&proposals);
        assert!(proposals.length() == 1 && proposals.contains(&proposal_id));

        test_scenario::return_shared(dashboard);
        test_scenario::return_to_sender(&scenario, admin_cap);
    };

    scenario.end();
}

#[test]
#[expected_failure(abort_code = test_scenario::EEmptyInventory)] // Admin Cap Failure
public fun test_register_proposal_as_non_admin() {
    let admin = @0xAd319;
    let user = @0x123;
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

    scenario.next_tx(user);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();
        let proposal_id = create_proposal(&admin_cap, scenario.ctx());
        debug::print(&b"----- Proposal ID -----".to_string());
        debug::print(&proposal_id);
        let mut dashboard = test_scenario::take_shared<Dashboard>(&scenario);
        dashboard.register_proposal(&admin_cap, proposal_id);
        let proposals = dashboard.get_proposal_ids();
        debug::print(&b"----- All Proposal IDs -----".to_string());
        debug::print(&proposals);
        assert!(proposals.length() == 1 && proposals.contains(&proposal_id));

        test_scenario::return_shared(dashboard);
        test_scenario::return_to_sender(&scenario, admin_cap);
    };

    scenario.end();
}

#[test]
public fun test_proposal_upvote() {
    let voter = @0xA01e9;
    create_and_register_proposal();

    // Get proposal id after proposal creation and registration
    let mut scenario = test_scenario::begin(voter);
    {
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        assert!(!proposal.has_voted(voter));
        proposal.vote(scenario.ctx(), true);
        assert!(proposal.has_voted(voter));
        debug::print(&b"----- Voter has voted? -----".to_string());
        debug::print(&proposal.has_voted(voter));
        let (upvotes_count, downvotes_count) = proposal.votes();
        assert!(upvotes_count == 1 && downvotes_count == 0);
        debug::print(&b"----- Up-Votes -----".to_string());
        debug::print(&upvotes_count);
        debug::print(&b"----- Down-Votes -----".to_string());
        debug::print(&downvotes_count);
        test_scenario::return_shared(proposal);
    };

    scenario.end();
}

#[test]
public fun test_proposal_downvote() {
    let voter = @0xA01e9;
    create_and_register_proposal();

    // Get proposal id after proposal creation and registration
    let mut scenario = test_scenario::begin(voter);
    {
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        assert!(!proposal.has_voted(voter));
        proposal.vote(scenario.ctx(), false);
        assert!(proposal.has_voted(voter));
        debug::print(&b"----- Voter has voted? -----".to_string());
        debug::print(&proposal.has_voted(voter));
        let (upvotes_count, downvotes_count) = proposal.votes();
        assert!(upvotes_count == 0 && downvotes_count == 1);
        debug::print(&b"----- Up-Votes -----".to_string());
        debug::print(&upvotes_count);
        debug::print(&b"----- Down-Votes -----".to_string());
        debug::print(&downvotes_count);
        test_scenario::return_shared(proposal);
    };

    scenario.end();
}

#[test]
#[expected_failure(abort_code = proposal::E_ADMIN_VOTE)]

public fun test_proposal_admin_cannot_vote() {
    let admin = @0xAd319;
    let voter = admin;
    create_and_register_proposal();

    // Get proposal id after proposal creation and registration
    let mut scenario = test_scenario::begin(voter);
    {
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        assert!(!proposal.has_voted(voter));
        proposal.vote(scenario.ctx(), false);
        assert!(proposal.has_voted(voter));
        debug::print(&b"----- Voter has voted? -----".to_string());
        debug::print(&proposal.has_voted(voter));
        let (upvotes_count, downvotes_count) = proposal.votes();
        assert!(upvotes_count == 0 && downvotes_count == 1);
        debug::print(&b"----- Up-Votes -----".to_string());
        debug::print(&upvotes_count);
        debug::print(&b"----- Down-Votes -----".to_string());
        debug::print(&downvotes_count);
        test_scenario::return_shared(proposal);
    };

    scenario.end();
}

#[test]
#[expected_failure(abort_code = proposal::E_DUPLICATE_VOTE)]
public fun test_duplicate_votes_failure() {
    let voter = @0xA01e9;
    create_and_register_proposal();

    // Get proposal id after proposal creation and registration
    let mut scenario = test_scenario::begin(voter);
    {
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        proposal.vote(scenario.ctx(), true);
        proposal.vote(scenario.ctx(), true);
        test_scenario::return_shared(proposal);
    };

    scenario.end();
}

#[test]
public fun test_mint_nft_for_valid_votes() {
    let voter = @0xA01e9;
    create_and_register_proposal();

    // Get proposal id after proposal creation and registration
    let mut scenario = test_scenario::begin(voter);
    {
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        proposal.vote(scenario.ctx(), true);

        test_scenario::return_shared(proposal);
    };
    scenario.next_tx(voter);
    {
        let povNft = test_scenario::take_from_sender<ProofOfVoteNFT>(&scenario);
        debug::print(&povNft);
        assert!(povNft.getVoteType() == b"upvote".to_string());
        test_scenario::return_to_sender(&scenario, povNft);
    };

    scenario.end();
}
