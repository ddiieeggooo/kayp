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

/// @dev Avoid struct with too much elements to avoid stack too deep error
  struct StructDeBL {
      string _BLandNFTid;
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


  uint256 public BLandNFTid;

  StructDeBL public instanceDeBL;

  StructDeBL[] public arrayDeTousLesBL;

  mapping (uint BLandNFTid => StructDeBL) public linkBetweenIdandDataOfBL;

/// @notice BLTokenMinted is an event to log the minting of a NFT
/// @param BLandNFTid is the id of the NFT and the Bill of Lading, owner is the address of the user who minted the NFT
  event BLTokenMinted(uint256 indexed BLandNFTid, address indexed owner);

/// @notice mintBLToken is a function to mint a NFT and bound his Id to a Bill of Lading and his data
/** @param _arrayDeDatasDuFront is an array of strings containing all the data of the Bill of Lading
provided by the user in the frontend interface */
  function mintBLToken(string[12] memory _arrayDeDatasDuFront) external {

/// @notice avoid incomplete Bill of Lading
    require(_arrayDeDatasDuFront.length >= 12, "Input array must contain at least 15 elements.");

/// @notice Id is dynamically generated
    uint256 _BLandNFTid = arrayDeTousLesBL.length;

    StructDeBL memory _instanceDeBL = StructDeBL({
      _BLandNFTid: Strings.toString(_BLandNFTid),
      tripID: _arrayDeDatasDuFront[1],
      oceanVessel: _arrayDeDatasDuFront[2],
      portOfLoadingAndConsignor: _arrayDeDatasDuFront[3],
      portOfDischargeAndConsignee: _arrayDeDatasDuFront[4],
      HScode: _arrayDeDatasDuFront[5],
      numberAndKindOfPackages: _arrayDeDatasDuFront[6],
      descriptionOfGoods: _arrayDeDatasDuFront[7],
      grossWeightAndMeasurement: _arrayDeDatasDuFront[8],
      containerCount: _arrayDeDatasDuFront[9],
      placeAndDateOfIssue: _arrayDeDatasDuFront[10],
      freightAmount: _arrayDeDatasDuFront[11]
    });

/// @notice Each bill of lading struct is stored in an array, the data is in the BL struct
    arrayDeTousLesBL.push(_instanceDeBL);

/// @notice Each Id is bounded to a Bill of Lading struct
    linkBetweenIdandDataOfBL[_BLandNFTid] = _instanceDeBL;

/// @notice The NFT is minted with the same Id of the Bill of Lading
/// @dev the function _safemint is inherited from the ERC721 standard
    _safeMint(msg.sender, _BLandNFTid);

/// @notice The event is emitted with an indexed Id in order to retrieve data more easily
    emit BLTokenMinted(_BLandNFTid, msg.sender);
  }

}
