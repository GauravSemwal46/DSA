import UIKit

// Two sum II Input array is sorted

/*
 Problem Statement - Given an array of integers "numbers" that is sorted in non-descreasing order.
 Return the indices(1-indexed) of two numbers, [index1,index2], such that they add up to a given target number "target" and index1<index2. Note that index1 and index2 cannot be eal, therefore you may not use the same element twice.
 There will always be exactly one valid solution.
 
 Example1- Input: numbers = [1,2,3,4], target = 3
 Output: [1,2]
 */

let input = [1,2,3,4]
let target = 3

// Brute Force
/*
 Time Complexity - O(n^2)
 Space Complexity - O(1)
 */
func twoSumIIUsingBruteForce(numbers: [Int], target: Int) -> [Int] {
    for i in numbers.indices {
        for j in i+1 ..< numbers.count {
            if numbers[i] + numbers[j] == target {
                return [i+1,j+1]
            }
        }
    }
    return []
}

twoSumIIUsingBruteForce(numbers: input, target: 3)

// Dictionary
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
func twoSumIIUsingDictionary(numbers: [Int], target: Int) -> [Int] {
    var map = [Int: Int]()
    for i in numbers.indices {
        let diff = target - numbers[i]
        if let j = map[diff] {
            return [j+1, i+1]
        }
        map[numbers[i], default: 0] = i
    }
    return[]
}

twoSumIIUsingDictionary(numbers: input, target: target)

// Using Two Pointers
/*
 Time Complexity - O(n)
 Space Complexity - O(1)
 */
func twoSumIIUsingTwoPointers(numbers: [Int], target: Int) -> [Int] {
    var leftIndex = 0
    var rightIndex = numbers.count - 1
    
    while leftIndex < rightIndex {
        let curSum = numbers[leftIndex] + numbers[rightIndex]
        if curSum == target {
            return [leftIndex+1, rightIndex+1]
        } else if curSum < target {
            leftIndex += 1
        } else {
            rightIndex -= 1
        }
    }
    return []
}

twoSumIIUsingTwoPointers(numbers: input, target: target)
