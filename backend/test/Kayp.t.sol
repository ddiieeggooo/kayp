// // SPDX-License-Identifier: MIT
// pragma solidity 0.8.24;

// import "forge-std/Test.sol";
// import "../src/Kayp.sol";
// import "forge-std/console.sol";

// contract KaypTest is Test {

//     address owner = makeAddr('User0');
//     address addr1 = makeAddr('User1');
//     address addr2 = makeAddr('User2');

//     Kayp public _Kayp;

//     event HashOfDataCreated(bytes32 hashedBillOfLading);


//     uint public nftId;
//     uint public BillOfLadingID;
//     uint public tripID;
//     uint public dateOfIssue;
//     bytes32 public hashedBillOfLading;

//     mapping(uint => bytes32) private nftHashes;

//     struct BillOfLading {
//         uint billOfLadingID;
//         uint tripID;
//         string consignor;
//         string oceanVessel;
//         string portOfLoading;
//         string portOfDischarge;
//         uint HScode;
//         uint numberOfPackages;
//         string kindOfPackages;
//         string descriptionOfGoods;
//         uint grossWeight;
//         uint measurement;
//         uint containerCount;
//         bool isCoveredByInsurance;
//         string placeOfIssue;
//         uint dateOfIssue;
//         uint freightAmount;
//     }

//     function setUp() public {
//         vm.prank(owner);
//         _Kayp = new Kayp();
//     }


//     function test_expectEmit_HashOfDataCreated() public {
//         BillOfLading memory billoflading;
//         billoflading.billOfLadingID ++;
//         billoflading.tripID ++;
//         hashedBillOfLading = keccak256(abi.encode(billoflading));
//         emit _Kayp.HashOfDataCreated(billoflading);
//         _Kayp.mintNewBLWithHash("consignorTest", "oceanVesselTest", "portOfLoadingTest", "portOfDischargeTest", 1234, 10, "kindOfPackagesTest", "descriptionOfGoodsTest", 100, 100, 10, true, "placeOfIssueTest", 24032024, 1000);
//         }
// }


//       //  assertEq(hashedBillOfLading, keccak256(abi.encode(billoflading)));
