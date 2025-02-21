import UIKit

// Evaluate Reverse Polish Notation

/*
 Problem Statement - You are given an array of string "tokens" that represent a valid arithmetic expression in Reverse Polish notation
 Return the integer that represent the evaluation of the expression
 the operands may be integers or result of other operation
 the operators includes +, -, *, /
 Assume that division between integers always truncates toward zero
 */

// Using stack
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */

func evalRPN(_ tokens: [String]) -> Int {
    var stack: [Int] = []
    
    for token in tokens {
        if let number = Int(token) {
            stack.append(number)
        } else {
            let b = stack.removeLast()
            let a = stack.removeLast()
            
            switch token {
            case "+":
                stack.append(a+b)
            case "-":
                stack.append(a-b)
            case "*":
                stack.append(a*b)
            case "/":
                let result = a/b
                stack.append(result)
            default:
                break
            }
        }
    }
    return stack.last!
}

let input = ["1","2","+","3","*","4","-"]
print(evalRPN(input))
