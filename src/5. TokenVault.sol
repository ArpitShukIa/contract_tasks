// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenVault is Ownable {
    IERC20 public token;

    constructor(address _token) Ownable(msg.sender) {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        token.transferFrom(msg.sender, address(this), amount);
    }

    function withdraw(uint256 amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        token.transfer(msg.sender, amount);
    }

    function transferTokens(address recipient, uint256 amount) external onlyOwner {
        require(recipient != address(0), "Invalid recipient");
        require(amount > 0, "Amount must be greater than zero");
        token.transfer(recipient, amount);
    }

    function getBalance() external view returns (uint256) {
        return token.balanceOf(address(this));
    }
}
