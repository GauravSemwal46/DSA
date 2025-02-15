import UIKit

// Contains Duplicate - Explanation

/*
 Problem Statement - Given an integer array "nums", return "true" if any value appears more than once in the array, otherwise return "false".
 Example 1 - Input: nums = [1,2,3,3]
 Output: true
 Example 2 - Input: nums = [1,2,3,4]
 Output: false
 */

// Input arrays
let input1 = [1,2,3,4]
let input2 = [1,2,3,3]

// Brute Force Approach
/*
 Time Complexity - O(n^2)
 Space Complexity - O(1)
 */
func hasDuplicateBruteForce(nums: [Int]) -> Bool {
    for (index, value) in nums.enumerated() {
        for j in index+1..<nums.count {
            if value == nums[j] {
                return true
            }
        }
    }
    return false
}

hasDuplicateBruteForce(nums: input1)
hasDuplicateBruteForce(nums: input2)

// Sorting
/*
 Time Complexity - O(nlogn)
 Space Complexity - O(1) or O(n) depending on the sorting algorithm
 */
func hasDuplicateUsingSorting(nums: [Int]) -> Bool {
    let sortedNums = nums.sorted()
    for i in 1..<nums.count {
        if sortedNums[i] == sortedNums[i-1] {
            return true
        }
    }
    return false
}

hasDuplicateUsingSorting(nums: input1)
hasDuplicateUsingSorting(nums: input2)

// Using Dictionary
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
func hasDuplicateUsingDictionary(nums: [Int]) -> Bool {
    var dict: [Int: Int] = [:]
    for num in nums {
        if let _ = dict[num] {
            return true
        }
        dict[num] = 1
    }
    return false
}

hasDuplicateUsingDictionary(nums: input1)
hasDuplicateUsingDictionary(nums: input2)

// Using Set Length
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
func hasDuplicateUsingSet(nums: [Int]) -> Bool {
    let set = Set(nums)
    return set.count < nums.count
}

hasDuplicateUsingSet(nums: input1)
hasDuplicateUsingSet(nums: input2)
