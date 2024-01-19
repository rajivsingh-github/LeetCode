import Foundation

struct TreeDFS {
	static func inorderTraversal(_ node: TreeNode?) {
		guard let root = node else { return }
		
		if let left = root.left {
			inorderTraversal(left)
		}
		
		print("\(root.val)")
		
		if let right = root.right {
			inorderTraversal(right)
		}
	}
	
	static func preorderTraversal(_ node: TreeNode?) {
		guard let root = node else { return }
		
		print("\(root.val)")
		
		if let left = root.left {
			inorderTraversal(left)
		}
		
		if let right = root.right {
			inorderTraversal(right)
		}
	}
	
	static func postorderTraversal(_ node: TreeNode?) {
		guard let root = node else { return }
		
		if let left = root.left {
			inorderTraversal(left)
		}
		
		if let right = root.right {
			inorderTraversal(right)
		}
		
		print("\(root.val)")
	}
}
