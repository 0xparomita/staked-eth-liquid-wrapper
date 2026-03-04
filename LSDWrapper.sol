// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ReentrancyGuard} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.0/contracts/utils/ReentrancyGuard.sol";
import {LiquidStakedToken} from "./LSDToken.sol";

/**
 * @title LSDWrapper
 * @dev Main entry point for depositing ETH and receiving liquid staking tokens.
 */
contract LSDWrapper is ReentrancyGuard {
    LiquidStakedToken public immutable lsToken;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount, uint256 shares);

    constructor() {
        lsToken = new LiquidStakedToken();
    }

    /**
     * @notice Deposit ETH to receive lsETH shares.
     * @dev Simplistic 1:1 ratio for demonstration. 
     */
    function deposit() external payable nonReentrant {
        require(msg.value > 0, "Cannot deposit 0");
        
        uint256 sharesToMint = msg.value; // In a real LSD, this would use a price ratio
        totalStaked += msg.value;
        
        lsToken.mint(msg.sender, sharesToMint);
        emit Deposited(msg.sender, msg.value, sharesToMint);
    }

    /**
     * @notice Internal function for the DAO to simulate reward injection.
     */
    function distributeRewards() external payable {
        totalStaked += msg.value;
    }

    receive() external payable {
        this.deposit();
    }
}
