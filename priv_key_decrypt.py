from web3.auto import w3
with open("/home/eps106-epixel/Documents/Gerard/node1/keystore/UTC--2024-04-15T10-51-09.553251581Z--3452b54d93d5133dab004ad7b72f686fb6585285") as keyfile:
encrypted_key = keyfile.read()
private_key=w3.eth.account.decrypted(encrypted_key,'123')

import binascii
print("this is your pvt key : ")
print(binascii.b2a_hex(private_key))
