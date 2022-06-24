// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
		// If we want to interact with other contracts
		// We need to have the address and ABI
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfRetrieve(uint256 _simpleStorageRetrieveIndex) public view returns (uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageRetrieveIndex];
        return simpleStorage.retrieve();
    }
}