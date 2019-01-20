# REQUIRED CHANGE - In serverConfig.js, make sure ChainIpAddr points to ganache-cli container name
```
const config = {
    ChainPortNo: 8545,
    ChainIpAddr: "ganache-cli-container", // IP address of the system running private ethereum chain
    WebPortNo: 8546
};
```

# SampleDapp
Blockchain Explorer for my private ethereum block.

This is a block chain explorer for my private network created through geth.
This project is inspired from etherscan.io

# Running the app
1. Run your private ethereum network. Change --rpcaddr "a.b.c.d" as per IP addr of the system running the private network.

        geth --identity "NodeName" --networkid 888 --rpc --rpcport "8545" --rpccorsdomain "*" --rpcaddr "a.b.c.d" --datadir "./chaindata/" --port "30330" --nodiscover --rpcapi "db,eth,net,web3,personal"

2. Edited "serverConfig.js"
changed ChainIP address to : ChainIpAddr: "ganache-cli-container", to address over network container by name
build the container:
```docker build -t eshnil2000/dappsuni-ganache-cli . ```

Create a network in docker, start 
```
echo $ssh->exec('docker network create ganache-cli');
echo $ssh->exec('docker run -dt --name ganache-cli-container --net ganache-cli -p 8545:8545 eshnil2000/dappsuni-ganache-cli');
echo $ssh->exec('docker run --net ganache-cli -d -p 8546:8546 --name eth-explore eshnil2000/private-eth-explorer');
```

3. Run "npm start".
        The app is running on "localhost:port" defined in "serverConfig.js" (default : localhost:8546).      
 
4. For first time there will not be any block data. So please click 'Get blocks from Chain' button on Block List Page.
   It will take some time so be patient.   
