import UIKit

// Merge Sort

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let midIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<midIndex]))
    let rightArray = mergeSort(Array(array[midIndex...]))
    
    return merge(left: leftArray, right: rightArray)
}

func merge(left: [Int], right: [Int]) -> [Int] {
    var mergedArray = [Int]()
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            mergedArray.append(left[leftIndex])
            leftIndex += 1
        } else {
            mergedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    
    mergedArray += Array(left[leftIndex...])
    mergedArray += Array(right[rightIndex...])
    return mergedArray
}

let input = [1,3,5,7,9,2,4,6,8]
let output = mergeSort(input)
print(output)
