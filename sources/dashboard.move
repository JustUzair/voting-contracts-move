module voting_contracts::dashboard;

use voting_contracts::proposal::Proposal;

public struct AdminCapability has key {
    id: UID,
}

public struct Dashboard has key {
    id: UID,
    proposal_ids: vector<ID>,
}

fun init(ctx: &mut TxContext) {
    new(ctx);
    // Restricted Access to admin only
    transfer::transfer(AdminCapability { id: object::new(ctx) }, ctx.sender());
}

public fun new(ctx: &mut TxContext) {
    let dashboard: Dashboard = Dashboard {
        id: object::new(ctx),
        proposal_ids: vector[],
    };
    transfer::share_object(dashboard);
}

public fun register_proposal(self: &mut Dashboard, proposal_id: ID) {
    self.proposal_ids.push_back(proposal_id);
}

#[test_only]
public fun issue_admin_cap(ctx: &mut TxContext) {
    transfer::transfer(
        AdminCapability { id: object::new(ctx) },
        ctx.sender(),
    );
}

#[test]
fun test_module_init() {
    use sui::test_scenario;
    use std::debug;
    use voting_contracts::proposal::{Self, Proposal};

    let one_day_ms: u64 = 86400 * 1000; // 24 hours in milliseconds
    let seven_days_ms: u64 = 7 * one_day_ms;

    let creator = @0xCA;
    let voter1 = @0xA;
    let voter2 = @0xB;

    let mut scenario = test_scenario::begin(creator);

    let current_timestamp_ms = scenario.ctx().epoch_timestamp_ms();
    {
        init(scenario.ctx());
    };
    scenario.next_tx(creator);
    {
        let dashboard: Dashboard = scenario.take_shared<Dashboard>();
        assert!(dashboard.proposal_ids.is_empty());
        test_scenario::return_shared(dashboard);
    };

    // // Voting Scenario 1
    // scenario.next_tx(voter1);
    // {
    //     let proposal: Proposal = scenario.take_shared<Proposal>();
    //     test_scenario::return_shared(proposal);
    // };
    // // Voting Scenario 2
    // scenario.next_tx(voter2);
    // {
    //     let proposal: Proposal = scenario.take_shared<Proposal>();
    //     test_scenario::return_shared(proposal);
    // };

    scenario.end();
}
