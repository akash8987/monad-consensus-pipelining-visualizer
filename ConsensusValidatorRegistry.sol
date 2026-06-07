// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title ConsensusValidatorRegistry
 * @dev On-chain index tracking validator weights contributing to the MonadBFT pipeline.
 */
contract ConsensusValidatorRegistry {
    
    struct ValidatorNode {
        bytes publicBlsKey;
        uint32 votingPower;
        bool isActive;
    }

    mapping(address => ValidatorNode) public validatorCluster;
    uint32 public cumulativeVotingPower;

    event ValidatorRegistered(address indexed ethAddress, bytes blsKey, uint32 power);
    event QuorumVerified(uint256 indexed roundId, bytes32 aggregatedSignature);

    /**
     * @notice Registers a validation node to join the consensus routing topology.
     */
    function registerValidatorNode(
        address ethIdentity, 
        bytes calldata blsKey, 
        uint32 power
    ) external {
        require(power > 0, "RegistryError: Voting power must be greater than zero");
        require(!validatorCluster[ethIdentity].isActive, "RegistryError: Node already active");

        validatorCluster[ethIdentity] = ValidatorNode({
            publicBlsKey: blsKey,
            votingPower: power,
            isActive: true
        });

        cumulativeVotingPower += power;
        emit ValidatorRegistered(ethIdentity, blsKey, power);
    }
}
