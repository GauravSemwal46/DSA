import UIKit

// Group Anagrams

/*
 Problem Statement - Given an array of strings "strs", group all anagrams together into sublists. You may return the output in any order.
 
 Example1: Input: str = ["act", "pots", "tops", "cat", "stop", "hat"]
 Output: [["hat"],["act","cat"],["stop", "pots", "tops"]]
 
 Example2: Input: strs = ["x"]
 Output: [["x"]]
 
 Example3: Input: strs = [""]
 Output: [[""]]
 
 Constraints
 1 <= strs.count <= 1000
 0 <= strs[i].count <= 100
 strs[i] is made up of lowercase English letters
 */

let input1 = ["act", "pots", "tops", "cat", "stop", "hat"]
let input2 = ["x"]
let input3 = [""]

// Using Sorting
/*
 Time Complexity - O(m*nlogn)
 Space Complexity - O(m*n)
 */
func groupAnagramsUsingSorting(strs: [String]) -> [[String]] {
    var result = [String: [String]]()
    
    for str in strs {
        let sortedStr = String(str.sorted())
        result[sortedStr, default: []].append(str)
    }
    
    return Array(result.values)
}

groupAnagramsUsingSorting(strs: input1)
groupAnagramsUsingSorting(strs: input2)
groupAnagramsUsingSorting(strs: input3)

// Using Hash Table
/*
 Time Complexity - O(m*n)
 Space Complexity - O(m)
 */
func groupAnagramsUsingHashTable(strs: [String]) -> [[String]] {
    var result = [Array<Int>: [String]]()
    
    for str in strs {
        // Array to store letter frequency.
        var count = Array(repeating: 0, count: 26)
        
        for char in str {
            // Increment the count of each character
            count[Int(char.asciiValue! - Character("a").asciiValue!)] += 1
        }
        
        // Append the string to the corresponding list of anagrams
        result[count, default: []].append(str)
    }
    // return the grouped anagrams as an array
    return Array(result.values)
}
