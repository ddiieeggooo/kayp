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
    uint public dateOfIssue;
    bytes32 public hashedBillOfLading;

    mapping(uint => bytes32) private nftHashes;
    mapping(uint => BillOfLading) private billOfLadings;

/// @notice Structure of a Bill of Lading with all the necessary informations
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
        uint containerCount;
        bool isCoveredByInsurance;
        string placeOfIssue;
        uint dateOfIssue;
        uint freightAmount;
    }

/// @notice this function will create a new hash of a Bill of Lading and mint a NFT with it
    function mintNewBLWithHash(string calldata _consignor, string calldata _oceanVessel, string calldata _portOfLoading, string calldata _portOfDischarge, uint _HScode, uint _numberOfPackages, string calldata _kindOfPackages, string calldata _descriptionOfGoods, uint _grossWeight, uint _measurement, uint _containerCount, bool _isCoveredByInsurance, string calldata _placeOfIssue, uint _dateOfIssue, uint _freightAmount) external {
      BillOfLading memory billoflading;
      billoflading.billOfLadingID ++;
      billoflading.tripID ++;
      billoflading.consignor = _consignor;
      billoflading.oceanVessel = _oceanVessel;
      billoflading.portOfLoading = _portOfLoading;
      billoflading.portOfDischarge = _portOfDischarge;
      billoflading.HScode = _HScode;
      billoflading.numberOfPackages = _numberOfPackages;
      billoflading.kindOfPackages = _kindOfPackages;
      billoflading.descriptionOfGoods = _descriptionOfGoods;
      billoflading.grossWeight = _grossWeight;
      billoflading.measurement = _measurement;
      billoflading.containerCount = _containerCount;
      billoflading.isCoveredByInsurance = _isCoveredByInsurance;
      billoflading.placeOfIssue = _placeOfIssue;
      billoflading.dateOfIssue = _dateOfIssue;
      billoflading.freightAmount = _freightAmount;
      hashedBillOfLading = keccak256(abi.encode(billoflading));
      nftHashes[nftId] = hashedBillOfLading;
      _safeMint(msg.sender, nftId);
    }


/// @notice this function inherit _transfer from ERC721 to transfer a NFT from an address to another
/// @param from the address of the sender, to the address of the receiver, tokenId the id of the NFT
    function transferNft(address from, address to, uint256 tokenId) external {
      _transfer(from, to, tokenId);
    }

/// @notice this function will retrieve the Bill of Lading datas from the hash bounded to a given NFT
    // function retrieveBLFromNFT (uint _nftId) external returns(string memory) {
    //   bytes32 _hashedBillOfLading = nftHashes[_nftId];
    //   return abi.decode(_hashedBillOfLading, (string));
    // }

/// @notice this function is a security measure to avoid locking funds in the smart contract
    function withdraw (uint _amount, address receiver) external onlyOwner {
      (bool received, ) = msg.sender.call{value: _amount}("");
      require(received, "An error occured");
    }

/// @notice this function is a fallback in case of funds received on the smart contract
    fallback() external payable {
    }

    receive() external payable {}

}
