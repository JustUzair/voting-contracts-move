# Installing and Building Contracts

```bash
sui move build
```

# Executing Tests

```bash
sui move test
```

# Publishing a Package (Deploying)

- `gas-budget` is optional

- e.g: https://suiscan.xyz/testnet/tx/EkFnPVJUB6mkSui88FdRsFcAkXNMPSqeKfcX3B6Bxvvc

```bash
sui client publish --gas-budget 1000000 --dry-run
```

### Publishing Output

```shell
sui client publish
[warning] Client/Server api version mismatch, client api version : 1.51.2, server api version : 1.51.1
[Note]: Dependency sources are no longer verified automatically during publication and upgrade. You can pass the `--verify-deps` option if you would like to verify them as part of publication or upgrade.
INCLUDING DEPENDENCY Bridge
INCLUDING DEPENDENCY SuiSystem
INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING voting_contracts
Skipping dependency verification
Transaction Digest: EkFnPVJUB6mkSui88FdRsFcAkXNMPSqeKfcX3B6Bxvvc
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                   │
│ Gas Owner: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                │
│ Gas Budget: 41892400 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                                    │
│  │ Version: 373126721                                                                                        │
│  │ Digest: 6r1SjrtnL1KTY7gp5vnrTQS2zK5Eoo4AmLqqynBDz5cc                                                      │
│  └──                                                                                                         │
│                                                                                                              │
│ Transaction Kind: Programmable                                                                               │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                                            │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Pure Arg: Type: address, Value: "0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮                                  │
│ │ Commands                                                                │                                  │
│ ├─────────────────────────────────────────────────────────────────────────┤                                  │
│ │ 0  Publish:                                                             │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Dependencies:                                                        │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000001 │                                  │
│ │  │   0x0000000000000000000000000000000000000000000000000000000000000002 │                                  │
│ │  └                                                                      │                                  │
│ │                                                                         │                                  │
│ │ 1  TransferObjects:                                                     │                                  │
│ │  ┌                                                                      │                                  │
│ │  │ Arguments:                                                           │                                  │
│ │  │   Result 0                                                           │                                  │
│ │  │ Address: Input  0                                                    │                                  │
│ │  └                                                                      │                                  │
│ ╰─────────────────────────────────────────────────────────────────────────╯                                  │
│                                                                                                              │
│ Signatures:                                                                                                  │
│    0VEgfaGGijbvCLoLfxlQ3Fl5lLvilsbmTuYtf3NvW9dUYRIu9FMNGISMitp6QU8jLjQU7WgVsLjcvohO5zxQAQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: EkFnPVJUB6mkSui88FdRsFcAkXNMPSqeKfcX3B6Bxvvc                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 785                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: H38HDV23AaeLeg7E5p4v6tvk6Hskd45WiGGDytuuTvHH                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd5ea00023549e62767b7ab0159e44e245165ab3b984feec83040bd1c653e072a                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126722                                                                             │
│  │ Digest: 5eysN4sqjCACFw8aGANhXCRx5uFhc1aUP2TvhTcE92Ts                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xecb0260c110c049353aff11db6d7834ee5f84d6b755146d2cdb24bac2eecd532                         │
│  │ Owner: Shared( 373126722 )                                                                     │
│  │ Version: 373126722                                                                             │
│  │ Digest: Hr5va4cr1amGR26r8pBUER7vCZsz2AUh9J9bVvhNuc1R                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf1fc940192b9a3f0711d76dc943597cde9758a87ae022c6edc9182adcd0466db                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126722                                                                             │
│  │ Digest: HUSznxdoRzBHVWQP2fxASmBKKdgsaJdvsY5X9RLX2mWA                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126722                                                                             │
│  │ Digest: AXJnJxuMMyXkoD1wodHfh1cMACGzt66YNmwtNNLDXamx                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126722                                                                             │
│  │ Digest: AXJnJxuMMyXkoD1wodHfh1cMACGzt66YNmwtNNLDXamx                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 39892400 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    ctCu6z8YXetd4KUYGfM56GeXTHPsXxH6WuAsrp4GdMj                                                    │
│    2uvg3HheUT45CWZRSRfdcHxA6ewqeWpxCVPZUdJLuD66                                                   │
│    6pZ2bpkwLwnCH4qdHS1NcJypXLFUNvSHRKfKXhZvXQuo                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                             │
│  │ EventID: EkFnPVJUB6mkSui88FdRsFcAkXNMPSqeKfcX3B6Bxvvc:0                                                       │
│  │ PackageID: 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf                                 │
│  │ Transaction Module: dashboard                                                                                 │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                    │
│  │ EventType: 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf::dashboard::DashboardModuleInit │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌─────────┬───────────────────────────┐                                                                     │
│  │   │ message │ Dashboard Init Successful │                                                                     │
│  │   └─────────┴───────────────────────────┘                                                                     │
│  └──                                                                                                             │
│  ┌──                                                                                                             │
│  │ EventID: EkFnPVJUB6mkSui88FdRsFcAkXNMPSqeKfcX3B6Bxvvc:1                                                       │
│  │ PackageID: 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf                                 │
│  │ Transaction Module: dashboard                                                                                 │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                    │
│  │ EventType: 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf::dashboard::DashboardCreation   │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌─────────┬────────────────────────────────────────────────────────────────────┐                            │
│  │   │ id      │ 0xecb0260c110c049353aff11db6d7834ee5f84d6b755146d2cdb24bac2eecd532 │                            │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                            │
│  │   │ message │ Dashboard Created                                                  │                            │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                            │
│  │   │ owner   │ 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b │                            │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                            │
│  └──                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                 │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xd5ea00023549e62767b7ab0159e44e245165ab3b984feec83040bd1c653e072a                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                        │
│  │ Version: 373126722                                                                                          │
│  │ Digest: 5eysN4sqjCACFw8aGANhXCRx5uFhc1aUP2TvhTcE92Ts                                                        │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xecb0260c110c049353aff11db6d7834ee5f84d6b755146d2cdb24bac2eecd532                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Shared( 373126722 )                                                                                  │
│  │ ObjectType: 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf::dashboard::Dashboard        │
│  │ Version: 373126722                                                                                          │
│  │ Digest: Hr5va4cr1amGR26r8pBUER7vCZsz2AUh9J9bVvhNuc1R                                                        │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xf1fc940192b9a3f0711d76dc943597cde9758a87ae022c6edc9182adcd0466db                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf::dashboard::AdminCapability  │
│  │ Version: 373126722                                                                                          │
│  │ Digest: HUSznxdoRzBHVWQP2fxASmBKKdgsaJdvsY5X9RLX2mWA                                                        │
│  └──                                                                                                           │
│ Mutated Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                  │
│  │ Version: 373126722                                                                                          │
│  │ Digest: AXJnJxuMMyXkoD1wodHfh1cMACGzt66YNmwtNNLDXamx                                                        │
│  └──                                                                                                           │
│ Published Objects:                                                                                             │
│  ┌──                                                                                                           │
│  │ PackageID: 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf                               │
│  │ Version: 1                                                                                                  │
│  │ Digest: H38HDV23AaeLeg7E5p4v6tvk6Hskd45WiGGDytuuTvHH                                                        │
│  │ Modules: dashboard, proposal                                                                                │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -39914280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

# Building Transactions

```bash
sui client call \
--package 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf \
--module dashboard \
--function create_proposal \
--args "Proposal 1" "Proposal Description 1" 1753172826
```

# Build, preview, and execute programmable transaction blocks.

- add `--dry-run` to preview the tx and state changes

```bash
sui client ptb \
--move-call 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf::dashboard::create_proposal \
'"Proposal 2"' \
'"Proposal Description 2"' \
1753172826

