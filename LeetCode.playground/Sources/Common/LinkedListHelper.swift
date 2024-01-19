import Foundation

public enum LinkedListHelper {
	public static func makeLinkedList(with arr: [Int]) -> LinkedListNode? {
		guard arr.isEmpty == false else { return nil }
		
		let head = LinkedListNode(0)
		var curr = head
		
		for item in arr {
			let node = LinkedListNode(item)
			curr.next = node
			curr = node
		}
		
		return head.next
	}
	
	public static func showLinkedList(_ node: LinkedListNode?) {
		var curr = node
		while let node = curr {
			print("\(node.val)-->")
			curr = node.next
		}
	}
}
