import UIKit

// ------------------------------------------------------------------------ //
/*
 Description
 You are given an array of integers nums containing n + 1 integers. Each integer in nums is in the range [1, n] inclusive.

 Every integer appears exactly once, except for one integer which appears two or more times. Return the integer that appears more than once.
 */
// ------------------------------------------------------------------------ //

let nums = [1,2,3,2,2]

// ------------------------------------------------------------------------ //
// Using fast and slow pointer
// Time complexity - O(n)
// Space complexity - O(1)
// ------------------------------------------------------------------------ //
func findDuplicate(_ nums: [Int]) -> Int {
    var slow = 0, fast = 0
    
    while true {
        slow = nums[slow]
        fast = nums[nums[fast]]
        if slow == fast { break }
    }
    
    var slow2 = 0
    while true {
        slow = nums[slow]
        slow2 = nums[slow2]
        if slow == slow2 {
            return slow
        }
    }
    return -1
}

print(findDuplicate(nums))

// ------------------------------------------------------------------------ //
// Negative Marking
// Time complexity - O(n)
// Space complexity - O(1)
// ------------------------------------------------------------------------ //
func findDuplicateUsingNegativeMarking(_ nums: [Int]) -> Int {
    var nums = nums
    for num in nums {
        let index = abs(num) - 1
        if nums[index] < 0 {
            return abs(num)
        }
        nums[index] *= -1
    }
    return -1
}

findDuplicateUsingNegativeMarking(nums)
