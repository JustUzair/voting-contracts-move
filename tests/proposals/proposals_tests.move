#[allow(unused_use)]
#[test_only]
module voting_contracts::proposals_tests;

use std::debug;
use sui::clock::{Self, Clock};
use sui::test_scenario::{Self, take_shared, return_shared};
use voting_contracts::dashboard::{
    Self,
    AdminCapability,
    DashboardConfig,
    Dashboard,
    issue_admin_cap
};
use voting_contracts::proposal::{
    Self,
    Proposal,
    E_ADMIN_VOTE,
    E_DUPLICATE_VOTE,
    ProofOfVoteNFT,
    E_PROPOSAL_STATUS_NOT_CHANGED,
    E_PROPOSAL_NOT_ACTIVE,
    ProposalStatus,
    enum_active,
    enum_ended
};
use voting_contracts::utils::{create_proposal, create_and_register_proposal, get_clock};

// Constants for test files
const ADMIN: address = @0xAd319;
const VOTER: address = @0xA01e9;
#[test]
public fun test_register_proposal_as_admin() { let mut scenario = test_scenario::begin(ADMIN); {
        dashboard::issue_admin_cap(scenario.ctx());
    }; scenario.next_tx(ADMIN); {
        let admin_cap = scenario.take_from_sender<AdminCapability>();

        let one_time_witness = dashboard::issue_one_time_witness();
        let dashboard_config = dashboard::issue_admin_config(scenario.ctx());
        dashboard::new(one_time_witness, &admin_cap, scenario.ctx(), dashboard_config);

        test_scenario::return_to_sender(&scenario, admin_cap);
    }; scenario.next_tx(ADMIN); {
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
    }; scenario.end(); }

#[test]
#[expected_failure(abort_code = test_scenario::EEmptyInventory)] // Admin Cap Failure
public fun test_register_proposal_as_non_admin() {
    let user = @0x123;
    let mut scenario = test_scenario::begin(ADMIN);
    {
        dashboard::issue_admin_cap(scenario.ctx());
    };

    scenario.next_tx(ADMIN);
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
    create_and_register_proposal();

    // Get proposal id after proposal creation and registration
    let mut scenario = test_scenario::begin(VOTER);
    {
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        let mut test_clock = clock::create_for_testing(scenario.ctx());
        test_clock.set_for_testing(86400000);
        assert!(!proposal.has_voted(VOTER));
        proposal.vote(scenario.ctx(), &test_clock, true);
        assert!(proposal.has_voted(VOTER));
        debug::print(&b"----- Voter has voted? -----".to_string());
        debug::print(&proposal.has_voted(VOTER));
        let (upvotes_count, downvotes_count) = proposal.votes();
        assert!(upvotes_count == 1 && downvotes_count == 0);
        debug::print(&b"----- Up-Votes -----".to_string());
        debug::print(&upvotes_count);
        debug::print(&b"----- Down-Votes -----".to_string());
        debug::print(&downvotes_count);
        test_clock.destroy_for_testing();
        test_scenario::return_shared(proposal);
    };

    scenario.end();
}

#[test]
public fun test_proposal_downvote() {
    create_and_register_proposal();

    // Get proposal id after proposal creation and registration
    let mut scenario = test_scenario::begin(VOTER);
    {
        let mut test_clock = clock::create_for_testing(scenario.ctx());
        test_clock.set_for_testing(86400000);
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        assert!(!proposal.has_voted(VOTER));
        proposal.vote(scenario.ctx(), &test_clock, false);
        assert!(proposal.has_voted(VOTER));
        debug::print(&b"----- Voter has voted? -----".to_string());
        debug::print(&proposal.has_voted(VOTER));
        let (upvotes_count, downvotes_count) = proposal.votes();
        assert!(upvotes_count == 0 && downvotes_count == 1);
        debug::print(&b"----- Up-Votes -----".to_string());
        debug::print(&upvotes_count);
        debug::print(&b"----- Down-Votes -----".to_string());
        debug::print(&downvotes_count);
        test_clock.destroy_for_testing();
        test_scenario::return_shared(proposal);
    };

    scenario.end();
}

#[test]
#[expected_failure(abort_code = proposal::E_ADMIN_VOTE)]

