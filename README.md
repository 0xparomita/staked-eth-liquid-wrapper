# Staked ETH Liquid Wrapper

This repository provides a professional-grade framework for building Liquid Staking solutions. It manages the relationship between deposited ETH and the issuance of tokenized staking shares.

## Features
- **Yield Accrual**: Implements a rebasing or share-price appreciation mechanism to reflect staking rewards.
- **Deposit Queue**: Efficiently handles incoming ETH before it is batched to Ethereum PoS validators.
- **ERC-20 Compatibility**: The resulting receipt token is fully compatible with DEXs and lending markets.
- **Security First**: Includes slippage protection and reentrancy guards for all deposit/withdraw paths.

## Technical Architecture
Users deposit ETH into the `LSDWrapper` contract. The contract tracks the total pooled ETH and issues shares proportional to the user's contribution. As rewards are earned from validation, the value of each share increases.



## Development
1. Install Foundry.
2. Compile: `forge build`
3. Test: `forge test`
