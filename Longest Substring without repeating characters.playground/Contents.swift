import UIKit

// Longest Substring without repeating characters

/*
 Problem Statement - Given a string s find the length of the longest substring without duplicate characters.
 A substring is a contiguous sequence of characters within a string.
 Example 1 - Input: s = "zxyzxyz
 Output: 3
 */

func lengthOfLongestSubstring(s: String) -> Int {
    var mp = [Character: Int]()
    var length = 0
    var result = 0
    
    for (index, char) in s.enumerated() {
        if let prevIndex = mp[char] {
            length = max(prevIndex+1, length)
        }
        mp[char] = index
        result = max(result, index-length+1)
    }
    return result
}

let input = "zxyzxyz"
lengthOfLongestSubstring(s: input)
