// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Strings} from "../../utils/Strings.sol";

contract Kayp is ERC721 {

    using Strings for uint256;

    uint public nftId;
    uint public BillOfLadingID;
    uint public tripID;
    uint public dateOfIssue;

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

    function editNewBLWithHash(string calldata _consignor, string calldata _oceabVessel, string calldata _portOfLoading, string calldata _portOfDischarge, uint calldata _HScode, uint calldata _numberOfPackages, string calldata kindOfPackages, string calldata _descriptionOfGoods, uint calldata _grossWeight, uint calldata _measurement, uint calldata _containerCount, bool calldata _isCoveredByInsurance, string calldata _placeOfIssue, uint calldata _dateOfIssue, uint calldata freightAmount) internal returns(bytes32) {
      BillOfLading memory billoflading;
      billoflading.billOfLadingID ++;
      billoflading.tripID ++;
      billoflading.consignor = _consignor;
      billoflading.oceanVessel = _oceanVessel;
      billoflading.portOfLoading = _portOfLoading;
      billiading.portOfDischarge = _portOfDischarge;
      billoflading.HScode = _HScode;
      billoflading.numberOfPackages = _numberOfPackages;
      billoflading.kindOfPackages = _kindOfPackages;
      billoflading.descriptionOfGoods = _descriptionOfGoods;
      billoflading.grossWeight = _grossWeight;
      billoflading.measurement = _measurement;
      billoflading.containerNumber = _containerCount;
      billoflading.isCoveredByInsurance = _isCoveredByInsurance;
      billoflading.placeOfIssue = _placeOfIssue;
      billoflading.dateOfIssue = _dateOfIssue;
      billoflading.freightAmount = _freightAmount;
      return keccak256(abi.encode(billoflading));
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
