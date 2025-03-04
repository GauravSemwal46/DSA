import UIKit

// Koko Eating Bananas
/*
 Problem Statement - You are given an integer array piles where piles[i] is the number of bananas in the ith pile. You are also given an integer h, which represents the number of hours you have to eat all the bananas.
 
 You may decide your bananas-per-hour eating rate of k. Each hour, you may choose a pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, you may finish eating the pile but you can not eat from another pile in the same hour.

 Return the minimum integer k such that you can eat all the bananas within h hours.
 
 Example 1 -
 Input: piles = [1,4,3,2], h = 9
 Output: 2
 */

let input1 = [1,4,3,2]
let input2 = [25,10,23,4]
let h1 = 9
let h2 = 4

// Brute Force Approach
/*
    Time Complexity O(m * n)
    Space Complexity - O(1)
*/

func minEatingSpeedBruteForce(piles: [Int], h: Int) -> Int {
    var speed = 1
    while true {
        var totalTime = 0
        for pile in piles {
            totalTime += Int(ceil(Double(pile) / Double(speed)))
        }
        if totalTime <= h {
            return speed
        }
        speed += 1
    }
    return speed
}

minEatingSpeedBruteForce(piles: input1, h: h1)
minEatingSpeedBruteForce(piles: input2, h: h2)


// Binary Search
/*
    Time Complexity O(n∗logm)
    Space Complexity - O(1)
*/
func minEatingSpeedUsingBinarySearch(piles: [Int], h: Int) -> Int {
    var left = 1
    var right = piles.max()!
    var result = right
    
    while left <= right {
        let k = (left + right) / 2
        var totalTime = 0
        for pile in piles {
            totalTime += Int(ceil(Double(pile) / Double(k)))
        }
        
        if totalTime <= h {
            result = k
            right = k - 1
        } else {
            left = k + 1
        }
    }
    return result
}

minEatingSpeedUsingBinarySearch(piles: input1, h: h1)
minEatingSpeedUsingBinarySearch(piles: input2, h: h2)
