# Rate My Block-fessor

This purpose of this web app is to be deployed to educational institutions that would like to have a private teacher rating system in place. After students successfully complete a class ethereum tokens will be distributed. The student can use the front-end to submit a review using the token they were given, and the record will be kept on the localy hosted, immutable ethereum blockchain network. 

The project is is based on a traditional web front-end stack, which utilizes bootsrap. The back-end is run using Node.js, and the records for teachers are written as smart contracts (in solidity, to be submitted and kept on the blockchain for indefinite storage.

Follow the steps below to and run this project. If you are having trouble refer to this video: https://youtu.be/3681ZYbDSSk


## Dependencies
Install these prerequisites to follow along with the tutorial. See free video tutorial or a full explanation of each prerequisite.
- NPM: https://nodejs.org
- Truffle: https://github.com/trufflesuite/truffle
- Ganache: http://truffleframework.com/ganache/
- Metamask: https://metamask.io/

## Step 2. Install dependencies
```
$ npm install
```
## Step 3. Start Ganache
Open the Ganache GUI client that you downloaded and installed. This will start your local blockchain instance.


## Step 4. Compile & Deploy Election Smart Contract
`$ truffle migrate --reset`
You must migrate the election smart contract each time your restart ganache.

## Step 5. Configure Metamask
- Unlock Metamask
- Connect metamask to your local Etherum blockchain provided by Ganache.
- Import an account provided by ganache.

## Step 6. Run the Front End Application
`$ npm run dev`
Visit this URL in your browser: http://localhost:3000
