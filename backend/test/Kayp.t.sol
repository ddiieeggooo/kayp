// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "forge-std/Test.sol";
import "../src/Kayp.sol";
import "forge-std/console.sol";

contract KaypTest is Test {

  address owner = 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496;
  address addr1 = makeAddr('User1');
  address addr2 = makeAddr('User2');

  Kayp public _Kayp;

  event BLTokenMinted(uint256 indexed BLandNFTid, address indexed owner);

  StructDeBL[] public arrayDeTousLesBL;

  mapping (uint BLandNFTid => StructDeBL) public linkBetweenIdandDataOfBL;

  struct StructDeBL {
      string BLandNFTid;
      string tripID;
      string oceanVessel;
      string portOfLoadingAndConsignor;
      string portOfDischargeAndConsignee;
      string HScode;
      string numberAndKindOfPackages;
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
      vm.prank(addr1);
      uint256 BLandNFTid = arrayDeTousLesBL.length;
      string[12] memory _arrayDeDatasDuFront = [Strings.toString(BLandNFTid), "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
      emit BLTokenMinted(BLandNFTid, addr1);
      _Kayp.mintBLToken(_arrayDeDatasDuFront);
    }

    function test_MintAndRetrieve() public {
      vm.startPrank(addr1);
      string[12] memory blData = ["0", "TripID", "OceanVessel", "PortOfLoadingAndConsignor", "PortOfDischargeAndConsignee", "HSCode", "NumberAndKindOfPackages", "DescriptionOfGoods", "GrossWeightAndMeasurement", "ContainerCount", "PlaceAndDateOfIssue", "FreightAmount"];
      _Kayp.mintBLToken(blData);
      vm.stopPrank();
      Kayp.StructDeBL memory bl = _Kayp.retrieveBLFromId(0);
      assertEq(bl.tripID, "TripID");
      assertEq(bl.descriptionOfGoods, "DescriptionOfGoods");
    }

    function testFail_RevertWhen_WrongRetrievalId() public {
      vm.startPrank(addr1);
      string[12] memory blData = ["0", "TripID", "OceanVessel", "PortOfLoadingAndConsignor", "PortOfDischargeAndConsignee", "HSCode", "NumberAndKindOfPackages", "DescriptionOfGoods", "GrossWeightAndMeasurement", "ContainerCount", "PlaceAndDateOfIssue", "FreightAmount"];
      _Kayp.mintBLToken(blData);
      vm.stopPrank();
      Kayp.StructDeBL memory bl = _Kayp.retrieveBLFromId(1);
    }

    function testFuzzMintBLToken(string[12] calldata _blData) public {
      vm.startPrank(addr1);
      _Kayp.mintBLToken(_blData);
      vm.stopPrank();
    }

}
