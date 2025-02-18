import UIKit

// Min Stack

/*
 Problem Statement- Design a stack class that supports the push, pop, top and getMin operations
 MinStack() initializes the stack object
 func push(val: Int) pushes the element val onto the stack
 func pop() removes the element on the top of the stack
 func top() -> Int get the top element of the stack
 func getMin() -> Int retrieve the minimum element in the stack
 */

/*
 TimeComplexity - O(1)
 Space Complexity - O(n)
 */

class MinStack {
    private var stack: [Int] = []
    private var minStack: [Int] = []
    
    init(){}
    
    func push(val: Int) {
        stack.append(val)
        if minStack.isEmpty || val <= minStack.last! {
            minStack.append(val)
        }
    }
    
    func pop() {
        guard let topValue = stack.popLast() else {
            return
        }
        if topValue == minStack.last {
            minStack.popLast()
        }
    }
    
    func top() -> Int? {
        return stack.last
    }
    
    func getMin() -> Int? {
        return minStack.last
    }
}

var minStack = MinStack()
minStack.push(val: 1)
minStack.push(val: 2)
minStack.push(val: 0)
minStack.getMin()
minStack.pop()
minStack.top()
minStack.getMin()
