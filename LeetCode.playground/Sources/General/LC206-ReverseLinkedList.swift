import Foundation

/*
 Reverse a singly linked list.

 Example:

 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:

 A linked list can be reversed either iteratively or recursively. Could you implement both?
*/

public struct ReverseLinkedList {
	public static func reverse(_ head: LinkedListNode?) -> LinkedListNode? {
		if head == nil { return nil }
		
		var newHead: LinkedListNode? = nil
		
		// Start traversing the list
		var curr = head
		while let node = curr {
			curr = node.next
			node.next = newHead
			newHead = node
		}
		
		return newHead
	}
}
