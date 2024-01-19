import Foundation

struct TreeBFS {
	static func levelOrderTraversal(of node: TreeNode?) -> [Int]? {
		guard let root = node else { return nil }
		
		var items = [Int]()
		
		var queue = [TreeNode]()
		queue.append(root)
		
		while queue.isEmpty == false {
			let node = queue.removeFirst()
			
			items.append(node.val)
			
			if let left = node.left {
				queue.append(left)
			}
			
			if let right = node.right {
				queue.append(right)
			}
		}
		
		return items
	}
}
