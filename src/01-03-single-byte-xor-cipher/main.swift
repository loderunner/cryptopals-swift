//
//  main.swift
//  01-03-single-byte-xor-cipher
//
//  Created by Charles Francoise on 25/10/2016.
//  Copyright © 2016 Charles Francoise. All rights reserved.
//

var cipherText: String!
var cipherHex: String!

cipherHex = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

let a = Cryptopals.hexDecode(hex)!
let b64 = Cryptopals.base64Encode(a)

print(b64)

