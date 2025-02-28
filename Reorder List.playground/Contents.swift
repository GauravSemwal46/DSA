import UIKit

// Reorder list

/*
 Problem Statement - You are given the head of a singly linked list. The position of a linked list of length =7 for example, can initially be represented as [0,1,2,3,4,5,6]
 Reorder the nodes of the list to be in the following order
 [0,6,1,5,2,4,3]
 */

class Node {
    var data: Int
    var next: Node?
    
    init(data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func printList(head: Node?) {
    var cur = head
    var result = ""
    while let node = cur {
        result += "\(node.data) -> "
        cur = node.next
    }
    print(result.isEmpty ? "List is empty" : result + "nil")
}

func reorderList(head: Node?) {
    if head == nil { return }
    
    var nodes = [Node]()
    var cur: Node? = head
    while let node = cur {
        nodes.append(node)
        cur = node.next
    }
    var i = 0
    var j = nodes.count - 1
    
    while i < j {
        nodes[i].next = nodes[j]
        i += 1
        if i >= j {break}
        nodes[j].next = nodes[i]
        j -= 1
    }
    nodes[i].next = nil
}

func testReorderList() {
    let node1 = Node(data: 0)
    let node2 = Node(data: 1)
    let node3 = Node(data: 2)
    let node4 = Node(data: 3)
    let node5 = Node(data: 4)
    let node6 = Node(data: 5)
    let node7 = Node(data: 6)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = node6
    node6.next = node7
    
    printList(head: node1)
    
    reorderList(head: node1)
    printList(head: node1)
}

testReorderList()
