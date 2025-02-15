import UIKit

// Valid Anagram - Explanation

/*
 Problem statement - Given two strings "s" and "t", return "true" if the two strings are anagram of each other, otherwise return "false".
 An anagram is a string that contains the exact same characters as another string, but the order of the characters can be different.
 Example 1 - Input: s = "racecar", t = "carrace"
 Output: true
 Example 2 - Input: s = "jar", t = "jam"
 Output: false
 
 Constraint - s and t consist of lowercase English letters
 */

let sInput1 = "racecar"
let tInput1 = "carrace"
let sInput2 = "jar"
let tInput2 = "jam"

// Sorting
/*
 Time Complexity - O(nlogn + mlogm)
 Space Complexity - O(1) or O(n+m) depending on sorting algorithm
 */
func isAnagramUsingSorting(s: String, t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    return s.sorted() == t.sorted()
}

isAnagramUsingSorting(s: sInput1, t: tInput1)
isAnagramUsingSorting(s: sInput2, t: tInput2)

// Using Dictionary
/*
 Time Complexity - O(n + m)
 Space Complexity - O(1)
 */
func isAnagramUsingDictionary(s: String, t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    var countS = [Character: Int]()
    var countT = [Character: Int]()
    
    for char in s {
        countS[char, default: 0] += 1
    }
    
    for char in t {
        countT[char, default: 0] += 1
    }
    
    return countS == countT
}

isAnagramUsingDictionary(s: sInput1, t: tInput1)
isAnagramUsingDictionary(s: sInput2, t: tInput2)

// Using Dictionary Optimal
/*
 Time Complexity - O(n + m)
 Space Complexity - O(1)
 */
func isAnagramUsingDictionaryOptimalSolution(s: String, t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    
    var count = [Int](repeating: 0, count: 26)
    
    for i in s.indices {
        count[Int(s[i].asciiValue! - Character("a").asciiValue!)] += 1
        count[Int(t[i].asciiValue! - Character("a").asciiValue!)] -= 1
    }
    
    for value in count {
        if value != 0 {
            return false
        }
    }
    return true
}

isAnagramUsingDictionaryOptimalSolution(s: sInput1, t: tInput1)
isAnagramUsingDictionaryOptimalSolution(s: sInput2, t: tInput2)