```

# Multi-Move Calls

- e.g: https://suiscan.xyz/testnet/object/0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c/tx-blocks

```bash
sui client ptb \
--move-call 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf::proposal::create @0xf1fc940192b9a3f0711d76dc943597cde9758a87ae022c6edc9182adcd0466db   '"Proposal 3"' '"Proposal Description 3"' 1753172826000 \
--move-call 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf::proposal::create @0xf1fc940192b9a3f0711d76dc943597cde9758a87ae022c6edc9182adcd0466db  '"Proposal 4"' '"Proposal Description 4"' 1753172826000 \
--move-call 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf::proposal::create @0xf1fc940192b9a3f0711d76dc943597cde9758a87ae022c6edc9182adcd0466db  '"Proposal 5"' '"Proposal Description 5"' 1753172826000 \
--dry-run
```

## Executing Proposal(V2) Creation and Registration

```bash
sui client ptb \
--move-call 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf::proposal::create \
@0xf1fc940192b9a3f0711d76dc943597cde9758a87ae022c6edc9182adcd0466db \
'"Proposal V2"' '"Proposal Description V2"' 1753172826000 \
--assign proposal_id \
--move-call 0xb5478f53d859d12ad14e6399eaff532fae2529ff71f576d8a762b73c29bd9acf::dashboard::register_proposal \
@0xecb0260c110c049353aff11db6d7834ee5f84d6b755146d2cdb24bac2eecd532 \
@0xf1fc940192b9a3f0711d76dc943597cde9758a87ae022c6edc9182adcd0466db proposal_id --dry-run

```

### Proposal(V2) Creation & Registration Results

https://suiscan.xyz/testnet/tx/HXKCeARRb9t54UF9eZnfyxHzvYnKxwrQ53juihuuDaGk

```bash

```

# View Wallets

```bash
sui client addresses
```
