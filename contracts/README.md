# Smart Contracts

This directory contains smart contract implementations for the IDEALE.eu ecosystem.

## Contracts

### RevenueSplit.sol

Solidity contract for on-chain revenue distribution to artifact creators.

**Purpose**: Automatically distributes TT tokens to creators according to their declared revenue share allocations.

**Key Features**:
- Register artifacts with creator allocations (basis points)
- Validate allocations sum to 10000 (100%)
- Distribute tokens proportionally to registered creators
- Emit events for transparency and tracking

**Status**: Skeleton/PoC - Ready for audit and extension

**Requirements for Production**:
- Add OpenZeppelin dependencies (AccessControl, ReentrancyGuard, Pausable)
- Implement IERC20 token transfers
- Add timelock mechanisms
- Implement pause/unpause functionality
- Add blocklist for sanctioned addresses
- Comprehensive testing and formal verification

## Usage

### Register an Artifact

```solidity
RevenueSplit.Allocation[] memory allocations;
allocations[0] = RevenueSplit.Allocation({
    account: 0x..., 
    shareBps: 7000  // 70%
});
allocations[1] = RevenueSplit.Allocation({
    account: 0x..., 
    shareBps: 3000  // 30%
});

revenueSplit.register(artifactHash, allocations, 10000);
```

### Distribute Revenue

```solidity
revenueSplit.distribute(artifactHash, tokenAddress, amount);
```

## Migration Path

**Phase A (Current)**: Off-chain TT-credits via `scripts/accrue_royalty.py`

**Phase B (Future)**: 
1. Audit and complete RevenueSplit.sol
2. Deploy to testnet
3. Build bridge between off-chain ledger and on-chain state
4. Deploy to mainnet with governance

## Development

```bash
# Install dependencies (when adding OpenZeppelin)
npm install @openzeppelin/contracts

# Compile contracts
npx hardhat compile

# Run tests
npx hardhat test

# Deploy to testnet
npx hardhat run scripts/deploy.js --network testnet
```

## See Also

- [Creator Royalties Specification](../standards/v0.1/creator-royalties.md)
- [Royalty Configuration](../config/royalties.json)
- [Implementation Summary](../docs/ROYALTIES_IMPLEMENTATION_SUMMARY.md)
