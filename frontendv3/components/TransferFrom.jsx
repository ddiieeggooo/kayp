'use client'
import { useState, useEffect } from "react";
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

const TransferFrom = () => {
  const { address } = useAccount();
  const toast = useToast();

  const [tokenId, setTokenId] = useState('');
  const [toAddress, setToAddress] = useState('');

  const args = [address, toAddress, tokenId];

  const { data: hash, isPending, writeContract } = useWriteContract({
    mutation: {
      onSuccess: () => {
        setToAddress('');
        setTokenId('');
        toast({
          title: "BL Token transferred successfully",
          status: "success",
          duration: 3000,
          isClosable: true,
        });
      },
      onError(error) {
        toast({
          title: "Make sure you own the token and the recipient address is correct.",
          description: error.message,
          status: "error",
          duration: 9000,
          isClosable: true,
        });
      },
    }

  });

  const { isLoading: isConfirming, isSuccess: isConfirmed } =
  useWaitForTransactionReceipt({
    hash,
  })

  const transferFrom = async () => {
    writeContract({
      address: contractAddress,
      abi: contractAbi,
      functionName: 'transferFrom',
      args: args,
      account: address,
    });
  }

  return (
    <Center>
      <Box w="full" maxW="md" pt="20">
        <Heading as="h2" size="xl" mt="1rem" textAlign="center">
          Transfer BL Token
        </Heading>
        <VStack spacing={4} mt="1rem">
            <Input
              placeholder="ID of the token to transfer"
              value={tokenId}
              onChange={(e) => setTokenId(e.target.value)}
            />
            <Input
              placeholder="Address of the recipient"
              value={toAddress}
              onChange={(e) => setToAddress(e.target.value)}
            />
          <Button colorScheme="purple" onClick={transferFrom}>
            {isPending ? "Transfering..." : "Transfer BL Token"}
          </Button>
        </VStack>
      </Box>
    </Center>
  );
};

export default TransferFrom;
