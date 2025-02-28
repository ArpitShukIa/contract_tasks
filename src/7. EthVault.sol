// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract EthVault {
    event DepositReceived(address indexed sender, uint256 amount);
    event FundsWithdrawn(address indexed recipient, uint256 amount);

    receive() external payable {
        emit DepositReceived(msg.sender, msg.value);
    }

    fallback() external payable {
        emit DepositReceived(msg.sender, msg.value);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function withdraw(uint256 amount, address payable recipient) external {
        require(address(this).balance >= amount, "Insufficient contract balance");
        recipient.transfer(amount);
        emit FundsWithdrawn(recipient, amount);
    }
}
