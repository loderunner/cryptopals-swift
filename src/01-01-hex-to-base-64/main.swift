//
//  hex2b64.swift
//  cryptopals
//
//  Created by Charles Francoise on 17/10/2016.
//  Copyright © 2016 Charles Francoise. All rights reserved.
//

var hex : String!

if CommandLine.arguments.count < 2 {
    hex = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
} else {
    hex = CommandLine.arguments[1]
}

let a = Cryptopals.hexDecode(hex)!
let b64 = Cryptopals.base64Encode(a)

print(b64)

if CommandLine.arguments.count < 2 {
    assert(b64 == "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t")
}
