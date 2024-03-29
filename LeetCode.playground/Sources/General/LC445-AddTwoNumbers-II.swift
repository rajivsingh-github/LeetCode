import Foundation

/*
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Follow up:
 What if you cannot modify the input lists? In other words, reversing the lists is not allowed.

 Example:

 Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 8 -> 0 -> 7
*/

// COMPANIES: Amazon - 8, Microsoft - 6, Uber - 3, eBay - 2, Apple - 2

class AddTwoNumbers {
    static func addTwoNumbers(_ l1: LinkedListNode?, _ l2: LinkedListNode?) -> LinkedListNode? {
        var stack1 = [Int]()
        
        var curr = l1
        while let node = curr {
            stack1.append(node.val)
            curr = node.next
        }
        
        curr = l2
        
        var stack2 = [Int]()
        while let node = curr {
            stack2.append(node.val)
            curr = node.next
        }
        
        curr = nil
        
        var sum = 0
        while stack1.isEmpty == false || stack2.isEmpty == false || sum > 0 {
            
            if stack1.isEmpty == false {
                let lastElement = stack1.removeLast()
                sum += lastElement
            }
            
            if stack2.isEmpty == false {
                let lastElement = stack2.removeLast()
                sum += lastElement
            }
            
            let digit = sum % 10
            sum = sum / 10
            
            let newNode = LinkedListNode(digit)
            newNode.next = curr
            
            curr = newNode
        }
        
        return curr
    }
}
