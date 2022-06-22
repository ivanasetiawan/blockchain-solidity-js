// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

// EVM (Ethereum Virtual Machine)
// Avalanche, Fantom, Polygon

contract SimpleStorage {
    // bool (true/false)
    // uint (number isn't positive or negative)
    // int (number positive or negative)
    // address
    // bytes

    // bool hasFavoriteNumber = true;
    // string favoriteNumberInText = "Five";
    // int256 favoriteInt = -5;
    // address myAddress = 0xa3E2836600fD72a5D20e9EB63F61838C610dF8D5;
    // bytes32 favoriteBytes = "cat";

    uint256 favoriteNumber;

    // Mapping from `string` to `uint256`
    // Enter `string` and it will spit out `uint256`
    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    // Memory is temporary variable that CAN be MODIFIED
    // Calldata is temporary variable that CANNOT be MODIFIED
    // Storage is permanent variable that CAN be MODIFIED
    // Struct, mapping, or array need to be given memory or calldata when adding them as a param to a func
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        // We can search name's favorite number (see mapping from string to uint256)
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
