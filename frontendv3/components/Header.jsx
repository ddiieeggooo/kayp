"use client"
import { Flex, Text, Image } from '@chakra-ui/react'
import { ConnectButton } from '@rainbow-me/rainbowkit'

const Header = () => {
  return (
    <Flex
        justifyContent="space-between"
        alignItems="center"
        p="2rem"
    >
        <Text fontSize="2xl" fontWeight="bold">KAYP</Text>
        <ConnectButton />
    </Flex>
  )
}

export default Header
