module voting_contracts::dashboard;

use std::string::String;
use sui::event;
use sui::types;

// ########## Constants ##########
const E_DUPLICATE_PROPOSAL: u64 = 0;
const E_NOT_ADMIN: u64 = 1;
const E_NOT_ONE_TIME_WITNESS: u64 = 2;

// ########## Events ##########
public struct DashboardCreation has copy, drop {
    id: ID,
    owner: address,
    message: String,
}

public struct DashboardModuleInit has copy, drop { message: String }

public struct ProposalRegistered has copy, drop {
    proposal_id: ID,
}

// ########## Structs ##########

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

// ########## Constructor ##########
/*
 * @param ctx - TxContext
 * @dev Init function that transfers admin capability to the sender
*/
fun init(one_time_witness: DASHBOARD, ctx: &mut TxContext) {
    let admin_cap = AdminCapability { id: object::new(ctx) };
    let config = DashboardConfig { dashboard_owner: ctx.sender() };
    event::emit(DashboardModuleInit {
        message: b"Dashboard Init Successful".to_string(),
    });
    // Restricted Access to admin only
    new(one_time_witness, &admin_cap, ctx, config);
    transfer::transfer(admin_cap, ctx.sender());
}

// ########## Functions ##########
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
    assert!(types::is_one_time_witness(&_one_time_witness), E_NOT_ONE_TIME_WITNESS);
    let DashboardConfig { dashboard_owner } = config;
    assert!(ctx.sender() == dashboard_owner, E_NOT_ADMIN);
    let dashboard: Dashboard = Dashboard {
        id: object::new(ctx),
        proposal_ids: vector[],
    };
    event::emit(DashboardCreation {
        id: object::id(&dashboard),
        owner: ctx.sender(),
        message: b"Dashboard Created".to_string(),
    });
    transfer::share_object(dashboard);
}

/*
 * @param self - Dashboard object to mutate self properties and structs
 * @param proposal_id - Proposal ID to push into the proposal id array
 * @dev only admin can register proposals
*/
public fun register_proposal(self: &mut Dashboard, _admin_cap: &AdminCapability, proposal_id: ID) {
    assert!(!self.proposal_ids.contains(&proposal_id), E_DUPLICATE_PROPOSAL);
    event::emit(ProposalRegistered {
        proposal_id,
    });
    self.proposal_ids.push_back(proposal_id);
}

// ########## Public Function ##########
public fun get_proposal_ids(self: &mut Dashboard): vector<ID> {
    return self.proposal_ids
}
// ########## Test-Only Function ##########
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

#[test_only]
/*
 * @dev Creates a one time witness for testing
*/
public fun issue_one_time_witness(): DASHBOARD {
    DASHBOARD {}
}

#[test_only]
/*
 * @dev Creates a one time witness for testing
*/
public fun issue_admin_config(ctx: &TxContext): DashboardConfig {
    DashboardConfig {
        dashboard_owner: ctx.sender(),
    }
}

// ########## Tests ##########

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
