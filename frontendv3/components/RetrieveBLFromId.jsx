import React, { useState } from 'react';
import { useReadContract } from 'wagmi';
import { contractAbi, contractAddress } from '@/constants';
import { Box, Button, Input, Text, VStack } from '@chakra-ui/react';

const RetrieveBLFromId = () => {
  const [tokenId, setTokenId] = useState('');
  const [blData, setBlData] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState('');

  const retrieveBLData = async () => {
    setIsLoading(true);
    setError('');

    // Assuming useContractRead is configured to trigger manually rather than on args change
    const { data, error } = useReadContract({
      addressOrName: contractAddress,
      contractInterface: contractAbi,
      functionName: 'retrieveBLFromId',
      args: [tokenId],
    });

    if (error) {
      setError('Failed to retrieve data. Make sure the token exists.');
      setIsLoading(false);
      return;
    }

    if (data) {
      // Destructure the tuple into corresponding fields of StructDeBL
      const [
        BLandNFTid, tripID, oceanVessel, portOfLoadingAndConsignor,
        portOfDischargeAndConsignee, HScode, numberAndKindOfPackages,
        descriptionOfGoods, grossWeightAndMeasurement, containerCount,
        placeAndDateOfIssue, freightAmount
      ] = data;

      // Create an object with the data structured as keys
      const blObject = {
        BLandNFTid, tripID, oceanVessel, portOfLoadingAndConsignor,
        portOfDischargeAndConsignee, HScode, numberAndKindOfPackages,
        descriptionOfGoods, grossWeightAndMeasurement, containerCount,
        placeAndDateOfIssue, freightAmount
      };

      setBlData(blObject);
      setIsLoading(false);
    }
  };

  return (
    <VStack spacing={4}>
      <Input
        placeholder="Enter Token ID"
        value={tokenId}
        onChange={(e) => setTokenId(e.target.value)}
      />
      <Button onClick={retrieveBLData} isLoading={isLoading}>
        Retrieve Bill of Lading
      </Button>
      {error && <Text>{error}</Text>}
      {blData && (
        <Box>
          {/* Iterate over the object keys and values to display them */}
          {Object.entries(blData).map(([key, value]) => (
            <Text key={key}><strong>{key}:</strong> {value}</Text>
          ))}
        </Box>
      )}
    </VStack>
  );
};

export default RetrieveBLFromId;
