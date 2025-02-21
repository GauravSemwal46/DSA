import UIKit

// Merge two sorted list
 /*
  Problem Statement - You are given the head of the two sorted linked list "list1" and "list2"
  Merge the two lists into one sorted linked list and return the head of the new sorted linked list.
  The new list should be made up of nodes from "list1" and "list2"
  
  Example 1- Input: list1 = [1,2,4], list2 = [1,3,5]
  Output: [1,1,2,3,4,5]
  
  Example 1- Input: list1 = [, list2 = [1,2]
  Output: [1,2]
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

/*
 Time Complexity - O(n+m)
 Space Complexity - O(1)
 */
func mergeList(list1: Node?, list2: Node?) -> Node? {
    let dummy = Node(data: 0)
    var node: Node? = dummy
    
    var l1 = list1
    var l2 = list2
    
    while let l1Node = l1, let l2Node = l2 {
        if l1Node.data < l2Node.data {
            node?.next = l1
            l1 = l1?.next
        } else {
            node?.next = l2
            l2 = l2?.next
        }
        node = node?.next
    }
    node?.next = l1 ?? l2
    return dummy.next
}

let input1 = createLinkedList(from: [1,2,4])
let input2 = createLinkedList(from: [1,3,5])
let output = mergeList(list1: input1, list2: input2)
printLinkedList(output)

