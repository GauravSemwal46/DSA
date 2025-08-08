import UIKit

// Given an array nums, return the length of longest consecutive sequence of element that can be formed
// input = [2,20,4,10,3,4,5]
// ouput = 4 => [2,3,4,5]

let input = [2,20,4,10,3,4,5]
// Brute force
// Time -> O(n^2) Space -> O(n)
func longestConsecutiveBruteForce(_ nums: [Int]) -> Int {
    var result = 0
    let store = Set(nums)
    
    for num in nums {
        var streak = 0
        var curr = num
        
        while store.contains(curr) {
            streak += 1
            curr += 1
            print("Num = \(num), Streak = \(streak), Curr = \(curr), Result = \(result)")
        }
        result = max(result, streak)
    }
    
    return result
}

//longestConsecutiveBruteForce(input)

// 2. Using Sorting
// Time -> O(nlogn) Space -> O(1)
func longestConsecutiveUsingSorting(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    
    var result = 0
    var nums = nums.sorted()
    var curr = nums[0]
    var streak = 0
    var i = 0
    
    while i < nums.count {
        if curr != nums[i] {
            curr = nums[i]
            streak = 0
        }
        while i < nums.count && nums[i] == curr {
            i += 1
        }
        streak += 1
        curr += 1
        result = max(result, streak)
        print("Curr = \(curr), Streak = \(streak), Result = \(result), i = \(i)")
    }
    return result
}
//longestConsecutiveUsingSorting(input)

// 3. Using HashSet
// Time -> O(n)  Space -> O(n)
func longestConsecutiveUsingHashSet(_ nums: [Int]) -> Int {
    var numSet = Set(nums)
    var longest = 0
    
    for num in numSet {
        if !numSet.contains(num-1) {
            var length = 1
            while numSet.contains(num + length) {
                length += 1
                print("Length = \(length), Num = \(num), longest = \(longest)")
            }
            longest = max(length,longest)
        }
    }
    return longest
}

//longestConsecutiveUsingHashSet(input)

// 4. Using HashMap
// Time -> O(n) Space -> O(n)
func longestConsecutiveUsingHashMap(_ nums: [Int]) -> Int {
    var dict = [Int: Int]()
    var result = 0
    
    for num in nums {
        if dict[num] == nil {
            let left = dict[num-1] ?? 0
            let right = dict[num+1] ?? 0
            let length = left + right + 1
            
            dict[num] = length
            dict[num-left] = length
            dict[num+left] = length
            
            result = max(result, length)
            
            print("Num = \(num), left = \(left), right = \(right), length= \(length), Result = \(result), Dict[\(num)] = \(dict[num]!), Dict[\(num-left)] = \(dict[num-left]!), Dict[\(num+right)] = \(dict[num+right]!)")
        }
    }
    return result
}
longestConsecutiveUsingHashMap(input)
