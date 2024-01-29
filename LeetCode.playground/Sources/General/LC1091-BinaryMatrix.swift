import Foundation

/*
 Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix. If there is no clear path, return -1.

 A clear path in a binary matrix is a path from the top-left cell (i.e., (0, 0)) to the bottom-right cell (i.e., (n - 1, n - 1)) such that:

 All the visited cells of the path are 0.
 All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).
 The length of a clear path is the number of visited cells of this path.

 Example 1:

 Input: grid = [	[0,1],
 					[1,0]
 				]
 Output: 2
 
 Example 2:


 Input: grid = [[0,0,0],[1,1,0],[1,1,0]]
 Output: 4
 
 Example 3:

 Input: grid = [[1,0,0],[1,1,0],[1,1,0]]
 Output: -1

*/

public enum BinaryMatrix {
	typealias Cell = (x: Int, y: Int, distance: Int)
	
	static let directions: [(x: Int, y: Int)] = [
		(0, 1), (1, 0),
		(0, -1), (-1, 0),
		(1, -1), (-1, 1),
		(-1, -1), (1, 1)
	]
	
	public static func shortestPath(_ matrix: [[Int]]) -> Int {
		let rowCount = matrix.count
		let colCount = matrix[0].count
		
		// Matrix shouldn't be empty.
		guard rowCount > 0, colCount > 0 else {
			return -1
		}
		
		// If start position or end position itself are 1, then we can't proceed.
		guard matrix[0][0] == 0, matrix[rowCount - 1][colCount - 1] == 0 else {
			return -1
		}
		
		// Mark all cells as not visited.
		var visited = Array(repeating: Array(repeating: false, count: colCount)
								, count: rowCount)
		
		var queue = [Cell]()
		
		// Start with first cell, where distance is 1.
		queue.append((x: 0, y: 0, distance: 1))
		visited[0][0] = true
		
		while queue.isEmpty == false {
			let cell = queue.removeFirst()
			
			// If we reached last cell, return the distance travelled.
			if cell.x == rowCount - 1, cell.y == colCount - 1 {
				return cell.distance
			}
			
			// Check all 8 edges and add to the queue if eligible.
			for direction in directions {
				let adjacentX = cell.x + direction.x
				let adjacentY = cell.y + direction.y
				
				// Check if we are still within bounds.
				guard adjacentX >= 0, adjacentX < rowCount,
					  adjacentY >= 0, adjacentY < colCount,
					  matrix[adjacentX][adjacentY] == 0,
					  visited[adjacentX][adjacentY] == false else {
					continue
				}
				
				// This cell should be 0, not visited and therefore
				// good to be added to the queue.
				queue.append((adjacentX, adjacentY, cell.distance + 1))
			}
		}
		
		return -1
	}
}
