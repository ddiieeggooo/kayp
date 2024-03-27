// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "lib/openzeppelin-contracts/contracts/utils/Strings.sol";

/// @title Kayp is a smart contract to create a NFT bounded to a Bill of Lading, wich data are stored in the smart contract
/// @dev The contract is based on the ERC721 standard provided by OpenZeppelin
/// @author ddiieeggoo

contract Kayp is ERC721, Ownable{

  constructor() ERC721("KAYPtoken", "KAYP") Ownable(msg.sender) { }

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


  uint256 public BLandNFTid;

  StructDeBL public instanceDeBL;

  StructDeBL[] public arrayDeTousLesBL;

  mapping (uint BLandNFTid => StructDeBL) public linkBetweenIdandDataOfBL;


  function mintBLToken(string[] memory _arrayDeDatasDuFront) external {

    require(_arrayDeDatasDuFront.length >= 16, "Input array must contain at least 16 elements.");
    uint256 _BLandNFTid = arrayDeTousLesBL.length;

    StructDeBL memory _instanceDeBL = StructDeBL({
      _BLandNFTid: Strings.toString(_BLandNFTid),
      tripID: _arrayDeDatasDuFront[1],
      consignor: _arrayDeDatasDuFront[2],
      oceanVessel: _arrayDeDatasDuFront[3],
      consignee: _arrayDeDatasDuFront[4],
      portOfLoading: _arrayDeDatasDuFront[5],
      portOfDischarge: _arrayDeDatasDuFront[6],
      HScode: _arrayDeDatasDuFront[7],
      numberOfPackages: _arrayDeDatasDuFront[8],
      kindOfPackages: _arrayDeDatasDuFront[9],
      descriptionOfGoods: _arrayDeDatasDuFront[10],
      grossWeightAndMeasurement: _arrayDeDatasDuFront[11],
      containerCount: _arrayDeDatasDuFront[12],
      placeAndDateOfIssue: _arrayDeDatasDuFront[13],
      freightAmount: _arrayDeDatasDuFront[14]
    });

    arrayDeTousLesBL.push(_instanceDeBL);

    linkBetweenIdandDataOfBL[_BLandNFTid] = _instanceDeBL;
    _safeMint(msg.sender, _BLandNFTid);
  }

}
