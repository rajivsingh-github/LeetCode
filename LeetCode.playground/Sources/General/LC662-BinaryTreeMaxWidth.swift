import Foundation

/*
 Given the root of a binary tree, return the maximum width of the given tree.

 The maximum width of a tree is the maximum width among all levels.

 The width of one level is defined as the length between the end-nodes (the leftmost and rightmost non-null nodes), where the null nodes between the end-nodes that would be present in a complete binary tree extending down to that level are also counted into the length calculation.

 It is guaranteed that the answer will in the range of a 32-bit signed integer.

  

 Example 1:


 Input: root = [1,3,2,5,3,null,9]
 Output: 4
 Explanation: The maximum width exists in the third level with length 4 (5,3,null,9).
 Example 2:


 Input: root = [1,3,2,5,null,null,9,6,null,7]
 Output: 7
 Explanation: The maximum width exists in the fourth level with length 7 (6,null,null,null,null,null,7).
 Example 3:


 Input: root = [1,3,2,5]
 Output: 2
 Explanation: The maximum width exists in the second level with length 2 (3,2).
  

 Constraints:

 The number of nodes in the tree is in the range [1, 3000].
 -100 <= Node.val <= 100
*/

/*
	COMPANIES: Snapchat
	TAGS: Medium
*/

struct BinaryTreeMaxWidth {
	
	typealias TreeNodeElement = (node: TreeNode, index: Int)
	
	static func maxWidth(_ node: TreeNode?) -> Int {
		guard let root = node else { return 0 }
		
		var maxWidth = 1
		
		var queue = [TreeNodeElement]()
		queue.append((root, 1))
		
		while queue.isEmpty == false {
			var size = queue.count
			
			var extremeLeftNode: TreeNodeElement?
			var extremeRightNode: TreeNodeElement?
			
			// Here were go through each node on same level
			for i in 1...size {
				let (node, index) = queue.removeFirst()
				
				// This is the left most node in current level.
				if i == 1 {
					extremeLeftNode = (node, index)
				}
				
				// This is the right most node in current level.
				if i == size {
					extremeRightNode = (node, index)
				}
				
				// Start queuing the next level nodes
				if let left = node.left {
					let leftIndex = index * 2
					queue.append((left, leftIndex))
				}
				
				if let right = node.right {
					let rightIndex = index * 2 + 1
					queue.append((right, rightIndex))
				}
			}
			
			if let extremeRightNode, let extremeLeftNode {
				let currentLevelWidth = (extremeRightNode.index - extremeLeftNode.index) + 1
				maxWidth = max(maxWidth, currentLevelWidth)
			}
		}
		
		return maxWidth
	}
}
