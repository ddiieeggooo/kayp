'use client'
import { publicClient } from '@/utils/client';
import { contractAddress, contractAbi } from "@/constants/index";
import { useAccount, useReadContract } from 'wagmi';
import { useState } from 'react';
import {
  Heading,
  Box,
  Button,
  Input,
  VStack,
  useToast,
  Center,
  Text,
} from "@chakra-ui/react";

const RetrieveBLFromId = () => {
  const { address } = useAccount();
  const [tokenId, setTokenId] = useState('');
  const [tuple, setTuple] = useState('');

  const handleReadTupleClick = async () => {
          const readTuple = await publicClient.readContract({
              address: contractAddress,
              abi: contractAbi,
              functionName: "retrieveBLFromId",
              account: address,
              args: [tokenId]
          });
          setTuple(readTuple);
      }

      function formatKey(key) {
        const replacements = {
          'BLandNFTid': 'BL and NFT ID',
          'HScode': 'HS code',
        };
        if (replacements[key]) {
          return replacements[key];
        }
        key = key.replace(/([a-z0-9])([A-Z])/g, '$1 $2')
                 .replace(/([A-Z]+)([A-Z][a-z])/g, '$1 $2');
        const words = key.split(/\s+/);
        return words.map((word, index) => {
          if (index === 0) {
            return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
          }
          if (word === 'ID') {
            return word;
          }
          return word.toLowerCase();
        }).join(' ');
      }

      return (
        <>
          <Box mb={4}>
            <Heading as="h2" size="xl" mt="1rem" textAlign="center">
              Retrieve your Bill of Lading
            </Heading>
            <Input
              placeholder="Enter Bill of lading Id"
              value={tokenId}
              onChange={(e) => setTokenId(e.target.value)}
            />
            <Button onClick={handleReadTupleClick}>Search Bill of Lading</Button>
            </Box>
            {tuple && (
            <Box>
              {Object.entries(tuple).map(([key, value]) => (
                <Text key={key}>{`${formatKey(key)}: ${value}`}</Text>
              ))}
            </Box>
          )}
        </>
      );

};

export default RetrieveBLFromId;
