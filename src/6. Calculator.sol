// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library MathUtils {
    function square(uint256 num) internal pure returns (uint256) {
        return num * num;
    }
}

contract Calculator {
    using MathUtils for uint256;

    modifier onlyPositive(uint256 num) {
        require(num > 0, "Number must be positive");
        _;
    }

    function calculateSquare(uint256 num) public pure onlyPositive(num) returns (uint256){
        return num.square();
    }
}