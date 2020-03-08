# easy-rsa

[easy-rsa](https://github.com/OpenVPN/easy-rsa) docker wrapper.

easy-rsa is a CLI utility to build and manage a PKI CA. In laymen's terms, this means to create a root certificate authority, and request and sign certificates, including intermediate CAs and certificate revocation lists (CRL).

**Warning:** works only with PKI created by this tool.

## Installation

### Setup PKI

Save PKI config as `vars`. [`vars.example`](https://github.com/OpenVPN/easy-rsa/blob/master/easyrsa3/vars.example) can be used as template.

### Build image

```sh
docker build -t easy-rsa .
```

## Usage

PKI path in container is `/var/lib/easy-rsa`.

*Note*: PKI path insinde container is `/var/lib/easy-rsa`.

Usage is the same to 
[origin](https://github.com/OpenVPN/easy-rsa/blob/master/README.quickstart.md),
except of mount PKI folder.

### Examples

*Note*: change `$(pwd)` and `$(pwd)/pki` path in all commands below. 
`$(pwd)` needs only with `init-pki` command. `$(pwd)/pki` is the folder
created by `init-pki` command.

## Initialize PKI

```sh
docker run --rm -it -v $(pwd):/var/lib/easy-rsa easy-rsa init-pki
```

## Build CA

```sh
docker run --rm -it -v $(pwd)/pki:/var/lib/easy-rsa/pki easy-rsa build-ca
```

or 
```sh
docker run --rm -it -v $(pwd)/pki:/var/lib/easy-rsa/pki easy-rsa build-ca nopass
```
if you don't want to use password.

## Build server certificate

```sh
docker run --rm -it -v $(pwd)/pki:/var/lib/easy-rsa/pki easy-rsa build-server-full $SERVER_NAME
```

or 
```sh
docker run --rm -it -v $(pwd)/pki:/var/lib/easy-rsa/pki easy-rsa build-server-full $SERVER_NAME nopass
```
if you don't want to use password.

## Build client certificates

```sh
docker run --rm -it -v $(pwd)/pki:/var/lib/easy-rsa/pki easy-rsa build-client-full $CLIENT_NAME
```

or 
```sh
docker run --rm -it -v $(pwd)/pki:/var/lib/easy-rsa/pki easy-rsa build-client-full $CLIENT_NAME nopass
```
if you don't want to use password.
