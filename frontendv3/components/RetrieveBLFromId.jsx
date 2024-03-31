import { publicClient } from '@/utils/client';
import { contractAddress, contractAbi } from "@/constants/index";
import { useAccount, useReadContract } from 'wagmi';
import { useState } from 'react';

const SearchVoter = () => {
  const { address } = useAccount();
  const [tokenId, setTokenId] = useState('');

  const handleReadTupleClick = async () => {
          const readTuple = await publicClient.readContract({
              address: contractAddress,
              abi: contractAbi,
              functionName: "getVoter",
              account: address,
              args: [tokenId]
          });
      }
  };

  return (
      <>
          <Box mb={4}>
              <Input
                  placeholder="Enter Bl Id"
                  value={tokenId}
                  onChange={(e) => setTokenId(e.target.value)}
              />
              <Button
                  onClick={handleReadTupleClick}
                  loadingText="Searching..."
              >
                  Search Bill of Lading
              </Button>
          </Box>
          <Box>
              <Text>Bill of lading Id : </Text>
              <Text>Trip id : </Text>
              <Text>Ocean Vessel : </Text>
              <Text>Port of Loading and consignor = </Text>
              <Text>Port of discharge and consignee = </Text>
              <Text>HS code = </Text>
              <Text>Number and kind of packages : </Text>
              <Text>Description of goods :</Text>
              <Text>Gross weight and measurement : </Text>
              <Text>Container count : </Text>
              <Text>Place and date of issue </Text>
              <Text>Freight amount : </Text>
          </Box>
      </>
  );
};

export default SearchVoter;
