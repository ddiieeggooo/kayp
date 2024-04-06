import { useState, useEffect } from 'react'
import { Text } from "@chakra-ui/react"
import { useAccount, useReadContract } from 'wagmi'
import { contractAbi, contractAddress } from '@/constants'

import { publicClient } from '@/utils/client'
import { parseAbiItem } from 'viem'
import MintBLToken from './MintBLToken'
import TransferFrom from './TransferFrom'
import RetrieveBLFromId from './RetrieveBLFromId'

const Kayp = () => {
  const { address } = useAccount();
  const [ownedTokenIds, setOwnedTokenIds] = useState([]);

useEffect(() => {
    const fetchEvents = async () => {
      const mintEvents = await publicClient.getLogs({
        address: contractAddress,
        event: parseAbiItem('event BLTokenMinted(uint256 indexed BLandNFTid, address indexed owner)'),
        fromBlock: 5598889n,
        toBlock: 'latest'
      });

      const filteredTokenIds = mintEvents.filter((event) =>
      event.args.owner.toLowerCase() === address.toLowerCase()
      ).map((event) => event.args.BLandNFTid);

    setOwnedTokenIds(filteredTokenIds);
  };
    fetchEvents();
  }, [address, ownedTokenIds]);

  return (
    <>
      <Text>
        {ownedTokenIds.length > 0 ? (
          <p>Your address {address} owns token IDs: {ownedTokenIds.join(', ')}</p>
        ) : (
          <p>Your address {address} owns no tokens.</p>
        )}
      </Text>
      <h2>Create your tokenized Bill of Lading by providing your informations</h2>
      <MintBLToken/>
      <h2>Transfer the ownership of your tokenized Bill of Lading</h2>
      <TransferFrom/>
      <h2>Retrieve your Bill of Lading from your token ID</h2>
      <RetrieveBLFromId/>
    </>
  );
};

export default Kayp
