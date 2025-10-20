// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title PetRegistry - Reunite-Pets Smart Contract
/// @notice Handles pet registration, status updates, and ownership tracking.
contract PetRegistry {
    struct Pet {
        uint256 id;
        string name;
        string breed;
        string ipfsHash;
        address owner;
        bool isMissing;
    }

    uint256 public nextId;
    mapping(uint256 => Pet) public pets;
    mapping(address => uint256[]) public ownerToPets;

    event PetRegistered(uint256 indexed petId, address indexed owner, string name, string breed);
    event PetStatusUpdated(uint256 indexed petId, bool isMissing);

    /// @notice Register a new pet
    function registerPet(string memory _name, string memory _breed, string memory _ipfsHash) external {
        uint256 petId = nextId++;

        pets[petId] = Pet({
            id: petId,
            name: _name,
            breed: _breed,
            ipfsHash: _ipfsHash,
            owner: msg.sender,
            isMissing: false
        });

        ownerToPets[msg.sender].push(petId);
        emit PetRegistered(petId, msg.sender, _name, _breed);
    }

    /// @notice Update the missing/found status of your pet
    function updateStatus(uint256 _petId, bool _isMissing) external {
        Pet storage pet = pets[_petId];
        require(pet.owner == msg.sender, "Not pet owner");
        pet.isMissing = _isMissing;

        emit PetStatusUpdated(_petId, _isMissing);
    }

    /// @notice Retrieve all pet IDs owned by a wallet
    function getPetsByOwner(address _owner) external view returns (uint256[] memory) {
        return ownerToPets[_owner];
    }
}
