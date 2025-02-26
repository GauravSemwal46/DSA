import UIKit

// Find minimum in rotated sorted array

/*
 Problem Statement - You are given an array of length "n" which was originally sorted in ascending order. It has now been rotated between 1 and n times
 For example nums = [1,2,3,4,5,6] might become [3,4,5,6,1,2] if it was rotated 4 times
 Assuming all the elements in the rotated sorted array nums are unique, return the minimum element of this array.
 */

let input = [1,2,3,4,5,6]

// Brute Force
/*
 Time Complexity - O(n)
 Space Complexity - O(1)
 */
func findMinBruteForce(nums: [Int]) -> Int {
    guard nums.count > 0 else { return Int.min }
    return nums.min()!
}

findMinBruteForce(nums: input)

// Binary Search
/*
 Time Complexity - O(logn)
 Space Complexity - O(1)
 */
func findMinUsingBinarySearch(nums: [Int]) -> Int {
    if nums.isEmpty {
        return Int.min
    }
    var left = 0
    var right = nums.count-1
    
    while left < right {
        let mid = left + (right - left) / 2
        
        if nums[mid] > nums[right] {
            left = mid + 1
        } else {
            right = mid
        }
    }
    return nums[left]
}

findMinUsingBinarySearch(nums: input)
