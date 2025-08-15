import UIKit

// ----------------------------------------------------------------------------------- //
// ADD TWO NUMBER IN A LIST
// ----------------------------------------------------------------------------------- //

// ----------------------------------------------------------------------------------- //
/*
 You are given two non-empty linked lists, l1 and l2, where each represents a non-negative integer.

 The digits are stored in reverse order, e.g. the number 123 is represented as 3 -> 2 -> 1 -> in the linked list.

 Each of the nodes contains a single digit. You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Return the sum of the two numbers as a linked list.
 */
// ----------------------------------------------------------------------------------- //


// ----------------------------------------------------------------------------------- //
// Node Class for Solution
// ----------------------------------------------------------------------------------- //
public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}


// ----------------------------------------------------------------------------------- //
// Recursion
// Time COmplexity - O(m+n)
// Space Complexity - O(m+n)
// ----------------------------------------------------------------------------------- //
class Solution {
    private func add(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int) -> ListNode? {
        if l1 == nil && l2 == nil && carry == 0 { return nil }
        
        let v1 = l1?.val ?? 0
        let v2 = l2?.val ?? 0
        
        let sum = v1 + v2 + carry
        let newCarry = sum / 10
        let val = sum % 10
        
        let nextNode = add(l1?.next, l2?.next, newCarry)
        return ListNode(val, nextNode)
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return add(l1, l2, 0)
    }
}

let l1 = ListNode(9)
let l2 = ListNode(9)
let obj = Solution()
var result = obj.addTwoNumbers(l1, l2)
while result != nil {
    print("\(result!.val) -> ", terminator: "")
    result = result?.next
}
print("nil")
