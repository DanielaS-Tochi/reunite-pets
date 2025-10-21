// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import {Test} from "forge-std/Test.sol";
import {PetRegistry} from "../src/PetRegistry.sol";

contract PetRegistryTest is Test {
    PetRegistry registry;
    address owner = address(0x123);
    address other = address(0x456);
    string constant HASH = "QmTestHash";

    function setUp() public {
        registry = new PetRegistry();
    }

    function testRegisterPet() public {
        vm.prank(owner);
        registry.registerPet("Luna", "Golden Retriever", HASH);

        PetRegistry.Pet memory pet = registry.getPet(0);
        assertEq(pet.name, "Luna");
        assertEq(pet.breed, "Golden Retriever");
        assertEq(pet.owner, owner);
        assertEq(uint(pet.status), uint(PetRegistry.PetStatus.Home));
    }

    function testUpdateStatus() public {
        vm.prank(owner);
        registry.registerPet("Milo", "Siamese", HASH);

        vm.prank(owner);
        registry.updateStatus(0, PetRegistry.PetStatus.Lost);

        PetRegistry.Pet memory pet = registry.getPet(0);
        assertEq(uint(pet.status), uint(PetRegistry.PetStatus.Lost));
    }

    function testCannotUpdateIfNotOwner() public {
        vm.prank(owner);
        registry.registerPet("Bella", "Beagle", HASH);

        vm.prank(other);
        vm.expectRevert("Not pet owner");
        registry.updateStatus(0, PetRegistry.PetStatus.Lost);
    }

    // --- EVENTS TESTS ---
    function testRegisterPetEmitsEvent() public {
        vm.prank(owner);
        vm.expectEmit(true, true, false, false);
        emit PetRegistry.PetRegistered(0, owner);

        registry.registerPet("Luna", "Golden Retriever", HASH);
    }

    function testUpdateStatusEmitsEvent() public {
        vm.prank(owner);
        registry.registerPet("Milo", "Siamese", HASH);

        vm.prank(owner);
        vm.expectEmit(true, false, false, true);
        emit PetRegistry.PetStatusUpdated(0, PetRegistry.PetStatus.Lost);

        registry.updateStatus(0, PetRegistry.PetStatus.Lost);
    }
}
