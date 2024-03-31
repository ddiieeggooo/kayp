'use client'
import { useState } from 'react';
import { useReadContract, useAccount } from 'wagmi';
import { readContract } from '@wagmi/core'
import { UseReadContractParameters } from 'wagmi';
import { contractAbi, contractAddress } from '@/constants';
import { Box, Button, Input, Text, VStack, useToast } from '@chakra-ui/react';

const { data: tupleOfData} = useReadContract({
  address: contractAddress,
  abi: contractAbi,
  functionName: 'retrieveBLFromId',
  args: [tokenId],
  account: address
})

const RetrieveBLFromId = () => {
  const { address } = useAccount();

  const [tokenId, setTokenId] = useState('');

  return (
    <VStack spacing={4}>
      <Input
        placeholder="Enter your Token ID in order to retrieve your Bill of lading"
        value={tokenId}
        onChange={(e) => setTokenId(e.target.value)}
      />
      <Button onClick={retrieveBLFromId}>
        Retrieve Bill of Lading
      </Button>
        <Box>
          <Text>{tupleOfData}</Text>
          <Text>{result}</Text>

            {/* <Text>Bill of lading Id : {result[0]}</Text>
            <Text>Trip id : $TupleOfData[1]</Text>
            <Text>Ocean Vessel : data[2]</Text>
            <Text>Port of Loading and consignor = result[3]</Text>
            <Text>Port of discharge and consignee = result.data[4]</Text>
            <Text>HS code = {tupleOfData[5]}</Text>
            <Text>Number and kind of packages : {tupleOfData[6]}</Text>
            <Text>Description of goods :</Text>
            <Text>Gross weight and measurement : </Text>
            <Text>Container count : </Text>
            <Text>Place and date of issue </Text>
            <Text>Freight amount : </Text> */}
        </Box>
    </VStack>
  );
};

export default RetrieveBLFromId;
