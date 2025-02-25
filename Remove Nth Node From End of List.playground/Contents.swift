import UIKit

// Remove Nth node from the end of list

/*
 Problem Statement - You are given the beginning of a linked list "head", and an integer "n".
 Remove the "nth" node from the end of the list and return the beginning of the list.
 
 Example1 - Input: head = [1,2,3,4], n = 2
 Output: [1,2,4]
 
 Example1 - Input: head = [1,2], n = 2
 Output: [2]
 */

class Node {
    var data: Int
    var next: Node?
    init(data: Int) {
        self.data = data
        self.next = nil
    }
}

func createLinkedList(from array: [Int]) -> Node? {
    guard !array.isEmpty else { return nil }
    
    let head = Node(data: array[0])
    var current = head
    for value in array.dropFirst() {
        let newNode = Node(data: value)
        current.next = newNode
        current = newNode
    }
    return head
}

func printLinkedList(_ head: Node?) {
    var current = head
    while let node = current {
        print(node.data, terminator: " -> ")
        current = node.next
    }
    print("nil")
}

// Brute Force
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
func removeNthFromEndUsingBruteForce(_ head: Node?, _ n: Int) -> Node? {
    var nodes = [Node?]()
    var cur = head
    
    while let node = cur {
        nodes.append(node)
        cur = node.next
    }
    
    let removeIndex  = (nodes.count - n % nodes.count) % nodes.count
    
    if removeIndex == 0 {
        return head?.next
    }
    
    nodes[removeIndex-1]?.next = nodes[removeIndex]?.next
    return head
}

let input1 = createLinkedList(from: [1,2,3,4])
let n = 2
let output1 = removeNthFromEndUsingBruteForce(input1, n)
printLinkedList(output1)

let input2 = createLinkedList(from: [1,2])
let output2 = removeNthFromEndUsingBruteForce(input2, n)
printLinkedList(output2)

// Using Iteration
/*
 Time Complexity - O(n)
 Space Complexity - O(1)
 */
func removeNthFromEndUsingIteration(_ head: Node?, _ n: Int) -> Node? {
    var length = 0
    var cur = head
    
    while let node = cur {
        length += 1
        cur = node.next
    }
    
    let removeIndex  = (length - n % length) % length
    
    if removeIndex == 0 {
        return head?.next
    }
    
    cur = head
    for i in 0..<length {
        if i+1 == removeIndex {
            cur?.next = cur?.next?.next
            break
        }
        cur = cur?.next
    }
    return head
}

let input3 = createLinkedList(from: [1,2,3,4])
let outputUsingIteration1 = removeNthFromEndUsingIteration(input3, n)
printLinkedList(outputUsingIteration1)
let input4 = createLinkedList(from: [1,2])
let outputUsingIteration2 = removeNthFromEndUsingIteration(input4, n)
printLinkedList(outputUsingIteration2)


