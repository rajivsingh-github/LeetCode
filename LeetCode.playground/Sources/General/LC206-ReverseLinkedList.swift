import Foundation

/*
 Reverse a singly linked list.

 Example:

 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:

 A linked list can be reversed either iteratively or recursively. Could you implement both?
*/

class ReverseLinkedList {
    static func reverseLinkedList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        
        var newHead: ListNode? = nil
        var curr = head
        
        while let node = curr {
            curr = node.next
            
            node.next = newHead
            newHead = node
        }
        
        return newHead
    }
}
