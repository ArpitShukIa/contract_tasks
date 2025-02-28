// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DataTypes {
    uint256 public count;
    bool public isEnabled;
    string private note;
    address internal contractOwner;

    constructor(string memory _note, uint256 _count) {
        contractOwner = msg.sender;
        note = _note;
        count = _count;
        isEnabled = true;
    }

    function updateCount(uint256 _newCount) public {
        count = _newCount;
    }

    function _switchStatus() internal {
        isEnabled = !isEnabled;
    }

    function _modifyNote(string memory _newNote) private {
        note = _newNote;
    }

    function fetchNote() public view returns (string memory) {
        return note;
    }

    function isEven(uint256 x) public pure returns (bool) {
        return x % 2 == 0;
    }

    function toggleEnabled() public {
        _switchStatus();
    }

    function changeNote(string memory _newNote) public {
        _modifyNote(_newNote);
    }
}
