module voting_contracts::dashboard;

use voting_contracts::proposal::Proposal;

const E_NOT_ADMIN: u64 = 1;

public struct AdminCapability has key {
    id: UID,
}

public struct Dashboard has key {
    id: UID,
    proposal_ids: vector<ID>,
}

/*
 * @dev Hot Potato
 * @dev A struct with no abilities (copy, drop, etc)
 * @dev hot potato is used to ensure that the borrowed value, when taken from the container, is returned back to it
 * @docs refer to https://move-book.com/programmability/hot-potato-pattern
*/
public struct DashboardConfig {
    dashboard_owner: address,
}

/*
 * @dev OTW - One Time Witness, all caps naming same as module
 * @dev ensures that a function with otw capability can only be init once
 * @dev otw cannot be initialized manually
 * @docs refer to https://move-book.com/programmability/one-time-witness/
*/
public struct DASHBOARD has drop {}

/*
 * @param ctx - TxContext
 * @dev Init function that transfers admin capability to the sender
*/
fun init(one_time_witness: DASHBOARD, ctx: &mut TxContext) {
    let admin_cap = AdminCapability { id: object::new(ctx) };
    let config = DashboardConfig { dashboard_owner: ctx.sender() };
    // Restricted Access to admin only
    new(one_time_witness, &admin_cap, ctx, config);
    transfer::transfer(admin_cap, ctx.sender());
}

/*
 * @param _admin_cap - Admin Capability to allow only sender with Admin access to  create a dashboard
 * @param ctx - TxContext 
 * @dev Only callable from init function
 * @dev Only able to create a dashboard upon initialization of contracts
*/
public fun new(
    _one_time_witness: DASHBOARD,
    _admin_cap: &AdminCapability,
    ctx: &mut TxContext,
    config: DashboardConfig,
) {
    let DashboardConfig { dashboard_owner } = config;
    assert!(ctx.sender() == dashboard_owner, E_NOT_ADMIN);
    let dashboard: Dashboard = Dashboard {
        id: object::new(ctx),
        proposal_ids: vector[],
    };
    transfer::share_object(dashboard);
}

/*
 * @param self - Dashboard object to mutate self properties and structs
 * @param proposal_id - Proposal ID to push into the proposal id array

*/
public fun register_proposal(self: &mut Dashboard, proposal_id: ID) {
    self.proposal_ids.push_back(proposal_id);
}

/*
 * @dev Test only function to simulate scenarios for test cases
*/
#[test_only]
/*
 * @param ctx - TxContext 
 * @dev Transfers admin capability to sender
*/
public fun issue_admin_cap(ctx: &mut TxContext) {
    transfer::transfer(
        AdminCapability { id: object::new(ctx) },
        ctx.sender(),
    );
}

#[test]
fun test_module_init() {
    use sui::test_scenario;

    let creator = @0xCA;

    let mut scenario = test_scenario::begin(creator);

    {
        let one_time_witness = DASHBOARD {};
        init(one_time_witness, scenario.ctx());
    };
    scenario.next_tx(creator);
    {
        let dashboard: Dashboard = scenario.take_shared<Dashboard>();
        assert!(dashboard.proposal_ids.is_empty());
        test_scenario::return_shared(dashboard);
    };

    scenario.end();
}
