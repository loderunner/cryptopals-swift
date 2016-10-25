//
//  main.swift
//  01-02-fixed-xor
//
//  Created by Charles Francoise on 24/10/2016.
//  Copyright © 2016 Charles Francoise. All rights reserved.
//

var hex1, hex2 : String!

if CommandLine.arguments.count < 3 {
    hex1 = "1c0111001f010100061a024b53535009181c"
    hex2 = "686974207468652062756c6c277320657965"
} else {
    hex1 = CommandLine.arguments[1]
    hex2 = CommandLine.arguments[2]
}

let a = Cryptopals.hexDecode(hex1)!
let b = Cryptopals.hexDecode(hex2)!
let x = Cryptopals.fixedXor(a, b)
let s = Cryptopals.hexEncode(x)

print(s)

if CommandLine.arguments.count < 3 {
    assert(s == "746865206b696420646f6e277420706c6179")
}
