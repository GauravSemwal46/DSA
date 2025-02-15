import UIKit

// Two Sum Explanation
/*
 Problem Statement - Given an array of integers "nums" and an integer "target", return the indices "i" and "j" such that "nums[i]+nums[j] ==  target" and "i != j"
 You may assume that every input has exactly one pair of indices i and j that satisfy the condition.
 Return the answer with smaller index first.
 Example1 - Input: nums = [3,4,5,6] target = 7
 Output: [0,1]
 Example1 - Input: nums = [4,5,6] target = 10
 Output: [0,2]
 */

let input1 = [3,4,5,6]
let input2 = [4,5,6]
let target1 = 7
let target2 = 10


// Brute Force Approach
/*
 Time Complexity = O(n^2)
 Space Complexity = O(1)
 */
func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
    for i in nums.indices {
        for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}

twoSumBruteForce(nums: input1, target: target1)
twoSumBruteForce(nums: input2, target: target2)

// Sorting
/*
 Time Complexity - O(nlogn)
 Space Complexity - O(n)
 */
func twoSumUsingSorting(nums: [Int], target: Int) -> [Int] {
    let sortedArray = nums.sorted()
    var i = 0
    var j = nums.count - 1
    
    while i < j {
        let curSum = sortedArray[i] + sortedArray[j]
        if curSum == target {
            return [i, j]
        } else if curSum < target {
            i += 1
        } else {
            j -= 1
        }
    }
    return []
}

twoSumUsingSorting(nums: input1, target: target1)
twoSumUsingSorting(nums: input2, target: target2)

// Using Dictionary
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
func twoSumUsingDictionary(nums: [Int], target: Int) -> [Int] {
    var dict = [Int: Int]()
    
    for (index, value) in nums.enumerated() {
        let diff = target - value
        if let i = dict[diff] {
            return [i, index]
        }
        dict[value] = index
    }
    return []
}
twoSumUsingDictionary(nums: input1, target: target1)
twoSumUsingDictionary(nums: input2, target: target2)
