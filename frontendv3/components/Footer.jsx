"use client"
import { Flex, Text } from '@chakra-ui/react'

const Footer = () => {
  return (
    <Flex
        p="2rem"
        justifyContent="center"
        alignItems="center"
    >
        <Text> &copy; Coded with love and patience by ddiieeggoo {new Date().getFullYear()}</Text>
    </Flex>
  )
}

export default Footer
