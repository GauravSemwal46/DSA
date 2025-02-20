import UIKit

// Reverse Linked List

/*
 Problem Statement - Given the beginning of a singly linked list "head", reverse the list, and return the new beginning of the list.
 
 Example 1 - Input: head = [0,1,2,3]
 Output: [3,2,1,0]
 
 Example 2 - Input: head = []
 Output: []
 */

class Node {
    var data: Int
    var next: Node?
    
    init(data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
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

// Recursion
/*
 Time Complexity - O(n)
 Space Complexity - O(n)
 */
func reverseList(head: Node?) -> Node? {
    if head == nil {
        return nil
    }
    
    var newHead = head
    if head?.next != nil {
        newHead = reverseList(head: head?.next)
        head?.next?.next = head
    }
    head?.next = nil
    return newHead
}

let input1 = createLinkedList(from: [0,1,2,3])
let input2 = createLinkedList(from: [])
let outputUsingRecursion = reverseList(head: input1)
printLinkedList(outputUsingRecursion)
let outputHeadUsingRecursion = reverseList(head: input2)
printLinkedList(outputHeadUsingRecursion)

// Iteration
/*
 Time Complexity - O(n)
 Space Complexity - O(1)
 */

func reverseListUsingIteration(head: Node?) -> Node? {
    var prev: Node? = nil
    var curr = head
    
    while curr != nil {
        let temp = curr?.next
        curr?.next = prev
        prev = curr
        curr = temp
    }
    return prev
}
let input3 = createLinkedList(from: [0,1,2,3])
let input4 = createLinkedList(from: [])
let outputUsingIteration = reverseListUsingIteration(head: input3)
printLinkedList(outputUsingIteration)
let outputHeadUsingIteration = reverseListUsingIteration(head: input4)
printLinkedList(outputHeadUsingIteration)
