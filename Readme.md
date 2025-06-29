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

```bash
sui client publish --gas-budget 1000000
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

````bash
sui client ptb \
--move-call 0x3cb8e7d5f4b7b405c385172f11f38a32dcda240c429cef0c666bda4b39512e52::dashboard::create_proposal  '"Proposal 3"' '"Proposal Description 3"' 1753172826 \
--move-call 0x3cb8e7d5f4b7b405c385172f11f38a32dcda240c429cef0c666bda4b39512e52::dashboard::create_proposal  '"Proposal 4"' '"Proposal Description 4"' 1753172826 \
--move-call 0x3cb8e7d5f4b7b405c385172f11f38a32dcda240c429cef0c666bda4b39512e52::dashboard::create_proposal  '"Proposal 5"' '"Proposal Description 5"' 1753172826 \
--dry-run

5. View Wallets
```bash
sui client addresses
```

````
