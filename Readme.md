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

- e.g: https://suiscan.xyz/testnet/tx/4oe9qpDZkv3eEUgYhVrGehohE6Q8DhFLLehRDgMkDtpj

```bash
sui client publish --gas-budget 1000000 --dry-run
```

### Publishing Output

```shell
Transaction Digest: 4oe9qpDZkv3eEUgYhVrGehohE6Q8DhFLLehRDgMkDtpj
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                             │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                   │
│ Gas Owner: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                │
│ Gas Budget: 27741200 MIST                                                                                    │
│ Gas Price: 1000 MIST                                                                                         │
│ Gas Payment:                                                                                                 │
│  ┌──                                                                                                         │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                                    │
│  │ Version: 373126718                                                                                        │
│  │ Digest: AuYDMXfzyJ7xbMohggaZQM97KwjPa1FxwY32N5hCd8Cx                                                      │
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
│    vRYa7KS6Ja8Y3bENHHBpRS7tiXI9hZHh6pq2NrZOLXg0frGJf0OVWRx/l3kWsM24LPZHZd2duuBIyB+IFx35BQ==                  │
│                                                                                                              │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 4oe9qpDZkv3eEUgYhVrGehohE6Q8DhFLLehRDgMkDtpj                                              │
│ Status: Success                                                                                   │
│ Executed Epoch: 781                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x53192183396e5e07671a88faefc9fd109a6c584de77272ea38a8410459e33eaa                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126719                                                                             │
│  │ Digest: CKew3SbdGAKVBxLVvBQTuUhk9aikc9cXnLsxmxwpdFf8                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xaa9cd58e4c7e00f2a0b033c74958709ff3a101048d831722855c04dd819b0015                         │
│  │ Owner: Shared( 373126719 )                                                                     │
│  │ Version: 373126719                                                                             │
│  │ Digest: AcyZW6ekTvCP7SU8uBa4Nwrh4v1tDPk8M4hFDC5qt1qh                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 9F4DFkGxKY6NPSY1BtS9NnMN5K2EKgAJaYx5idSWYkiW                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf3abf566ff83c44d0307bff5379c7b6afc7c729eb0cabe0cf90417bbb386bb01                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126719                                                                             │
│  │ Digest: 5nnbFHPjGKTejaTqra75XyFE3n3PLy6AuE4UkN4CdJdb                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126719                                                                             │
│  │ Digest: 3niW76BByAPYE8sXqS8phwctmTZrGMXPSqgFuFbXgpKc                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126719                                                                             │
│  │ Digest: 3niW76BByAPYE8sXqS8phwctmTZrGMXPSqgFuFbXgpKc                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 25741200 MIST                                                                    │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 978120 MIST                                                                    │
│    Non-refundable Storage Fee: 9880 MIST                                                          │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    2uvg3HheUT45CWZRSRfdcHxA6ewqeWpxCVPZUdJLuD66                                                   │
│    5zVsPjNKwVhhPZa63TfRfCSD4ja1ZrsJ347qYRaXtiG9                                                   │
│    6pZ2bpkwLwnCH4qdHS1NcJypXLFUNvSHRKfKXhZvXQuo                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                         │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                             │
│  │ EventID: 4oe9qpDZkv3eEUgYhVrGehohE6Q8DhFLLehRDgMkDtpj:0                                                       │
│  │ PackageID: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f                                 │
│  │ Transaction Module: dashboard                                                                                 │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                    │
│  │ EventType: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::dashboard::DashboardModuleInit │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌─────────┬───────────────────────────┐                                                                     │
│  │   │ message │ Dashboard Init Successful │                                                                     │
│  │   └─────────┴───────────────────────────┘                                                                     │
│  └──                                                                                                             │
│  ┌──                                                                                                             │
│  │ EventID: 4oe9qpDZkv3eEUgYhVrGehohE6Q8DhFLLehRDgMkDtpj:1                                                       │
│  │ PackageID: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f                                 │
│  │ Transaction Module: dashboard                                                                                 │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                    │
│  │ EventType: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::dashboard::DashboardCreation   │
│  │ ParsedJSON:                                                                                                   │
│  │   ┌─────────┬────────────────────────────────────────────────────────────────────┐                            │
│  │   │ id      │ 0xaa9cd58e4c7e00f2a0b033c74958709ff3a101048d831722855c04dd819b0015 │                            │
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
│  │ ObjectID: 0x53192183396e5e07671a88faefc9fd109a6c584de77272ea38a8410459e33eaa                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0x2::package::UpgradeCap                                                                        │
│  │ Version: 373126719                                                                                          │
│  │ Digest: CKew3SbdGAKVBxLVvBQTuUhk9aikc9cXnLsxmxwpdFf8                                                        │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xaa9cd58e4c7e00f2a0b033c74958709ff3a101048d831722855c04dd819b0015                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Shared( 373126719 )                                                                                  │
│  │ ObjectType: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::dashboard::Dashboard        │
│  │ Version: 373126719                                                                                          │
│  │ Digest: AcyZW6ekTvCP7SU8uBa4Nwrh4v1tDPk8M4hFDC5qt1qh                                                        │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xf3abf566ff83c44d0307bff5379c7b6afc7c729eb0cabe0cf90417bbb386bb01                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::dashboard::AdminCapability  │
│  │ Version: 373126719                                                                                          │
│  │ Digest: 5nnbFHPjGKTejaTqra75XyFE3n3PLy6AuE4UkN4CdJdb                                                        │
│  └──                                                                                                           │
│ Mutated Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                  │
│  │ Version: 373126719                                                                                          │
│  │ Digest: 3niW76BByAPYE8sXqS8phwctmTZrGMXPSqgFuFbXgpKc                                                        │
│  └──                                                                                                           │
│ Published Objects:                                                                                             │
│  ┌──                                                                                                           │
│  │ PackageID: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f                               │
│  │ Version: 1                                                                                                  │
│  │ Digest: 9F4DFkGxKY6NPSY1BtS9NnMN5K2EKgAJaYx5idSWYkiW                                                        │
│  │ Modules: dashboard, proposal                                                                                │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -25763080                                                                              │
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
--move-call 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::proposal::create \
@0xf3abf566ff83c44d0307bff5379c7b6afc7c729eb0cabe0cf90417bbb386bb01 \
'"Proposal V2"' '"Proposal Description V2"' 1753172826 \
--assign proposal_id \
--move-call 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::dashboard::register_proposal \
@0xaa9cd58e4c7e00f2a0b033c74958709ff3a101048d831722855c04dd819b0015 \
@0xf3abf566ff83c44d0307bff5379c7b6afc7c729eb0cabe0cf90417bbb386bb01 proposal_id --dry-run

```

