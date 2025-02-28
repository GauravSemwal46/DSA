import UIKit

// Longest Consecutive Sequence

/*
 Given an array of integers nums, return the length of the longest consecutive sequence of element that can be formed
 Example 1- Input: nums: [2,20,4,10,3,4,5]
 Output: 4
 */

let input = [2,20,4,10,3,4,5]

// Brute Force
/*
 Time Complexity - O(n^2)
 Space Complexity - O(n)
 */

func longestCOnsecutiveBruteForce(nums: [Int]) -> Int {
    var result = 0
    var set = Set(nums)
    
    for num in nums {
        var streak = 0
        var curr = num
        while set.contains(curr) {
            streak += 1
            curr += 1
        }
        result = max(result, streak)
    }
    return result
}

longestCOnsecutiveBruteForce(nums: input)

// Using Sorting
/*
 Time Complexity - O(nlogn)
 Space Complexity - O(1)
 */
func longestConsecutiveUsingSorting(nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var sortedArray = nums.sorted()
    
    var result = 0
    var curr = sortedArray[0]
    var streak = 0
    var i = 0
    while i < sortedArray.count {
        if curr != sortedArray[i] {
            curr = sortedArray[i]
            streak = 0
        }
        while i < sortedArray.count && sortedArray[i] == curr {
            i += 1
        }
        streak += 1
        curr += 1
        result = max(result, streak)
    }
    return result
}

longestConsecutiveUsingSorting(nums: input)

// Using Dictionary
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
func longestConsecutiveUsingDictionary(nums: [Int]) -> Int {
    var dict = [Int: Int]()
    var result = 0
    
    for num in nums {
        if dict[num] == nil {
            let left = dict[num-1] ?? 0
            let right = dict[num+1] ?? 0
            let sum = left + right + 1
            dict[num] = sum
            dict[num - left] = sum
            dict[num + right] = sum
            result = max(result,sum)
        }
    }
    return result
}

longestConsecutiveUsingDictionary(nums: input)
