// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

 

contract PatientRegistry {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    struct Patient {
        uint256 id;
        string name;
        uint256 birthdate;
        string medicalHistory;
    }

    uint256 public patientCount;
    mapping(uint256 => Patient) public patients;

    event PatientRegistered(uint256 indexed id, string name, uint256 birthdate);

    function registerPatient(string memory _name, uint256 _birthdate, string memory _medicalHistory) external onlyOwner {
        patientCount++;
        patients[patientCount] = Patient(patientCount, _name, _birthdate, _medicalHistory);
        emit PatientRegistered(patientCount, _name, _birthdate);
    }

    function getPatient(uint256 _id) external view returns (string memory name, uint256 birthdate, string memory medicalHistory) {
        require(_id > 0 && _id <= patientCount, "Patient not found");
        Patient memory patient = patients[_id];
        return (patient.name, patient.birthdate, patient.medicalHistory);
    }
}
