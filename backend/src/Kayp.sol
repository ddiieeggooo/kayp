// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Kayp is ERC721 {


    struct BillOfLading {
        uint billOfLadingID;
        uint tripID;
        string consignor;
        string oceanVessel;
        string portOfLoading;
        string portOfDischarge;
        uint HScode;
        uint numberOfPackages;
        string kindOfPackages;
        string descriptionOfGoods;
        uint grossWeight;
        uint measurement;
        uint containerNumber;
        bool isCoveredByInsurance;
        string placeOfIssue;
        uint dateOfIssue;
        uint freightAmount;



    }

    mapping


    function mint(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
