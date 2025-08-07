import UIKit

// Valid Suduko

// Brute force approach
// Time Complexity = O(n^2)
// Space Complexity = O(n^2)

func isValidSudukoUsingBruteForce(_ board: [[Character]]) -> Bool {
    
    for row in 0..<9 {
        var seen = Set<Character>()
        for i in 0..<9 {
            if board[row][i] == "." { continue }
            if seen.contains(board[row][i]) { return false }
            seen.insert(board[row][i])
        }
    }
    
    for col in 0..<9 {
        var seen = Set<Character>()
        for i in 0..<9 {
            if board[i][col] == "." { continue }
            if seen.contains(board[i][col]) { return false }
            seen.insert(board[i][col])
        }
    }
    
    for square in 0..<9 {
        var seen = Set<Character>()
        for i in 0..<3 {
            for j in 0..<3 {
                let row = (square / 3) * 3 + i
                let col = (square / 3) * 3 + j
                if board[row][col] == "." { continue }
                if seen.contains(board[row][col]) { return false }
                seen.insert(board[row][col])
            }
        }
    }
    
    return true
}

// Bit Mask
// Time Complexity - O(n^2)
// Space Complexity - O(n)
func isValidSudukoUsingBitmask(_ board: [[Character]]) -> Bool {
    
    var rows = [Int](repeating: 0, count: 9)
    var cols = [Int](repeating: 0, count: 9)
    var squares = [Int](repeating: 0, count: 9)
    
    for r in 0..<9 {
        for c in 0..<9 {
            if board[r][c] == "." { continue }
            
            let val = Int(board[r][c].asciiValue! - Character("0").asciiValue!)
            let bitmask = 1 << (val - 1)
            
            if (rows[r] & bitmask) != 0 { return false }
            if (cols[c] & bitmask) != 0 { return false }
            if (squares[(r/3)*3 + (c/3)] & bitmask) != 0 { return false }
            
            rows[r] |= bitmask
            rows[r] |= bitmask
            squares[(r/3)*3 + (c/3)] |= bitmask
        }
    }
    
    return true
}
