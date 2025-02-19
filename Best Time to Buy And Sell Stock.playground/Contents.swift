import UIKit

// Best Time to Buy and Sell stock

/*
 You are given an integer array "prices" where "prices[i]" is the price of neetcoin on the ith day.
 You may choose a single day to buy one neetcoin and choose a different day in the future to sell it.
 Return the maximum profit you can achieve. You may choose to not make any transaction in which case the profit would be 0.
 
 Example 1 - Input: prices = [10,1,5,6,7,1]
 Output: 6
 
 Example 2 - Input: prices = [10,8,7,5,2]
 Output: 0
 */
let input1 = [10,1,5,6,7,1]
let input2 = [10,8,7,5,2]

// Brute Force
/*
 Time Complexity - O(n^2)
 Space Complexity - O(1)
 */
func maxProfitUsingBruteForce(prices: [Int]) -> Int {
    var result = 0
    for i in prices.indices {
        let buy = prices[i]
        for j in (i+1)..<prices.count {
            let sell = prices[j]
            result = max(result, sell-buy)
        }
    }
    return result
}

maxProfitUsingBruteForce(prices: input1)
maxProfitUsingBruteForce(prices: input2)

// Using Two Pointer
/*
 Time Complexity - O(n)
 Space Complexity - O(1)
 */

func maxProfitUsingTwoPointer(prices: [Int]) -> Int {
    var left = 0
    var right = 1
    var maxProfit = 0
    
    while right < prices.count {
        if prices[left] < prices[right] {
            let profit = prices[right] - prices[left]
            maxProfit = max(maxProfit, profit)
        } else {
            left = right
        }
        right += 1
    }
    return maxProfit
}

maxProfitUsingTwoPointer(prices: input1)
maxProfitUsingTwoPointer(prices: input2)

// Using Dynamic Programming
/*
 Time Complexity - O(n)
 Space Complexity - O(1)
 */

func maxProfitUsingDP(prices: [Int]) -> Int {
    var maxProfit = 0
    var minBuy = Int.max
    
    for sell in prices {
        maxProfit = max(maxProfit, sell-minBuy)
        minBuy = min(minBuy, sell)
    }
    return maxProfit
}

maxProfitUsingDP(prices: input1)
maxProfitUsingDP(prices: input2)
