pragma solidity ^0.4.10;

contract AutonomousSystem {
    function reportAttackers(string attackReport_) {}
}

contract Relay {

    mapping(string => address) subnetworkMappings;

    function getContractAddress(string subnetwork_) public returns (address) {
        return subnetworkMappings[subnetwork_];
    }

    function addSubnetwork(string subnetwork_, address contractAddress_) {
        subnetworkMappings[subnetwork_] = contractAddress_;
    }

    function reportAttackers(string subnetwork_, string attackReport_) {
        address contractAddress = subnetworkMappings[subnetwork_];
        AutonomousSystem autonomousSystem = AutonomousSystem(contractAddress);
        autonomousSystem.reportAttackers(attackReport_);
    }
}