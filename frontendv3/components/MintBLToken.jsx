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
import { useAccount, useWriteContract,useWaitForTransactionReceipt } from "wagmi";
import { contractAddress, contractAbi } from "@/constants/index";

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

  const { data: hash, isPending, writeContract } = useWriteContract({
    mutation: {
      onSuccess: () => {
        setBlData({
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
        toast({
          title: "BL Token minted",
          status: "success",
          duration: 3000,
          isClosable: true,
        });
      },
    onError(error) {
      toast({
        title: "Error",
        description: error.message,
        status: "error",
        duration: 9000,
        isClosable: true,
      });
    },
  }

  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setBlData(prevData => ({
      ...prevData,
      [name]: value,
    }));
  };

  const { isLoading: isConfirming, isSuccess: isConfirmed } =
  useWaitForTransactionReceipt({
    hash,
  })

  const mintBLToken = async () => {
    writeContract({
      address: contractAddress,
      abi: contractAbi,
      functionName: 'mintBLToken',
      args: [blDataArray],
      account: address,
    });
  }

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
          <Button colorScheme="blue" onClick={mintBLToken}>
            {isPending ? "Minting..." : "Mint BL Token"}
          </Button>
        </VStack>
      </Box>
    </Center>
  );
};

export default MintBLToken;
