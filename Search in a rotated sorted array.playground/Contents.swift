import UIKit

// Search in rotated sorted array

/*
 Problem Statement - You are given an array of length "n" which was originally sorted in ascending order. It has now been rotated between 1 and n times
 For example nums = [1,2,3,4,5,6] might become [3,4,5,6,1,2] if it was rotated 4 times
 Given the rotated sorted array "nums" and an integer "target" return the index of "target" within "nums" or "-1" if it is not present.
 Assuming all the elements in the rotated sorted array nums are unique.
 
 Example 1 - Input: nums = [3,4,5,6,1,2], target = 1
 Output: 4
 */

let input = [3,4,5,6,1,2]
let target = 1

// Brute Force
/*
Time Complexity - O(n)
 Space Complexity - O(1)
 */

func searchBruteForce(nums: [Int], target: Int) -> Int {
    for i in nums.indices {
        if nums[i] == target {
            return i
        }
    }
    return -1
}
searchBruteForce(nums: input, target: target)

// Binary Search
func binarySearch(nums: [Int], target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        if target == nums[mid] {
            return mid
        }
        if nums[left] <= nums[mid] {
            if target > nums[mid] || target < nums[left] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        } else {
            if target < nums[mid] || target > nums[right] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    }
    return -1
}
binarySearch(nums: input, target: target)
