import UIKit

// ----------------------------------------------------------------------------------------------- //
// COPY LIST WITH RANDOM POINTER
// ----------------------------------------------------------------------------------------------- //


// ----------------------------------------------------------------------------------------------- //
/* You are given the head of a linked list of length n. Unlike a singly linked list, each node contains an additional pointer random, which may point to any node in the list, or null.

   Create a deep copy of the list.

   The deep copy should consist of exactly n new nodes, each including:

   The original value val of the copied node
   A next pointer to the new node corresponding to the next pointer of the original node
   A random pointer to the new node corresponding to the random pointer of the original node
   Note: None of the pointers in the new list should point to nodes in the original list.

   Return the head of the copied linked list.*/
// ----------------------------------------------------------------------------------------------- //

// ----------------------------------------------------------------------------------------------- //
// Common Node class for all the solution
// ----------------------------------------------------------------------------------------------- //
public class Node {
    
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

// ----------------------------------------------------------------------------------------------- //
// Space Optimized - 1
// Time COmplexity - O(n)
// Space Complexity - O(n) for output and O(1) extra space
// ----------------------------------------------------------------------------------------------- //

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        if head == nil { return nil }
        
        var l1 = head
        while l1 != nil {
            let l2 = Node(l1!.val)
            l2.next = l1?.next
            l1?.next = l2
            l1 = l2.next
        }
        
        let newHead = head?.next
        l1 = head
        while l1 != nil {
            if let random = l1?.random {
                l1?.next?.random = random.next
            }
            l1 = l1?.next?.next
        }
        
        l1 = head
        while l1 != nil {
            let l2 = l1?.next
            l1?.next = l2?.next
            if l2?.next != nil {
                l2?.next = l2?.next?.next
            }
            l1 = l1? .next
        }
        
        return newHead
    }
}
