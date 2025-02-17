import UIKit

// Product of Array except self
/*
 Problem statement- Given an array "nums", return an array "output" where output[i] is the product of all the elements of "nums" except nums[i]
 Example1: Input: nums = [1,2,4,6]
 Output: [48,24,12,8]
 
 Example2- Input: [-1,0,1,2,3]
 Output: [0,-6,0,0,0]
 
 Constraint 2<=nums.count<=1000
 -20<=nums[i]<=20
 */

let input1 = [1,2,4,6]
let input2 = [-1,0,1,2,3]

// Brute Force
/*
 Time Complexity - O(n^2)
 Space Complexity - O(1)
 */
func productExceptSelfBruteForce(nums: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: nums.count)
    
    for i in 0..<nums.count {
        var prod = 1
        for j in 0..<nums.count {
            if i == j {
                continue
            }
            prod *= nums[j]
        }
        result[i] = prod
    }
    return result
}

productExceptSelfBruteForce(nums: input1)
productExceptSelfBruteForce(nums: input2)

// Division
/*
 Time Complexity - O(n)
 Space Complexity - O(1)
 */
func productExceptSelfUsingDivision(nums: [Int]) -> [Int] {
    var prod = 1
    var zeroCount = 0
    
    for num in nums {
        if num != 0 {
            prod *= num
        } else {
            zeroCount += 1
        }
    }
    
    var result = Array(repeating: 0, count: nums.count)
    if zeroCount > 1 {
        return result
    }
    
    for i in nums.indices {
        if zeroCount > 0 {
            result[i] = nums[i] == 0 ? prod : 0
        } else {
            result[i] = prod / nums[i]
        }
    }
    return result
}

productExceptSelfUsingDivision(nums: input1)
productExceptSelfUsingDivision(nums: input2)
