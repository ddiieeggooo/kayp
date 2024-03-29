'use client';

import { useState, useEffect } from "react";
import {
  Heading,
  Flex,
  Button,
  Input,
  VStack,
  useToast,
  Text,
} from "@chakra-ui/react";
import { useAccount, useWriteContract, useWaitForTransactionReceipt } from "wagmi";
import { contractAddress, contractAbi } from "@/constants";

const MintBLToken = ({ refetch, getEvents }) => {
  const { address } = useAccount();
  const toast = useToast();

  // State to hold input values for each field in the Bill of Lading structure
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

  const { data: hash, isPending, writeContract } = useWriteContract({
    address: contractAddress,
    abi: contractAbi,
    functionName: "mintBLToken",
    args: [Object.values(blData)],
    onSuccess: () => {
      // Reset form fields
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
      refetch();
      getEvents();
      toast({
        title: "BL Token successfully minted",
        status: "success",
        duration: 3000,
        isClosable: true,
      });
    },
    onError: (error) => {
      toast({
        title: "Error minting BL Token",
        description: error.message,
        status: "error",
        duration: 5000,
        isClosable: true,
      });
    },
  });

  const { isLoading: isConfirming, isSuccess: isConfirmed } = useWaitForTransactionReceipt({ hash });

  // Handle input changes
  const handleChange = (e) => {
    const { name, value } = e.target;
    setBlData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleSubmit = async () => {
    writeContract();
  };

  return (
    <>
      <Heading as="h2" size="xl" mt="1rem">
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
        <Button colorScheme="blue" onClick={handleSubmit} isLoading={isPending || isConfirming}>
          {isPending || isConfirming ? "Minting..." : "Mint BL Token"}
        </Button>
      </VStack>
    </>
  );
}

export default MintBLToken