### Proposal(V2) Creation & Registration Results

https://suiscan.xyz/testnet/tx/ctCu6z8YXetd4KUYGfM56GeXTHPsXxH6WuAsrp4GdMj

```shell
uzair@Mac voting_contracts % sui client ptb \
--move-call 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::proposal::create \
@0xf3abf566ff83c44d0307bff5379c7b6afc7c729eb0cabe0cf90417bbb386bb01 \
'"Proposal V2"' '"Proposal Description V2"' 1753172826 \
--assign proposal_id \
--move-call 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::dashboard::register_proposal \
@0xaa9cd58e4c7e00f2a0b033c74958709ff3a101048d831722855c04dd819b0015 \
@0xf3abf566ff83c44d0307bff5379c7b6afc7c729eb0cabe0cf90417bbb386bb01 proposal_id
[warning] Client/Server api version mismatch, client api version : 1.51.2, server api version : 1.51.1
Transaction Digest: ctCu6z8YXetd4KUYGfM56GeXTHPsXxH6WuAsrp4GdMj
╭─────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data                                                                                │
├─────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                      │
│ Gas Owner: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                   │
│ Gas Budget: 5279932 MIST                                                                        │
│ Gas Price: 1000 MIST                                                                            │
│ Gas Payment:                                                                                    │
│  ┌──                                                                                            │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                       │
│  │ Version: 373126720                                                                           │
│  │ Digest: H6cy5bVVNk6mBsa3KhG7EhCrL83MiaHvZAaP1D3GFhf8                                         │
│  └──                                                                                            │
│                                                                                                 │
│ Transaction Kind: Programmable                                                                  │
│ ╭─────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects                                                                               │ │
│ ├─────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0   Imm/Owned Object ID: 0xf3abf566ff83c44d0307bff5379c7b6afc7c729eb0cabe0cf90417bbb386bb01 │ │
│ │ 1   Pure Arg: Type: 0x1::string::String, Value: "Proposal V2"                               │ │
│ │ 2   Pure Arg: Type: 0x1::string::String, Value: "Proposal Description V2"                   │ │
│ │ 3   Pure Arg: Type: u64, Value: "1753172826"                                                │ │
│ │ 4   Shared Object    ID: 0xaa9cd58e4c7e00f2a0b033c74958709ff3a101048d831722855c04dd819b0015 │ │
│ ╰─────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭──────────────────────────────────────────────────────────────────────────────────╮            │
│ │ Commands                                                                         │            │
│ ├──────────────────────────────────────────────────────────────────────────────────┤            │
│ │ 0  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  create                                                             │            │
│ │  │ Module:    proposal                                                           │            │
│ │  │ Package:   0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Input  1                                                                    │            │
│ │  │   Input  2                                                                    │            │
│ │  │   Input  3                                                                    │            │
│ │  └                                                                               │            │
│ │                                                                                  │            │
│ │ 1  MoveCall:                                                                     │            │
│ │  ┌                                                                               │            │
│ │  │ Function:  register_proposal                                                  │            │
│ │  │ Module:    dashboard                                                          │            │
│ │  │ Package:   0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f │            │
│ │  │ Arguments:                                                                    │            │
│ │  │   Input  4                                                                    │            │
│ │  │   Input  0                                                                    │            │
│ │  │   Result 0                                                                    │            │
│ │  └                                                                               │            │
│ ╰──────────────────────────────────────────────────────────────────────────────────╯            │
│                                                                                                 │
│ Signatures:                                                                                     │
│    95VilcMRahTrGgAqv0N8p0P6Jh1FAHXmm/L9oYykyEF0kUpPf4mkRm3wWzDGctN/mXQHAFVRk4fumm/8wy9eBw==     │
│                                                                                                 │
╰─────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects                                                                               │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: ctCu6z8YXetd4KUYGfM56GeXTHPsXxH6WuAsrp4GdMj                                               │
│ Status: Success                                                                                   │
│ Executed Epoch: 781                                                                               │
│                                                                                                   │
│ Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x1ce30ebed10c250cb8b98fb1f507dc7de48d6c13628018e2d776acc3f9e2ee78                         │
│  │ Owner: Shared( 373126721 )                                                                     │
│  │ Version: 373126721                                                                             │
│  │ Digest: CkU6x2v3ASpVBUU9P9mFCHKWFD8KTLRWYAopB3VCoKGm                                           │
│  └──                                                                                              │
│ Mutated Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126721                                                                             │
│  │ Digest: 6r1SjrtnL1KTY7gp5vnrTQS2zK5Eoo4AmLqqynBDz5cc                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xaa9cd58e4c7e00f2a0b033c74958709ff3a101048d831722855c04dd819b0015                         │
│  │ Owner: Shared( 373126719 )                                                                     │
│  │ Version: 373126721                                                                             │
│  │ Digest: 3oS9cdoB3Y5KVwpfXaWzqkH4HtZLE5eqQFfvonFnC1gV                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xf3abf566ff83c44d0307bff5379c7b6afc7c729eb0cabe0cf90417bbb386bb01                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126721                                                                             │
│  │ Digest: 5qp3odDfah5sbgskHa5MeWTj6aeJE7jYwxJTv9YbFdyq                                           │
│  └──                                                                                              │
│ Shared Objects:                                                                                   │
│  ┌──                                                                                              │
│  │ ID: 0xaa9cd58e4c7e00f2a0b033c74958709ff3a101048d831722855c04dd819b0015                         │
│  │ Version: 373126719                                                                             │
│  │ Digest: AcyZW6ekTvCP7SU8uBa4Nwrh4v1tDPk8M4hFDC5qt1qh                                           │
│  └──                                                                                              │
│ Gas Object:                                                                                       │
│  ┌──                                                                                              │
│  │ ID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                         │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ Version: 373126721                                                                             │
│  │ Digest: 6r1SjrtnL1KTY7gp5vnrTQS2zK5Eoo4AmLqqynBDz5cc                                           │
│  └──                                                                                              │
│ Gas Cost Summary:                                                                                 │
│    Storage Cost: 5966000 MIST                                                                     │
│    Computation Cost: 1000000 MIST                                                                 │
│    Storage Rebate: 3664188 MIST                                                                   │
│    Non-refundable Storage Fee: 37012 MIST                                                         │
│                                                                                                   │
│ Transaction Dependencies:                                                                         │
│    4oe9qpDZkv3eEUgYhVrGehohE6Q8DhFLLehRDgMkDtpj                                                   │
│    FKJXY73aQcwwqUKyw991s9Wfnb1GJjbUpcgxiGHvhRxc                                                   │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Block Events                                                                                        │
├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                                            │
│  │ EventID: ctCu6z8YXetd4KUYGfM56GeXTHPsXxH6WuAsrp4GdMj:0                                                       │
│  │ PackageID: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f                                │
│  │ Transaction Module: proposal                                                                                 │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                   │
│  │ EventType: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::proposal::ProposalCreated     │
│  │ ParsedJSON:                                                                                                  │
│  │   ┌─────────┬────────────────────────────────────────────────────────────────────┐                           │
│  │   │ creator │ 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b │                           │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                           │
│  │   │ id      │ 0x1ce30ebed10c250cb8b98fb1f507dc7de48d6c13628018e2d776acc3f9e2ee78 │                           │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                           │
│  │   │ message │ Proposal Created                                                   │                           │
│  │   ├─────────┼────────────────────────────────────────────────────────────────────┤                           │
│  │   │ title   │ Proposal V2                                                        │                           │
│  │   └─────────┴────────────────────────────────────────────────────────────────────┘                           │
│  └──                                                                                                            │
│  ┌──                                                                                                            │
│  │ EventID: ctCu6z8YXetd4KUYGfM56GeXTHPsXxH6WuAsrp4GdMj:1                                                       │
│  │ PackageID: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f                                │
│  │ Transaction Module: dashboard                                                                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                   │
│  │ EventType: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::dashboard::ProposalRegistered │
│  │ ParsedJSON:                                                                                                  │
│  │   ┌─────────────┬────────────────────────────────────────────────────────────────────┐                       │
│  │   │ proposal_id │ 0x1ce30ebed10c250cb8b98fb1f507dc7de48d6c13628018e2d776acc3f9e2ee78 │                       │
│  │   └─────────────┴────────────────────────────────────────────────────────────────────┘                       │
│  └──                                                                                                            │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes                                                                                                 │
├────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x1ce30ebed10c250cb8b98fb1f507dc7de48d6c13628018e2d776acc3f9e2ee78                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Shared( 373126721 )                                                                                  │
│  │ ObjectType: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::proposal::Proposal          │
│  │ Version: 373126721                                                                                          │
│  │ Digest: CkU6x2v3ASpVBUU9P9mFCHKWFD8KTLRWYAopB3VCoKGm                                                        │
│  └──                                                                                                           │
│ Mutated Objects:                                                                                               │
│  ┌──                                                                                                           │
│  │ ObjectID: 0x73195369699cf1e74f1db856d42f41c9b122e91583a75d17707b0619b615270c                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI>                                                                  │
│  │ Version: 373126721                                                                                          │
│  │ Digest: 6r1SjrtnL1KTY7gp5vnrTQS2zK5Eoo4AmLqqynBDz5cc                                                        │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xaa9cd58e4c7e00f2a0b033c74958709ff3a101048d831722855c04dd819b0015                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Shared( 373126719 )                                                                                  │
│  │ ObjectType: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::dashboard::Dashboard        │
│  │ Version: 373126721                                                                                          │
│  │ Digest: 3oS9cdoB3Y5KVwpfXaWzqkH4HtZLE5eqQFfvonFnC1gV                                                        │
│  └──                                                                                                           │
│  ┌──                                                                                                           │
│  │ ObjectID: 0xf3abf566ff83c44d0307bff5379c7b6afc7c729eb0cabe0cf90417bbb386bb01                                │
│  │ Sender: 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b                                  │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )               │
│  │ ObjectType: 0xeb771f096d5c26fc23166c7a224b72c58bc7f38b6924a750cfd43e31faf1094f::dashboard::AdminCapability  │
│  │ Version: 373126721                                                                                          │
│  │ Digest: 5qp3odDfah5sbgskHa5MeWTj6aeJE7jYwxJTv9YbFdyq                                                        │
│  └──                                                                                                           │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes                                                                                   │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│  ┌──                                                                                              │
│  │ Owner: Account Address ( 0x51e3abddab89e8054627fff5222e04be6f8c66f17a13ddbe280933082a2f836b )  │
│  │ CoinType: 0x2::sui::SUI                                                                        │
│  │ Amount: -3301812                                                                               │
│  └──                                                                                              │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

# View Wallets

```bash
sui client addresses
```
