import UIKit

// Linked List Cycle

/*
 Problem Statement- Given the beginning of a linked list "head", return "true" if there is a cycle in the linked list. Otherwise return "false".
 There is a cycle in a linked list if at least one node in the list can be visited again by following the "next" pointer.
 Internally "index" determines the index of beginning of cycle, if it exists. The tail node of the list will set its "next" pointer to "index-th" node. If "index = -1" then the tail node point to null and no cycle exist.
 */

class Node {
    var data: Int
    var next: Node?
    
    init(data: Int) {
        self.data = data
        self.next = nil
    }
}

// Using slow and fast pointer
/*
 Time Complexity - O(n)
 Space Complexity - O(1)
 */

func hasCycle(head: Node?) -> Bool {
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow === fast {
            return true
        }
    }
    return false
}

let node1 = Node(data: 1)
let node2 = Node(data: 2)
let node3 = Node(data: 3)
let node4 = Node(data: 4)
let node5 = Node(data: 5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node2

let result = hasCycle(head: node1)
print(result)
