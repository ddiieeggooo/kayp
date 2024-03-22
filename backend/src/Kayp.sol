// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Kayp is ERC721 {

    uint public nftId;

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

    function mint(uint256 newNumber) external {
      // le mint va créer le nft et va bound le hash de la struct à l'intérieur
    }

    function transferNft (uint _nftId) external {
      // écrire la fonction pour transférer la propriété du nft
    }

    function retrieveBLFromNFT (uint _nftId) private {

    }

    function withdraw (uint amount, address receiver) {
      // ecrire un withdraw au cas où de l'argent est bloquée sur le smart contract
    }

    fallback()  {
      // ecrire le fallback en cas de fonds reçus sur le smart contract
    }

}
