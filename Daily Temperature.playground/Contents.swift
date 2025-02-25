import UIKit

// Daily Temperature

/*
 Problem Statement - You are given an array of integers "temperatures" where "temperatures[i]" represents the daily temperatures on the ith day.
 Return an array "result" where "result[i]" is the number of days after the "ith" day before a warmer temperature appears on a future day. If there is no day in the future where a warmer temperature will appear for the "ith" day, set result[i] to 0 instead.
 
 Example1- Input: temperatures = [30,38,30,36,35,40,28]
 Output: [1,4,1,2,1,0,0]
 
 Example2- Input: temperatures = [22,21,20]
 Output: [0,0,0]
 */

let input1 = [30,38,30,36,35,40,28]
let input2 = [22,21,20]

func dailyTemperature(temperatures: [Int]) -> [Int] {
    let n = temperatures.count
    var result = Array(repeating: 0, count: n)
    var stack = [Int]()
    
    for i in 0..<n {
        while !stack.isEmpty && temperatures[i] > temperatures[stack.last!] {
            let index = stack.removeLast()
            result[index] = i - index
        }
        stack.append(i)
    }
    return result
}

dailyTemperature(temperatures: input1)
dailyTemperature(temperatures: input2)
