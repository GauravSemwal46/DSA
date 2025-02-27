import UIKit

// Encode and Decode String

/*
 Problem Statement - Design an algorithm to encode a list of strings to a single string. The encoded string is then decoded back to the original list of string
 Please implement encode and decode
 */

func encode(strs: [String]) -> String {
    var result = ""
    for str in strs {
        result += "\(str.count)" + "#" + str
    }
    return result
}

func decode(encoded: String) -> [String] {
    var result: [String] = []
    var i = encoded.startIndex
    
    while i < encoded.endIndex {
        var j = i
        while encoded[j] != "#" {
            encoded.formIndex(after: &j)
        }
        
        let length = Int(encoded[i..<j]) ?? 0
        i = encoded.index(after: j)
        
        let start = i
        let end = encoded.index(i, offsetBy: length)
        result.append(String(encoded[start..<end]))
        i = end
    }
    return result
}

let input = ["neet", "code", "love", "you"]
let encoded = encode(strs: input)
let decoded = decode(encoded: encoded)
