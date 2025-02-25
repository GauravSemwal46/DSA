import UIKit

// Generate Parenthesis

/*
 You are given an integer "n". Return all well formed parenthesis strings that you can generate with "n" pairs of parenthesis
 
 Example1- Input: n = 1
 Output: ["()"]
 
 Example2- Input: n = 3
 Output: ["((()))", "(()())", "(())()", "()(())", "()()()"]
 */

let input1 = 1
let input2 = 3

func generateParenthesis(_ n: Int) -> [String] {
    var result = [String]()
    generateAllCombination(current: "", open: 0, close: 0, n: n, result: &result)
    return result
}

func generateAllCombination(current: String, open: Int, close: Int, n: Int, result: inout[String]) {
    if current.count == n * 2 {
        result.append(current)
        return
    }
    
    if open < n {
        generateAllCombination(current: current + "(", open: open+1, close: close, n: n, result: &result)
    }
    if close < open {
        generateAllCombination(current: current + ")", open: open, close: close+1, n: n, result: &result)
    }
}

generateParenthesis(input1)
print(generateParenthesis(input2))
