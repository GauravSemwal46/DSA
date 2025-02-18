import UIKit

// Valid Parenthesis

/*
 Problem Statement - You are given a string "s" consisting of the following characters '(',')','{'.'}','[',']'
 The input string s is valid only if:
 1. Every open bracket is closed by the same type of close bracket
 2. Open brackets are closed in correct order
 3. Every close bracket has a corresponding open bracket of the same type.
 Return true if s is valid, and false otherwise
 
 Example1- Input: s ="[]"
 Output: true
 
 Example2- Input: "[(])"
 Output: false
 */

var input1 = "[]"
var input2 = "[(])"
var input3 = "[({})]"

// Brute Force
/*
 Time Complexity - O(n^2)
 Space Complexity - O(n)
 */
func isValidBruteForce(s: String) -> Bool {
    var str = s
    while (str.contains("()") || str.contains("[]") || str.contains("{}")) {
        str = str.replacing("()", with: "")
        str = str.replacing("{}", with: "")
        str = str.replacing("[]", with: "")
    }
    return str.isEmpty
}

isValidBruteForce(s: input1)
isValidBruteForce(s: input2)
isValidBruteForce(s: input3)

// Using Stack
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
func isValidUsingStack(s: String) -> Bool {
    var stack = [Character]()
    
    for char in s {
        switch char {
        case "{", "(", "[" :
            stack.append(char)
        case "}":
            if stack.isEmpty || stack.last != "{" {
                return false
            }
            stack.popLast()
        case ")":
            if stack.isEmpty || stack.last != "(" {
                return false
            }
            stack.popLast()
        case "]":
            if stack.isEmpty || stack.last != "[" {
                return false
            }
            stack.popLast()
        default:
            break
        }
    }
    return stack.isEmpty
}

isValidUsingStack(s: input1)
isValidUsingStack(s: input2)
isValidUsingStack(s: input3)
