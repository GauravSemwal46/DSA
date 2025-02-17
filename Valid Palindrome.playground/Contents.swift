import UIKit

// Valid Palindrome

/*
 Problem Statement - Given a string "s", return "true" if it is palindrome otherwise return "false"
 A palindrome string is a string that reads the same forward and backward.
 
 Example1 - Input: s = "Was it a car or a cat I saw?"
 Output: true
 Example2 - Input: s = "tab a cat"
 Output: false
 
 Constraint - 1<=s.count<=1000
 s is made up of only printable ASCII characters.
 */

let input1 = "Was it a car or a cat I saw?"
let input2 = "tab a cat"

// Reverse String
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
func isPalindrome(_ s: String) -> Bool {
    var newStr = ""
    for char in s {
        if char.isLetter || char.isNumber {
            newStr.append(char.lowercased())
        }
    }
    return newStr == String(newStr.reversed())
}

isPalindrome(input1)
isPalindrome(input2)

// Using two Pointers
/*
 Time Complexity - O(n)
 Space Complexity - O(1)
 */
func isPalindromeUsingTwoPointer(_ s: String) -> Bool {
    var left = 0
    var right = s.count-1
    let characters = Array(s)
    
    while left < right {
        while left < right && !characters[left].isLetter && !characters[left].isNumber {
            left += 1
        }
        while left < right && !characters[right].isLetter && !characters[right].isNumber {
            right -= 1
        }
        if characters[left].lowercased() != characters[right].lowercased() {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}
isPalindromeUsingTwoPointer(input1)
isPalindromeUsingTwoPointer(input2)
