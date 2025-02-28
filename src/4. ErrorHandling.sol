// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ErrorHandling {
    address public owner;
    mapping(address => bool) private approvedUsers;

    error Unauthorized(address caller);

    constructor() {
        owner = msg.sender;
    }

    function approveUser(address _user) public {
        require(msg.sender == owner, "Only the owner can approve users");
        approvedUsers[_user] = true;
    }

    function revokeUser(address _user) public {
        if (msg.sender != owner) {
            revert("Only the owner can revoke users");
        }
        approvedUsers[_user] = false;
    }

    function restrictedAction() public view {
        if (!approvedUsers[msg.sender]) {
            revert Unauthorized(msg.sender);
        }
    }

    function checkOwner() public view {
        assert(owner != address(0));
    }
}
