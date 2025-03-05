import UIKit

// Car Fleet

/*
 Problem Statement - There are n cars traveling to the same destination on a one-lane highway.
 
 You are given two arrays of integers position and speed, both of length n.

 position[i] is the position of the ith car (in miles)
 speed[i] is the speed of the ith car (in miles per hour)
 The destination is at position target miles.

 A car can not pass another car ahead of it. It can only catch up to another car and then drive at the same speed as the car ahead of it.

 A car fleet is a non-empty set of cars driving at the same position and same speed. A single car is also considered a car fleet.

 If a car catches up to a car fleet the moment the fleet reaches the destination, then the car is considered to be part of the fleet.

 Return the number of different car fleets that will arrive at the destination.
 
 Example 1 - Input: target = 10, position = [1,4], speed = [3,2]
 Output: 1
 
 Example 2 - Input: target = 10, position = [4,1,0,7], speed = [2,2,1,1]
 Output: 3
 */

// Using Stack
/*
 Time complexity - O(nlogn)
 Space Complexity - O(n)
 */

func carFleet(target: Int, position: [Int], speed: [Int]) -> Int {
    let pair = zip(position,speed).sorted{$0.0 > $1.0}
    var stack = [Double]()
    
    for (p,s) in pair {
        let time = Double(target - p) / Double(s)
        stack.append(time)
        
        if stack.count >= 2 && stack[stack.count-1] <= stack[stack.count-2] {
            stack.removeLast()
        }
    }
    return stack.count
}

let positions1 = [1,4]
let speeds1 = [3,2]
let target1 = 10
carFleet(target: target1, position: positions1, speed: speeds1)

let positions2 = [4,1,0,7]
let speeds2 = [2,2,1,1]
let target2 = 10
carFleet(target: target2, position: positions2, speed: speeds2)
