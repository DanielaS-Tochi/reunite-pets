// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract PetRegistry {
    struct Pet {
        uint256 id;
        string name;
        string breed;
        string ipfsHash;
        address owner;
        bool isMissing;
    }

    // --- STATE ---
    mapping(uint256 => Pet) public pets;
    uint256 public petCount;

    // --- EVENTS ---
    event PetRegistered(uint256 indexed petId, address indexed owner);
    event PetStatusUpdated(uint256 indexed petId, bool isMissing);

    // --- FUNCTIONS ---
    function registerPet(string memory _name, string memory _breed, string memory _ipfsHash) public {
        uint256 petId = petCount;
        pets[petId] = Pet({
            id: petId,
            name: _name,
            breed: _breed,
            ipfsHash: _ipfsHash,
            owner: msg.sender,
            isMissing: false
        });
        petCount++;
        emit PetRegistered(petId, msg.sender);
    }

    function updateStatus(uint256 petId, bool _isMissing) public {
        Pet storage pet = pets[petId];
        require(msg.sender == pet.owner, "Not pet owner");
        pet.isMissing = _isMissing;
        emit PetStatusUpdated(petId, _isMissing);
    }

    function getPet(uint256 petId) public view returns (Pet memory) {
        return pets[petId];
    }
}
