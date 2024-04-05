// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import { Kayp } from '../src/Kayp.sol';
import { DevOpsTools } from "foundry-devops/src/DevOpsTools.sol";

contract KaypSoutenance is Script {

   function run() public {
      vm.startBroadcast();
      address contractAddress = DevOpsTools.get_most_recent_deployment("Kayp", block.chainid);
      console.log(contractAddress);
      Kayp kayp = Kayp(contractAddress);
      string[12] memory arrayDuScript = ["", "Cyril", "et", "Ben", "ils", "sont", "trop", "gentils", "I", "need", "rust", "courses"];
      kayp.mintBLToken(arrayDuScript);
      vm.stopBroadcast();
    }
}
