'use client'
import { useState } from "react";
import {
  Heading,
  Box,
  Button,
  Input,
  VStack,
  useToast,
  Center,
} from "@chakra-ui/react";
import { useAccount, useWriteContract } from "wagmi";
import { contractAddress, contractAbi } from "@/constants";

const MintBLToken = () => {
  const { address } = useAccount();
  const toast = useToast();

  const [blData, setBlData] = useState({
    tripID: "",
    oceanVessel: "",
    portOfLoadingAndConsignor: "",
    portOfDischargeAndConsignee: "",
    HScode: "",
    numberAndKindOfPackages: "",
    descriptionOfGoods: "",
    grossWeightAndMeasurement: "",
    containerCount: "",
    placeAndDateOfIssue: "",
    freightAmount: "",
  });

  // Prepare data for the contract function
  const blDataArray = [
    "", // Placeholder for the unused first element
    ...Object.values(blData),
  ];

  const { write: mintBLToken, isLoading: isPending } = useWriteContract({
    addressOrName: contractAddress,
    contractInterface: contractAbi,
    functionName: 'mintBLToken',
    args: [blDataArray],
    onError(error) {
      toast({
        title: "Error",
        description: error.message,
        status: "error",
        duration: 9000,
        isClosable: true,
      });
    },
    onSuccess(data) {
      toast({
        title: "Transaction submitted",
        description: `Transaction hash: ${data.hash}`,
        status: "info",
        duration: 9000,
        isClosable: true,
      });
    },
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setBlData(prevData => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleSubmit = () => {
    mintBLToken();
  };

  return (
    <Center>
      <Box w="full" maxW="md" pt="20">
        <Heading as="h2" size="xl" mt="1rem" textAlign="center">
          Mint BL Token
        </Heading>
        <VStack spacing={4} mt="1rem">
          {Object.keys(blData).map((key) => (
            <Input
              key={key}
              name={key}
              placeholder={key.charAt(0).toUpperCase() + key.slice(1).replace(/([A-Z])/g, ' $1').trim()}
              value={blData[key]}
              onChange={handleChange}
            />
          ))}
          <Button colorScheme="blue" onClick={handleSubmit} isLoading={isPending}>
            {isPending ? "Minting..." : "Mint BL Token"}
          </Button>
        </VStack>
      </Box>
    </Center>
  );
};

export default MintBLToken;
