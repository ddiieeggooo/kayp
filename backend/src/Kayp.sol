// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

/// @title Kayp is a smart contract to create a NFT from a Bill of Lading
/// @dev The contract is based on the ERC721 standard provided by OpenZeppelin
/// @author ddiieeggoo

contract Kayp is ERC721, Ownable {

    constructor() ERC721("KAYPtoken", "KAYP") Ownable(msg.sender) { }

    uint public nftId;
    uint public BillOfLadingID;
    uint public tripID;

    mapping (uint => uint) public nftIDtoBillOfLadingID;

    BillOfLadingUints[9] arrayOfBLUints;
    BillOfLadingStrings[7] arrayOfBLStrings;

/// @notice Structure of uints of a Bill of Lading
    struct BillOfLadingUints {
        uint billOfLadingID;
        uint tripID;
        uint HScode;
        uint numberOfPackages;
        uint grossWeight;
        uint measurement;
        uint containerCount;
        uint dateOfIssue;
        uint freightAmount;
    }

/// @notice Structure of strings of a Bill of Lading
    struct BillOfLadingStrings {
        string consignor;
        string oceanVessel;
        string portOfLoading;
        string portOfDischarge;
        string kindOfPackages;
        string descriptionOfGoods;
        string placeOfIssue;
    }

/// @notice this function will create a new hash of a Bill of Lading and mint a NFT with it
    function mintNewBLToken(uint[9] calldata _arrayOfBLUints, string[7] calldata _arrayOfBLStrings) external {
      BillOfLadingUints memory billofladinguints;
      BillOfLadingStrings memory billofladingstrings;
      billofladinguints = BillOfLadingUints(_arrayOfBLUints[0], _arrayOfBLUints[1], _arrayOfBLUints[2], _arrayOfBLUints[3], _arrayOfBLUints[4], _arrayOfBLUints[5], _arrayOfBLUints[6], _arrayOfBLUints[7], _arrayOfBLUints[8]);
      billofladingstrings = BillOfLadingStrings(_arrayOfBLStrings[0], _arrayOfBLStrings[1], _arrayOfBLStrings[2], _arrayOfBLStrings[3], _arrayOfBLStrings[4], _arrayOfBLStrings[5], _arrayOfBLStrings[6]);
      nftId ++;
      nftIDtoBillOfLadingID[nftId] = billofladinguints.billOfLadingID;
      _safeMint(msg.sender, nftId);
    }

/// @notice this function inherit _transfer from ERC721 to transfer a NFT from an address to another
/// @param from the address of the sender, to the address of the receiver, tokenId the id of the NFT
    function transferNft(address from, address to, uint256 tokenId) external {
      _transfer(from, to, tokenId);
    }

/// @notice this function is a security measure to avoid locking funds in the smart contract
    function withdraw (uint _amount, address receiver) external onlyOwner {
      (bool received, ) = receiver.call{value: _amount}("");
      require(received, "An error occured");
    }

/// @notice this function is a fallback in case of funds received on the smart contract
    fallback() external payable {
    }

/// @notice this function is a receive in case of funds received on the smart contract
    receive() external payable {}

}
