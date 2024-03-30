"use client"
import Header from './Header'
import Footer from './Footer'
import { Flex } from '@chakra-ui/react'

const Layout = ({ children }) => {
  return (
    <Flex
      direction="column"
      minH="100vh" // Ensure the layout takes at least the full height of the viewport
    >
        <Header />
        <Flex
          direction="column" // Adjusted for consistency; remove if not necessary
          flex="1" // Ensure this takes up available space, pushing Header and Footer to bounds
          p="2rem"
          overflow="auto" // Adds scroll to the content area if it overflows
        >
            {children}
        </Flex>
        <Footer />
    </Flex>
  )
}

export default Layout
