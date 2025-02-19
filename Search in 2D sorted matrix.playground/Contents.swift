import UIKit

// Search in a sorted 2D matrix

/*
 Problem Statement- You are given an "mxn" 2D integer array "matrix" and an integer "target"
 Each row in "matrix" is sorted in ascending order
 The first integer of every row is greater than last integer of the previous row.
 Return "true" if "target" exists within the "matrix" or "false" otherwise.
 Write a solution that runs in O(log(m*n)) time.
 
 Example1 - Input: matrix: [[1,2,4,8],[10,11,12,13],[14,20,30,40]], target = 10
 Output: true
 
 Example1 - Input: matrix: [[1,2,4,8],[10,11,12,13],[14,20,30,40]], target = 15
 Output: false
 */

let input = [[1,2,4,8],[10,11,12,13],[14,20,30,40]]
let target1 = 10
let target2 = 15

// Brute Force
/*
 Time Complexity - O(m*n)
 Space Complexity - O(1)
 */

func searchMatrixUsingBruteForce(matrix: [[Int]], target: Int) -> Bool {
    guard !matrix.isEmpty, !matrix[0].isEmpty else { return false }
    for row in matrix {
        for value in row {
            if value == target {
                return true
            }
        }
    }
    return false
}

searchMatrixUsingBruteForce(matrix: input, target: target1)
searchMatrixUsingBruteForce(matrix: input, target: target2)

// Staircase Search
/*
 Time Complexity - O(m+n)
 Space Complexity - O(1)
 */
func searchMatrixUsingStaircase(matrix: [[Int]], target: Int) -> Bool {
    guard !matrix.isEmpty, !matrix[0].isEmpty else { return false }
    let rows = matrix.count
    let columns = matrix[0].count
    var i = 0
    var j = columns - 1
    
    while i < rows && j >= 0 {
        if matrix[i][j] > target {
            j -= 1
        } else if matrix[i][j] < target {
            i += 1
        } else {
            return true
        }
    }
    return false
}

searchMatrixUsingStaircase(matrix: input, target: target1)
searchMatrixUsingStaircase(matrix: input, target: target2)

// Binary Search
/*
 Time Complexity - O(log(m+n))
 Space Complexity - O(1)
 */
func searchMatrixUsingBinarySearch(matrix:[[Int]], target: Int) -> Bool {
    guard !matrix.isEmpty, !matrix[0].isEmpty else { return false }
    let rows = matrix.count
    let columns = matrix[0].count
    var topIndex = 0
    var bottomIndex = rows*columns - 1
    
    while topIndex <= bottomIndex {
        let mid = topIndex + (bottomIndex - topIndex) / 2
        let midValue = matrix[mid / columns][mid % columns]
        if midValue == target {
            return true
        } else if midValue < target {
            topIndex = mid + 1
        } else {
            bottomIndex = mid - 1
        }
    }
    return false
}

searchMatrixUsingBinarySearch(matrix: input, target: target1)
searchMatrixUsingBinarySearch(matrix: input, target: target2)
