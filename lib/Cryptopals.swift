//
//  Cryptopals.swift
//  cryptopals
//
//  Created by Charles Francoise on 17/10/2016.
//  Copyright © 2016 Charles Francoise. All rights reserved.
//


struct Cryptopals {
    
    typealias ByteArray = ContiguousArray<UInt8>
    
    static func hexDecode(_ hexString: String) -> ByteArray? {
        let hexChars = Array(hexString.characters)
        
        if (hexChars.count % 2) != 0 {
            return nil
        }
        
        let count = hexChars.count / 2
        var ret = ByteArray()
        ret.reserveCapacity(count)
        
        for i in stride(from: 0, to: hexString.characters.count, by: 2) {
            if let hexByte = UInt8(String(hexChars[i...i+1]), radix: 16) {
                ret.append(hexByte)
            } else {
                return nil
            }
        }
        
        return ret
    }
    
    static func hexEncode(_ arr: ByteArray) -> String {
        var str = ""
        str.reserveCapacity(arr.count * 2)
        
        for b in arr {
            str += String(b, radix: 16)
        }
        
        return str
    }
    
    
    static let b64codes = ["A", "B", "C", "D", "E", "F", "G", "H",
                           "I", "J", "K", "L", "M", "N", "O", "P",
                           "Q", "R", "S", "T", "U", "V", "W", "X",
                           "Y", "Z", "a", "b", "c", "d", "e", "f",
                           "g", "h", "i", "j", "k", "l", "m", "n",
                           "o", "p", "q", "r", "s", "t", "u", "v",
                           "w", "x", "y", "z", "0", "1", "2", "3",
                           "4", "5", "6", "7", "8", "9", "+", "/"]
    static let b64pad = "="
    
    static func base64Encode(_ arr: ByteArray) -> String {
        var remainingBytes = arr.count
        var str: String = ""
        str.reserveCapacity(remainingBytes * 4 / 3)
        var i = 0
        while remainingBytes > 2 {
            let inputGroup = (UInt32(arr[i]) << 16) | (UInt32(arr[i+1]) << 8) | UInt32(arr[i+2])
            
            for shift in stride(from: UInt32(18), through: 0, by: -6) {
                let input = (inputGroup >> shift) & 0x3f
                str += b64codes[Int(input)]
            }
            
            i += 3
            remainingBytes -= 3
        }
        
        switch remainingBytes {
        case 2:
            let inputGroup = (UInt32(arr[i]) << 16) | (UInt32(arr[i+1]) << 8)
            
            for shift in stride(from: UInt32(18), through: 6, by: -6) {
                let input = (inputGroup >> shift) & 0x3f
                str += b64codes[Int(input)]
            }
            str += b64pad
        case 1:
            let inputGroup = UInt32(arr[i]) << 16
            
            for shift in stride(from: UInt32(18), through: 12, by: -6) {
                let input = (inputGroup >> shift) & 0x3f
                str += b64codes[Int(input)]
            }
            str += b64pad + b64pad
        default:
            break
        }
        
        return str
    }
    
    static func fixedXor(_ a: ByteArray, _ b: ByteArray) -> ByteArray {
        assert(a.count == b.count)
        
        var ret = ByteArray()
        ret.reserveCapacity(a.count)
        for (l,r) in zip(a, b) {
            ret.append(l^r)
        }
        return ret
    }
    
    let letterFrequency = ["e": 0.12702,
                           "t": 0.9056,
                           "a": 0.8167,
                           "o": 0.7507,
                           "i": 0.6966,
                           "n": 0.6749,
                           "s": 0.6327,
                           "h": 0.6094,
                           "r": 0.5987,
                           "d": 0.4253,
                           "l": 0.4025,
                           "c": 0.2782,
                           "u": 0.2758,
                           "m": 0.2406,
                           "w": 0.2361,
                           "f": 0.2228,
                           "g": 0.2015,
                           "y": 0.1974,
                           "p": 0.1929,
                           "b": 0.1492,
                           "v": 0.0978,
                           "k": 0.0772,
                           "j": 0.0153,
                           "x": 0.0150,
                           "q": 0.0095,
                           "z": 0.0074]
}
