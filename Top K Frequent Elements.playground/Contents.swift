import UIKit

// Top K Frequent Elements
/*
 Problem Statement - Given an integer array "nums" and an integer "k", return the "k" most frequent elements within the array.
 Example1- Input: nums = [1,2,2,3,3,3], k = 2
 Output: [2,3]
 Example2: Input: nums = [7,7], k = 1
 Output: [7]
 
 Constraint - 1<=nums.count<=10^4
 -1000<=nums[i]<=1000
 1<=k<=number of distinct element in nums
 */
let input1 = [1,2,2,3,3,3]
let k1 = 2
let input2 = [7,7]
let k2 = 1

// Sorting
/*
 Time Complexity - O(nlogn)
 Space Complexity - O(n)
 */
func topKFrequentUsingSorting(_ nums: [Int], _ k: Int) -> [Int] {
    var count = [Int: Int]()
    
    // Count the frequency of each number
    for num in nums {
        count[num, default: 0] += 1
    }
    
    // Create a list of tuples (frequency, number)
    var array = [(Int, Int)]()
    for (num, freq) in count {
        array.append((freq, num))
    }
    
    // Sort frequency on descending order
    array.sort {$0.0 > $1.0}
    
    // Extract top k frequent elements
    var result = [Int]()
    for i in 0..<k {
        result.append(array[i].1)
    }
    return result
}

topKFrequentUsingSorting(input1, k1)
topKFrequentUsingSorting(input2, k2)

// Heap
/*
 Time Complexity - O(nlogk)
 Space Complexity - O(n+k)
 */
func topKFrequentUsingHeap(_ nums: [Int], _ k: Int) -> [Int] {
    var count = [Int: Int]()
    
    // Count the frequency of each number
    for num in nums {
        count[num, default: 0] += 1
    }
    
    // Create a min heap
    var heap = [(Int, Int)]()
    
    // Custom sorting for minheap
    func heapSort() {
        heap.sort {$0.0 < $1.0}
    }
    
    // Add items to the heap and maintain the size of the heap to be <=k
    for (num,freq) in count {
        heap.append((freq,num))
        heapSort()
        if heap.count > k {
            heap.removeFirst()
        }
    }
    
    // Extract the top k frequent numbers
    var result = [Int]()
    for i in (0..<k).reversed() {
        result.append(heap[i].1)
    }
    return result
}

topKFrequentUsingHeap(input1, k1)
topKFrequentUsingHeap(input2, k2)

// Bucket Sort
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
func topKFrequentUsingBucketSort(_ nums: [Int], _ k: Int) -> [Int] {
    var count = [Int: Int]()
    var freq = [[Int]](repeating: [Int](), count: nums.count+1)
    
    // count the frequency of each number
    for num in nums {
        count[num, default: 0] += 1
    }
    
    // Populate the freq list based on frequency
    for (num, cnt) in count {
        freq[cnt].append(num)
    }
    
    var result = [Int]()
    // Iterate through freq list in reverse to get most frequent first
    for i in stride(from: freq.count-1, through: 1, by: -1) {
        for num in freq[i] {
            result.append(num)
            if result.count == k {
                return result
            }
        }
    }
    return result
}
topKFrequentUsingBucketSort(input1, k1)
topKFrequentUsingBucketSort(input2, k2)
