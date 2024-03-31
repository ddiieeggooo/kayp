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

      return (
        <>
          <Box mb={4}>
            <Input
              placeholder="Enter Bill of lading Id"
              value={tokenId}
              onChange={(e) => setTokenId(e.target.value)}
            />
            <Button onClick={handleReadTupleClick}>Search Bill of Lading</Button>
          </Box>
          {tuple && (
            <Box>
              {/* Dynamically generate Text components for each tuple entry */}
              {Object.entries(tuple).map(([key, value]) => (
                <Text key={key}>{`${key}: ${value}`}</Text>
              ))}
            </Box>
          )}
        </>
      );

};

export default RetrieveBLFromId;
