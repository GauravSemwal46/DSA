import UIKit

// Three Sum Problem

/*
 Given an integer array "nums", return all the triplets [num[i], nums[j], nums[k]] where nums[i]+nums[j]+nums[k] == 0 and the indices 1,j, and k are all distinct.
 The output should not contain any duplicate triplets. You may return the output and triplet in any order.
 Example1 - Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 */

let input = [-1,0,1,2,-1,-4]

// Brute Force
/*
 Time Complexity - O(n^3)
 Space Complexity - O(m)
 */

func threeSumUsingBruteForce(_ nums: [Int]) -> [[Int]] {
    var result = Set<[Int]>()
    let sortedNums = nums.sorted()
    
    for i in 0..<sortedNums.count {
        for j in i+1..<sortedNums.count {
            for k in j+1..<sortedNums.count {
                if sortedNums[i] + sortedNums[j] + sortedNums[k] == 0 {
                    result.insert([sortedNums[i], sortedNums[j], sortedNums[k]])
                }
            }
        }
    }
    return Array(result)
}

print(threeSumUsingBruteForce(input))

// Using Two Pointer
/*
 Time Complexity - O(n^2)
 Space Complexity - O(1) or O(n) depending on the sorting algorithm
 */

func threeSumUsingTwoPointer(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var nums = nums.sorted()
    
    for i in 0..<nums.count {
        let a = nums[i]
        if a > 0 { break }
        if i > 0 && a == nums[i-1] { continue }
        
        var left = i+1
        var right = nums.count - 1
        while left < right {
            let threeSum = a + nums[left] + nums[right]
            if threeSum > 0 {
                right -= 1
            } else if threeSum < 0 {
                left += 1
            } else {
                result.append([a,nums[left],nums[right]])
                left += 1
                right -= 1
                while left < right && nums[left] == nums[left-1] {
                    left += 1
                }
            }
        }
    }
    return result
}
print(threeSumUsingTwoPointer(input))
