import { useState, useEffect } from 'react'

import { useAccount, useReadContract } from 'wagmi'
import { contractAbi, contractAddress } from '@/constants'

import { publicClient } from '@/utils/client'

import { parseAbiItem } from 'viem'
import MintBLToken from './MintBLToken'

const Kayp = () => {

  const { address } = useAccount();

  return (
    <>
      <h2>create your tokenized Bill of Lading by providing your informations</h2>
      <MintBLToken/>
    </>
  )
}

export default Kayp
