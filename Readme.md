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

- e.g: https://suiscan.xyz/testnet/tx/DTP2T8PZLMUMRKJzcnDo5XeyW1cJaP1s2Pj2ExBuVW4a

```bash
sui client publish --gas-budget 1000000 --dry-run
```

Sample Output

```shell
Dry run completed, execution status: success
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Dry Run Transaction Data                                                                                     │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                   │
│ Gas Owner: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                │
│ Gas Budget: 50000000000000 MIST                                                                              │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│                                                                                                              │
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
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4U5N3cLcZJQytFfc2nqHeQ5MYTpxULdTMJmZH3kkNJrb                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 781                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x248801e8b88bc1002ca23f29e401aac3b390acd471bf5d85c174dea19b0e504f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 7TTbf78eknDhBRz3d8WCFvvhWDzmjShhdC5qFR1ttcc7                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x90194b65ddda3254892f863ad5ca7dd2d88cc4571274ee654b8ecb6ad679109e                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 2                                                                                     │
│  │ Digest: KBMLPUx5qmmstFPPLosaMJ9VhgZv7xjwUUWCeZYZ726                                            │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x9fc1aa00166dfdcb4780dd0f4b48c092258036f9072433d31e190b233ba15f64                         │
│  │ Owner: Shared( 2 )                                                                             │
│  │ Version: 2                                                                                     │
│  │ Digest: HibAcgqQYvhsuFC2GT7ckvPSdKcTfrSTB7KQEeE58mjQ                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xde99bafcde18d150c52a980f2b259b0b3ec8028b072545a729d4a97522a39963                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 2                                                                                     │
│  │ Digest: G3uouuPexpNiP9E15JgXAZyyAoxGGfUS2EUgpxiJd4Ep                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x162a4a772a9408dac0f43b88461b681844d44e6dfef7b32a981cec72d3616231                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 2                                                                                     │
│  │ Digest: 7sdCioWa3vViwEpwCtCrtXU3XpYCtfRMdyxqbeENaPKW                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x162a4a772a9408dac0f43b88461b681844d44e6dfef7b32a981cec72d3616231                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 2                                                                                     │
│  │ Digest: 7sdCioWa3vViwEpwCtCrtXU3XpYCtfRMdyxqbeENaPKW                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 24867200 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 0 MIST                                                                         │
│    Non-refundable Storage Fee: 0 MIST                                                             │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2uvg3HheUT45CWZRSRfdcHxA6ewqeWpxCVPZUdJLuD66                                                   │
│    6pZ2bpkwLwnCH4qdHS1NcJypXLFUNvSHRKfKXhZvXQuo                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                             │
│  │ EventID: 4U5N3cLcZJQytFfc2nqHeQ5MYTpxULdTMJmZH3kkNJrb:0                                                       │
│  │ PackageID: 0x248801e8b88bc1002ca23f29e401aac3b390acd471bf5d85c174dea19b0e504f                                 │
│  │ Transaction Module: dashboard                                                                                 │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                    │
│  │ EventType: 0x248801e8b88bc1002ca23f29e401aac3b390acd471bf5d85c174dea19b0e504f::dashboard::DashboardModuleInit │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌─────────┬───────────────────────────┐                                                                     │
│  │   │ message │ Dashboard Init Successful │                                                                     │
│  │   └─────────┴───────────────────────────┘                                                                     │
│  └──                                                                                                             │
│  ┌──                                                                                                             │
│  │ EventID: 4U5N3cLcZJQytFfc2nqHeQ5MYTpxULdTMJmZH3kkNJrb:1                                                       │
│  │ PackageID: 0x248801e8b88bc1002ca23f29e401aac3b390acd471bf5d85c174dea19b0e504f                                 │
│  │ Transaction Module: dashboard                                                                                 │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                    │
│  │ EventType: 0x248801e8b88bc1002ca23f29e401aac3b390acd471bf5d85c174dea19b0e504f::dashboard::DashboardCreation   │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌─────────┬────────────────────────────────────────────────────────────────────┐                            │
│  │   │ id      │ 0x9fc1aa00166dfdcb4780dd0f4b48c092258036f9072433d31e190b233ba15f64 │                            │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                            │
│  │   │ message │ Dashboard Created                                                  │                            │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                            │
│  │   │ owner   │ 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b │                            │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                            │
│  └──                                                                                                             │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                 │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x90194b65ddda3254892f863ad5ca7dd2d88cc4571274ee654b8ecb6ad679109e                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                        │
│  │ Version: 2                                                                                                  │
│  │ Digest: KBMLPUx5qmmstFPPLosaMJ9VhgZv7xjwUUWCeZYZ726                                                         │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x9fc1aa00166dfdcb4780dd0f4b48c092258036f9072433d31e190b233ba15f64                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Shared( 2 )                                                                                          │
│  │ ObjectType: 0x248801e8b88bc1002ca23f29e401aac3b390acd471bf5d85c174dea19b0e504f::dashboard::Dashboard        │
│  │ Version: 2                                                                                                  │
│  │ Digest: HibAcgqQYvhsuFC2GT7ckvPSdKcTfrSTB7KQEeE58mjQ                                                        │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xde99bafcde18d150c52a980f2b259b0b3ec8028b072545a729d4a97522a39963                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0x248801e8b88bc1002ca23f29e401aac3b390acd471bf5d85c174dea19b0e504f::dashboard::AdminCapability  │
│  │ Version: 2                                                                                                  │
│  │ Digest: G3uouuPexpNiP9E15JgXAZyyAoxGGfUS2EUgpxiJd4Ep                                                        │
│  └──                                                                                                           │
│ Mutated Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x162a4a772a9408dac0f43b88461b681844d44e6dfef7b32a981cec72d3616231                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                  │
│  │ Version: 2                                                                                                  │
│  │ Digest: 7sdCioWa3vViwEpwCtCrtXU3XpYCtfRMdyxqbeENaPKW                                                        │
│  └──                                                                                                           │
│ Published Objects:                                                                                             │
│  ┌──                                                                                                           │
│  │ PackageID: 0x248801e8b88bc1002ca23f29e401aac3b390acd471bf5d85c174dea19b0e504f                               │
│  │ Version: 1                                                                                                  │
│  │ Digest: 7TTbf78eknDhBRz3d8WCFvvhWDzmjShhdC5qFR1ttcc7                                                        │
│  │ Modules: dashboard, proposal                                                                                │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No balance changes          │
╰─────────────────────────────╯
Dry run completed, execution status: success
Estimated gas cost (includes a small buffer): 26867200 MIST

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

# View Wallets

```bash
sui client addresses
```
