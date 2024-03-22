// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "forge-std/Test.sol";
import "../src/Kayp.sol";
import "forge-std/console.sol";

contract KaypTest is Test {

    address owner = makeAddr('User0');
    address addr1 = makeAddr('User1');
    address addr2 = makeAddr('User2');

    Kayp public _Koting;

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

    function setUp() public {
        vm.prank(owner);
        _Kayp = new Kayp();
    }

}
