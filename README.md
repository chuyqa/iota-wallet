# iota-wallet
Dockerized iota wallet

1. Update the Dockerfile to set your own Iota password
2. Verify the .deb download checksum on https://github.com/iotaledger/wallet/releases
3. Build the Container
```
docker build -t iota-wallet .
```
4. Start the container, exposing VNC port locally
```
docker run -it --rm --name iotaw -p 5900:5900 iota-wallet
```
5. Generate a secure secret via steps in https://blog.iota.org/the-secret-to-security-is-secrecy-d32b5b7f25ef

