// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Donations {
    // -------- Variables --------
    uint256 public totalDonations;
    uint256 public votingThreshold;
    bool public votingOpen;

    mapping(address => uint256) public donations;
    mapping(uint256 => uint256) public votes; // candidateId => vote count
    mapping(address => bool) public hasVoted;

    address[] public candidates;
    
    // -------- Events --------
    event DonationReceived(address indexed donor, uint256 amount);
    event VotingOpened(uint256 totalDonations);
    event VoteCast(address indexed voter, uint256 candidateId);
    event DonationsSent(uint256 amount, address recipient);

    // -------- Constructor --------
    constructor(uint256 _votingThreshold, address[] memory _candidates) {
        votingThreshold = _votingThreshold;
        candidates = _candidates;
        votingOpen = false;
    }

    // -------- Functions --------

    // Donate ETH
    function donate() external payable {
        require(msg.value > 0, "Must send ETH");
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;
        emit DonationReceived(msg.sender, msg.value);

        if(totalDonations >= votingThreshold && !votingOpen){
            votingOpen = true;
            emit VotingOpened(totalDonations);
        }
    }

    // Cast vote for candidate
    function castVote(uint256 candidateId) external {
        require(votingOpen, "Voting is not open");
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateId < candidates.length, "Invalid candidate");
        votes[candidateId]++;
        hasVoted[msg.sender] = true;
        emit VoteCast(msg.sender, candidateId);
    }

    // Distribute ETH to winning candidate
    function distributeDonations() external {
        require(votingOpen, "Voting not open yet");

        // Find winner
        uint256 winningId = 0;
        uint256 maxVotes = 0;
        for(uint256 i = 0; i < candidates.length; i++){
            if(votes[i] > maxVotes){
                maxVotes = votes[i];
                winningId = i;
            }
        }

        votingOpen = false;
        uint256 amount = address(this).balance;
        payable(candidates[winningId]).transfer(amount);
        emit DonationsSent(amount, candidates[winningId]);
    }

    // Get number of candidates
    function getCandidatesCount() external view returns(uint256){
        return candidates.length;
    }
}
