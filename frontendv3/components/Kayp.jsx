import { useState, useEffect } from 'react'

import { useAccount, useReadContract } from 'wagmi'
import { contractAbi, contractAddress } from '@/constants'

import { publicClient } from '@/utils/client'

import { parseAbiItem } from 'viem'
import MintBLToken from './MintBLToken'
import TransferFrom from './TransferFrom'
import RetrieveBLFromId from './RetrieveBLFromId'

const Kayp = () => {

  const { address } = useAccount();

  return (
    <>
      <h2>Create your tokenized Bill of Lading by providing your informations</h2>
      <MintBLToken/>
      <h2>Transfer the ownership of your tokenazid Bill of Lading</h2>
      <TransferFrom/>
      <h2>Retrieve your Bill of Lading from your token ID</h2>
      <RetrieveBLFromId/>
    </>
  )
}

export default Kayp
