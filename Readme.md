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

- e.g: https://suiscan.xyz/testnet/tx/5zVsPjNKwVhhPZa63TfRfCSD4ja1ZrsJ347qYRaXtiG9

```bash
sui client publish --gas-budget 1000000 --dry-run
```

### Sample Output

```shell
Transaction Digest: 5zVsPjNKwVhhPZa63TfRfCSD4ja1ZrsJ347qYRaXtiG9
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                   │
│ Gas Owner: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                │
│ Gas Budget: 27718400 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                                    │
│  │ Version: 373126717                                                                                        │
│  │ Digest: zc65z3M2rhfqJhTXPEgi3PqiysctB5rCgJgF7XGRLu4                                                       │
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
│    3oP+fdwz1fKhzYoHGK2xhZDBUUZhdnXQROzF7+FvX9ByvysREHF3z76ca1h9mHtLDed+mYEOuHpVXbwqrgb+CQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5zVsPjNKwVhhPZa63TfRfCSD4ja1ZrsJ347qYRaXtiG9                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 781                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x40152fdb28c8618d99b1d1eda0d3c7ee5ed376013f58e6b113ffc93fdd2b8d02                         │
│  │ Owner: Shared( 373126718 )                                                                     │
│  │ Version: 373126718                                                                             │
│  │ Digest: 8NMwFsDwrX4Af1sWz688M2sqMg5cKa5TksS2KgzTJm2N                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xd4af5063e27612ae68cd039f9fc802ca48e2b46644c67c6cc6cce4af2aa38a01                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126718                                                                             │
│  │ Digest: FRgbYkyW6odxTZw3W2q4hTQmDHPxLgL4jtYD7aootFYt                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xef01af0449a408038915afe04a36d36479bc26ccfdd91d9e67fd85251aba0bf8                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 4cquvBQGbvK4DpXNnHaU9ZxvyVMUZTHBhkQqCjLTup3i                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf6fe5663ac3fcfde9766d237b70a422118fe3a4e6fdd8504588006417b4860a2                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126718                                                                             │
│  │ Digest: HHQWJoVRWJAWAcZ6uWZU2nQA9nF2FjepCDdXUgKPkQsa                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126718                                                                             │
│  │ Digest: AuYDMXfzyJ7xbMohggaZQM97KwjPa1FxwY32N5hCd8Cx                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126718                                                                             │
│  │ Digest: AuYDMXfzyJ7xbMohggaZQM97KwjPa1FxwY32N5hCd8Cx                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 25718400 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2uvg3HheUT45CWZRSRfdcHxA6ewqeWpxCVPZUdJLuD66                                                   │
│    6pZ2bpkwLwnCH4qdHS1NcJypXLFUNvSHRKfKXhZvXQuo                                                   │
│    DTP2T8PZLMUMRKJzcnDo5XeyW1cJaP1s2Pj2ExBuVW4a                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                             │
│  │ EventID: 5zVsPjNKwVhhPZa63TfRfCSD4ja1ZrsJ347qYRaXtiG9:0                                                       │
│  │ PackageID: 0xef01af0449a408038915afe04a36d36479bc26ccfdd91d9e67fd85251aba0bf8                                 │
│  │ Transaction Module: dashboard                                                                                 │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                    │
│  │ EventType: 0xef01af0449a408038915afe04a36d36479bc26ccfdd91d9e67fd85251aba0bf8::dashboard::DashboardModuleInit │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌─────────┬───────────────────────────┐                                                                     │
│  │   │ message │ Dashboard Init Successful │                                                                     │
│  │   └─────────┴───────────────────────────┘                                                                     │
│  └──                                                                                                             │
│  ┌──                                                                                                             │
│  │ EventID: 5zVsPjNKwVhhPZa63TfRfCSD4ja1ZrsJ347qYRaXtiG9:1                                                       │
│  │ PackageID: 0xef01af0449a408038915afe04a36d36479bc26ccfdd91d9e67fd85251aba0bf8                                 │
│  │ Transaction Module: dashboard                                                                                 │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                    │
│  │ EventType: 0xef01af0449a408038915afe04a36d36479bc26ccfdd91d9e67fd85251aba0bf8::dashboard::DashboardCreation   │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌─────────┬────────────────────────────────────────────────────────────────────┐                            │
│  │   │ id      │ 0x40152fdb28c8618d99b1d1eda0d3c7ee5ed376013f58e6b113ffc93fdd2b8d02 │                            │
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
│  │ ObjectID: 0x40152fdb28c8618d99b1d1eda0d3c7ee5ed376013f58e6b113ffc93fdd2b8d02                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Shared( 373126718 )                                                                                  │
│  │ ObjectType: 0xef01af0449a408038915afe04a36d36479bc26ccfdd91d9e67fd85251aba0bf8::dashboard::Dashboard        │
│  │ Version: 373126718                                                                                          │
│  │ Digest: 8NMwFsDwrX4Af1sWz688M2sqMg5cKa5TksS2KgzTJm2N                                                        │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xd4af5063e27612ae68cd039f9fc802ca48e2b46644c67c6cc6cce4af2aa38a01                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                        │
│  │ Version: 373126718                                                                                          │
│  │ Digest: FRgbYkyW6odxTZw3W2q4hTQmDHPxLgL4jtYD7aootFYt                                                        │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xf6fe5663ac3fcfde9766d237b70a422118fe3a4e6fdd8504588006417b4860a2                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0xef01af0449a408038915afe04a36d36479bc26ccfdd91d9e67fd85251aba0bf8::dashboard::AdminCapability  │
│  │ Version: 373126718                                                                                          │
│  │ Digest: HHQWJoVRWJAWAcZ6uWZU2nQA9nF2FjepCDdXUgKPkQsa                                                        │
│  └──                                                                                                           │
│ Mutated Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                  │
│  │ Version: 373126718                                                                                          │
│  │ Digest: AuYDMXfzyJ7xbMohggaZQM97KwjPa1FxwY32N5hCd8Cx                                                        │
│  └──                                                                                                           │
│ Published Objects:                                                                                             │
│  ┌──                                                                                                           │
│  │ PackageID: 0xef01af0449a408038915afe04a36d36479bc26ccfdd91d9e67fd85251aba0bf8                               │
│  │ Version: 1                                                                                                  │
│  │ Digest: 4cquvBQGbvK4DpXNnHaU9ZxvyVMUZTHBhkQqCjLTup3i                                                        │
│  │ Modules: dashboard, proposal                                                                                │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -25740280                                                                              │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯

```

