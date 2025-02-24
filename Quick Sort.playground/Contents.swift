import UIKit

// Quick Sort

func quickSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let pivot = array[array.count - 1]
    
    var left: [Int] = []
    var right: [Int] = []
    var middle: [Int] = []
    
    for element in array {
        if element > pivot {
            right.append(element)
        } else if element < pivot {
            left.append(element)
        } else {
            middle.append(element)
        }
    }
    
    return quickSort(left) + middle + quickSort(right)
}

let input = [1,3,5,7,9,2,4,6,8]
let ouput = quickSort(input)
print(ouput)
