Introduction

This repository aims to be the Proof of concept for the KAYP startup owned by Hugo Deissaidane.

It is first affiliate with an educational project of Alyra, a blockchain and AI school.

KAYP aims to digitalize documents of maritima trades, starting with the Bill of lading using blockhain technologies to ensure the traceablity and efficiency of such documents.

The educational project was formed by: Hugo Deissaidane (consultant), Paulin Tikouahi (consultant) and ddiieggoo (blockchain developer)


Technologies used

Backend:

Solidity 0.8.24,
Foundry,
OpenZeppelin Contracts

Frontend:

Next.js,
Wagmi/Viem,
Rainbowkit,
Vercel,

IDE and AI:

VSCode,
GPT4,
Copilot

Test our Dapp !

Follow this link : [kayp.vercel.app](https://kayp.vercel.app/)




standars security issues answered :

reetrency : The smart contract does not handle any eth

DOS unexpected error : The smart contract does not handle any eth

DOS gas limit : There is no computation in the elements of the array of every Bill of ladings, only the .length of the array is called, so the gas limit attack is theorically impossible.

DOS force feeding : The smart contract wille never trigger a require on his balance
