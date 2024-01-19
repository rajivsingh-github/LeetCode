import Foundation

public class RandomLinkedListNode {
	let val: Int
	var next: RandomLinkedListNode?
	var random: RandomLinkedListNode?
	
	public init(val: Int) {
		self.val = val
		self.next = nil
		self.random = nil
	}
}

extension RandomLinkedListNode: Hashable {
	public static func == (lhs: RandomLinkedListNode, rhs: RandomLinkedListNode) -> Bool {
		return (lhs.val == rhs.val &&
		lhs.next === rhs.next &&
		lhs.random === rhs.random)
	}
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(self)
	}
}
