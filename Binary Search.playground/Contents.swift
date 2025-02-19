import UIKit

// Binary Search

/*
 Problem Statement- You are given an array of distinct integers "nums", sorted in ascending order, and an integer "target".
 Implement a function to search for target within nums. If its exits then return its index otherwise return -1.
 Your solution must run in O(logn) time
 
 Example 1- Input: nums = [-1,0,2,4,6,8], target = 4
 Output: 3
 
 Example 2- Input: nums = [-1,0,2,4,6,8], target = 3
 Output: -1
 */
let input = [-1,0,2,4,6,8]
let target1 = 4
let target2 = 3

// Iterative Binary Search
/*
 Time Complexity - O(logn)
 Space Complexity - O(1)
 */
func binarySearch(nums: [Int], target: Int) -> Int {
    guard !nums.isEmpty else { return -1 }
    
    var leftIndex = 0
    var rightIndex = nums.count - 1
    
    while leftIndex <= rightIndex {
        let midIndex = leftIndex + (rightIndex - leftIndex) / 2
        let midValue = nums[midIndex]
        
        if midValue == target {
            return midIndex
        } else if midValue < target {
            leftIndex = midIndex + 1
        } else {
            rightIndex = midIndex - 1
        }
    }
    return -1
}

binarySearch(nums: input, target: target1)
binarySearch(nums: input, target: target2)
