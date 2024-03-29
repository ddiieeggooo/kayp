'use client';

import { useAccount } from "wagmi";

import NotConnected from "@/components/NotConnected";
import Kayp from "@/components/Kayp";

import { Flex } from "@chakra-ui/react";

export default function Home() {

  // On récupère l'adresse du compte qui est connecté à la DApp
  // On récupère aussi s'il y a qqn connecté ou pas
  const { address, isConnected } = useAccount();

  return (
    <>
      {isConnected ? (
        <>
          <Kayp />
        </>
      ) : (
        <>
          <NotConnected />
        </>
      )}
    </>
  );
}
