// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {PetRegistry} from "../src/PetRegistry.sol";

contract PetRegistryTest is Test {
    PetRegistry public registry;
    address owner = address(0x123);
    string constant HASH = "QmExampleIPFSHash";

    function setUp() public {
        registry = new PetRegistry();
        vm.deal(owner, 1 ether); // give test wallet some ETH
    }

    function testRegisterPet() public {
        vm.prank(owner);
        registry.registerPet("Luna", "Golden Retriever", HASH);

        (uint256 id, string memory name, string memory breed, string memory ipfsHash, address petOwner, bool isMissing)
            = registry.pets(0);

        assertEq(id, 0);
        assertEq(name, "Luna");
        assertEq(breed, "Golden Retriever");
        assertEq(ipfsHash, HASH);
        assertEq(petOwner, owner);
        assertFalse(isMissing);
    }

    function testUpdateStatus() public {
        vm.startPrank(owner);
        registry.registerPet("Milo", "Siamese", HASH);
        registry.updateStatus(0, true);
        vm.stopPrank();

        (, , , , , bool isMissing) = registry.pets(0);
        assertTrue(isMissing);
    }

    function testCannotUpdateIfNotOwner() public {
        vm.prank(owner);
        registry.registerPet("Toby", "Bulldog", HASH);

        address stranger = address(0x999);
        vm.prank(stranger);
        vm.expectRevert("Not pet owner");
        registry.updateStatus(0, true);
    }
}
