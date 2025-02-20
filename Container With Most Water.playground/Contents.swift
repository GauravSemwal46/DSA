import UIKit

// Container with most water

/*
 Problem Statement - You are given an array "heights" where "heights[i]" represents the height of ith bar.
 You may choose any two bars to form a container. Return the maximum amount of water a container can store.
 
 Example1 - Input: [1,7,2,5,4,7,3,6]
 Output: 36
 
 Example2 - Input: [2,2,2]
 Output: 4
 */

let input1 = [1,7,2,5,4,7,3,6]
let input2 = [2,2,2]

// Brute Force
/*
 Time Complexity - O(n^2)
 Space Complexity - O(1)
 */

func maxAreaBruteForce(heights: [Int]) -> Int {
    var result = 0
    for i in heights.indices {
        for j in i+1 ..< heights.count {
            let height = min(heights[i], heights[j])
            let width = j - i
            let area = height * width
            result = max(result,area)
        }
    }
    return result
}

maxAreaBruteForce(heights: input1)
maxAreaBruteForce(heights: input2)


// Two Pointer
/*
 Time Complexity - O(n)
 Space Complexity - O(1)
 */

func maxAreaUsingTwoPointer(heights: [Int]) -> Int {
    var result = 0
    var leftIndex = 0
    var rightIndex = heights.count - 1
    
    while leftIndex < rightIndex {
        let height = min(heights[leftIndex], heights[rightIndex])
        let width = rightIndex - leftIndex
        let area = height * width
        result = max(result, area)
        if heights[leftIndex] < heights[rightIndex] {
            leftIndex += 1
        } else {
            rightIndex -= 1
        }
    }
    return result
}

maxAreaUsingTwoPointer(heights: input1)
maxAreaUsingTwoPointer(heights: input2)
