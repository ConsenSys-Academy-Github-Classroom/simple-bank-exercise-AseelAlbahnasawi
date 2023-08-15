// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatientRegistry {
    struct Patient {
        string pname;
        uint256 page;
        string dentalInfo;
    }

    mapping(address => Patient) public patients;

    event PatientRegistered(address indexed patientAddress, string pname);

    function registerPatient(string memory _ pname, uint256 _page, string memory _dentalInfo) public {
        patients[msg.sender] = Patient(_pname, _page, _dentalInfo);
        emit PatientRegistered(msg.sender, _pname);
    }
}
