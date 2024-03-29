import { useState, useEffect } from 'react'

import { useAccount, useReadContract } from 'wagmi'
import { contractAbi, contractAddress } from '@/constants'

import { publicClient } from '@/utils/client'

import { parseAbiItem } from 'viem'
import MintBLToken from './MintBLToken'

const Kayp = () => {

  const { address } = useAccount();
  const [events, setEvents] = useState([])

  // const getEvents = async() => {
  //   const depositEvents = await publicClient.getLogs({
  //     address: contractAddress,
  //     event: parseAbiItem('event etherDeposited(address indexed account, uint amount)'),
  //     // du premier bloc
  //     fromBlock: 5578591,
  //     // jusqu'au dernier
  //     toBlock: 'latest' // Pas besoin valeur par défaut
  //   })

    // const withdrawEvents = await publicClient.getLogs({
    //   address: contractAddress,
    //   event: parseAbiItem('event etherWithdrawed(address indexed account, uint amount)'),
    //   // du premier bloc
    //   fromBlock: 5578591,
    //   // jusqu'au dernier
    //   toBlock: 'latest' // Pas besoin valeur par défaut
    // })

    // const combinedEvents = depositEvents.map((event) => ({
    //   type: 'Deposit',
    //   address: event.args.account,
    //   amount: event.args.amount,
    //   blockNumber: Number(event.blockNumber)
    // })).concat(withdrawEvents.map((event) => ({
    //   type: 'Withdraw',
    //   address: event.args.account,
    //   amount: event.args.amount,
    //   blockNumber: Number(event.blockNumber)
    // })))

    // sort by value
  //   combinedEvents.sort(function (a, b) {
  //     return b.blockNumber - a.blockNumber;
  //   });

  //   setEvents(combinedEvents)
  // }

  // useEffect(() => {
  //   const getAllEvents = async() => {
  //     if(address !== 'undefined') {
  //       await getEvents();
  //     }
  //   }
  //   getAllEvents();
  // }, [address])

  return (
    <>
      <h1>HELLO KAYP</h1>
      <h2>create your tokenazed Bill of Lading by providing your informations</h2>
      <MintBLToken/>
    </>
  )
}

export default Kayp
