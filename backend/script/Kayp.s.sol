// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import { Kayp } from '../src/Kayp.sol';
import { DevOpsTools } from "foundry-devops/src/DevOpsTools.sol";



contract KaypScript is Script {
    // function setUp() public {}

    function run() public {
      uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
      vm.startBroadcast(deployerPrivateKey);
      Kayp kayp = new Kayp();
      vm.stopBroadcast();
    }

    // function mintBillOfLadingWithThisData() public {
    //   vm.startBroadcast();
    //   address contractAddress = DevOpsTools.get_most_recent_deployment("Kayp", block.chainid);
    //   Kayp kayp = Kayp(contractAddress);
    //   string[12] memory arrayDuScript = ["", "Cyril", "et", "Ben", "ils", "sont", "trop", "gentils", "I", "need", "rust", "courses"];
    //   kayp.mintBLToken(arrayDuScript);
    //   vm.stopBroadcast();
    // }
}


    //cours



//     function run() external {
//         address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("SimpleStorage", block.chainid);
//         interactSimpleStorage(mostRecentlyDeployed);
//     }

//     //doc

//     function interactWithPreviouslyDeployedContracts() public {
//     address contractAddress = DevOpsTools.get_most_recent_deployment("MyContract", block.chainid);
//     MyContract myContract = MyContract(contractAddress);
//     myContract.doSomething();
// }
