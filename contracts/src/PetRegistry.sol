// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract PetRegistry {
    // --- ENUMS ---
    enum PetStatus { Home, Lost, Found, Adoption }

    // --- STRUCTS ---
    struct Pet {
        uint256 id;
        string name;
        string breed;
        string ipfsHash;
        address owner;
        PetStatus status;
    }

    // --- STATE ---
    mapping(uint256 => Pet) public pets;
    uint256 public petCount;

    // --- EVENTS ---
    event PetRegistered(uint256 indexed petId, address indexed owner);
    event PetStatusUpdated(uint256 indexed petId, PetStatus status);

    // --- FUNCTIONS ---
    function registerPet(
        string memory _name,
        string memory _breed,
        string memory _ipfsHash
    ) public {
        uint256 petId = petCount;
        pets[petId] = Pet({
            id: petId,
            name: _name,
            breed: _breed,
            ipfsHash: _ipfsHash,
            owner: msg.sender,
            status: PetStatus.Home
        });
        petCount++;
        emit PetRegistered(petId, msg.sender);
    }

    function updateStatus(uint256 petId, PetStatus _status) public {
        Pet storage pet = pets[petId];
        require(msg.sender == pet.owner, "Not pet owner");
        pet.status = _status;
        emit PetStatusUpdated(petId, _status);
    }

    function getPet(uint256 petId) public view returns (Pet memory) {
        return pets[petId];
    }
}
