// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "forge-std/Test.sol";
import "../src/Kayp.sol";
import "forge-std/console.sol";

contract KaypTest is Test {

  address owner = makeAddr('User0');
  address addr1 = makeAddr('User1');
  address addr2 = makeAddr('User2');

  Kayp public _Kayp;

  event BLTokenMinted(uint256 indexed BLandNFTid, address indexed owner);

  uint256 public BLandNFTid;

  StructDeBL[] public arrayDeTousLesBL;

  mapping (uint BLandNFTid => StructDeBL) public linkBetweenIdandDataOfBL;

  struct StructDeBL {
      string _BLandNFTid;
      string tripID;
      string consignor;
      string oceanVessel;
      string consignee;
      string portOfLoading;
      string portOfDischarge;
      string HScode;
      string numberOfPackages;
      string kindOfPackages;
      string descriptionOfGoods;
      string grossWeightAndMeasurement;
      string containerCount;
      string placeAndDateOfIssue;
      string freightAmount;
  }

    function setUp() public {
        vm.prank(owner);
        _Kayp = new Kayp();
    }


    function test_expectEmit_BLTokenMinted() public {
      uint256 _BLandNFTid = arrayDeTousLesBL.length;
      string[15] memory _arrayDeDatasDuFront = [Strings.toString(_BLandNFTid), "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"];
      emit BLTokenMinted(_BLandNFTid, owner);
      _Kayp.mintBLToken(_arrayDeDatasDuFront);
    }


}