# Building Transactions

```bash
sui client call \
--package 0x3cb8e7d5f4b7b405c385172f11f38a32dcda240c429cef0c666bda4b39512e52 \
--module dashboard \
--function create_proposal \
--args "Proposal 1" "Proposal Description 1" 1753172826
```

# Build, preview, and execute programmable transaction blocks.

- add `--dry-run` to preview the tx and state changes

```bash
sui client ptb \
--move-call 0x3cb8e7d5f4b7b405c385172f11f38a32dcda240c429cef0c666bda4b39512e52::dashboard::create_proposal \
'"Proposal 2"' \
'"Proposal Description 2"' \
1753172826

```

# Multi-Move Calls

- e.g: https://suiscan.xyz/testnet/object/0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c/tx-blocks

```bash
sui client ptb \
--move-call 0x3cb8e7d5f4b7b405c385172f11f38a32dcda240c429cef0c666bda4b39512e52::dashboard::create_proposal  '"Proposal 3"' '"Proposal Description 3"' 1753172826 \
--move-call 0x3cb8e7d5f4b7b405c385172f11f38a32dcda240c429cef0c666bda4b39512e52::dashboard::create_proposal  '"Proposal 4"' '"Proposal Description 4"' 1753172826 \
--move-call 0x3cb8e7d5f4b7b405c385172f11f38a32dcda240c429cef0c666bda4b39512e52::dashboard::create_proposal  '"Proposal 5"' '"Proposal Description 5"' 1753172826 \
--dry-run
```

## Executing Proposal(V2) Creation and Registration

```bash
sui client ptb \
--move-call 0xef01af0449a408038915afe04a36d36479bc26ccfdd91d9e67fd85251aba0bf8::proposal::create \
@0xf6fe5663ac3fcfde9766d237b70a422118fe3a4e6fdd8504588006417b4860a2 \
'"Proposal V2"' '"Proposal Description V2"' 1753172826 \
--assign proposal_id \
--move-call 0xef01af0449a408038915afe04a36d36479bc26ccfdd91d9e67fd85251aba0bf8::dashboard::register_proposal \
@0x40152fdb28c8618d99b1d1eda0d3c7ee5ed376013f58e6b113ffc93fdd2b8d02 proposal_id --dry-run
```

### Proposal(V2) Creation & Registration Results

```shell

```

# View Wallets

```bash
sui client addresses
```