public fun test_proposal_admin_cannot_vote() {
    create_and_register_proposal();

    // Get proposal id after proposal creation and registration
    let mut scenario = test_scenario::begin(ADMIN);
    {
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        let mut test_clock = clock::create_for_testing(scenario.ctx());
        test_clock.set_for_testing(86400000);
        assert!(!proposal.has_voted(ADMIN));
        proposal.vote(scenario.ctx(), &test_clock, true);
        assert!(proposal.has_voted(ADMIN));
        debug::print(&b"----- Voter has voted? -----".to_string());
        debug::print(&proposal.has_voted(ADMIN));
        let (upvotes_count, downvotes_count) = proposal.votes();
        assert!(upvotes_count == 0 && downvotes_count == 1);
        debug::print(&b"----- Up-Votes -----".to_string());
        debug::print(&upvotes_count);
        debug::print(&b"----- Down-Votes -----".to_string());
        debug::print(&downvotes_count);
        test_clock.destroy_for_testing();
        test_scenario::return_shared(proposal);
    };

    scenario.end();
}

#[test]
#[expected_failure(abort_code = proposal::E_DUPLICATE_VOTE)]
public fun test_duplicate_votes_failure() {
    create_and_register_proposal();

    // Get proposal id after proposal creation and registration
    let mut scenario = test_scenario::begin(VOTER);
    {
        let mut test_clock = clock::create_for_testing(scenario.ctx());
        test_clock.set_for_testing(86400000);
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);

        proposal.vote(scenario.ctx(), &test_clock, true);
        proposal.vote(scenario.ctx(), &test_clock, true);

        test_clock.destroy_for_testing();
        test_scenario::return_shared(proposal);
    };

    scenario.end();
}

#[test]
public fun test_mint_nft_for_valid_votes() {
    create_and_register_proposal();

    // Get proposal id after proposal creation and registration
    let mut scenario = test_scenario::begin(VOTER);
    {
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        let mut test_clock = clock::create_for_testing(scenario.ctx());
        test_clock.set_for_testing(86400000);
        proposal.vote(scenario.ctx(), &test_clock, true);
        test_clock.destroy_for_testing();

        test_scenario::return_shared(proposal);
    };
    scenario.next_tx(VOTER);
    {
        let povNft = test_scenario::take_from_sender<ProofOfVoteNFT>(&scenario);
        debug::print(&povNft);
        assert!(povNft.getVoteType() == b"upvote".to_string());
        test_scenario::return_to_sender(&scenario, povNft);
    };

    scenario.end();
}

#[test]
public fun test_proposal_status_change() {
    create_and_register_proposal();
    let mut scenario = test_scenario::begin(ADMIN);
    {
        dashboard::issue_admin_cap(scenario.ctx());
    };
    scenario.next_tx(ADMIN);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();

        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        debug::print(&b"Proposal Status before toggle".to_string());
        debug::print(proposal.status());
        assert!(proposal.status() == enum_active());
        proposal.change_proposal_status(&admin_cap, enum_ended());
        assert!(proposal.status() == enum_ended());
        debug::print(&b"Proposal Status after toggle".to_string());
        debug::print(proposal.status());
        test_scenario::return_shared(proposal);
        test_scenario::return_to_sender(&scenario, admin_cap);
    };
    scenario.end();
}

#[test]
#[expected_failure(abort_code = E_PROPOSAL_NOT_ACTIVE)]
public fun test_proposal_vote_not_allowed_after_proposal_end() {
    create_and_register_proposal();
    let mut scenario = test_scenario::begin(ADMIN);
    {
        dashboard::issue_admin_cap(scenario.ctx());
    };
    scenario.next_tx(ADMIN);
    {
        let admin_cap = scenario.take_from_sender<AdminCapability>();
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        proposal.change_proposal_status(&admin_cap, enum_ended());
        test_scenario::return_shared(proposal);
        test_scenario::return_to_sender(&scenario, admin_cap);
    };
    scenario.next_tx(VOTER);
    {
        let mut proposal = test_scenario::take_shared<Proposal>(&scenario);
        let mut test_clock = clock::create_for_testing(scenario.ctx());
        test_clock.set_for_testing(86400000);
        proposal.vote(scenario.ctx(), &test_clock, true);
        let (upvotes_count, downvotes_count) = proposal.votes();
        assert!(upvotes_count == 1 && downvotes_count == 0);
        test_clock.destroy_for_testing();
        test_scenario::return_shared(proposal);
    };
    scenario.end();
}
