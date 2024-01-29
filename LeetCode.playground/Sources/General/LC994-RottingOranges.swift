import Foundation

/*
 You are given an m x n grid where each cell can have one of three values:

 0 representing an empty cell,
 1 representing a fresh orange, or
 2 representing a rotten orange.
 Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.

 Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.
 
 Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
 Output: 4
 
 Example 2:

 Input: grid = [[2,1,1],
 				[0,1,1],
 				[1,0,1]]
 Output: -1
 Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
 
 Example 3:

 Input: grid = [[0,2]]
 Output: 0
 Explanation: Since there are already no fresh oranges at minute 0, the answer is just 0.
 */

public struct RottingOranges {
	typealias Coordinate = (x: Int, y: Int)
	
	public static func findRottingOranges(_ matrix: inout [[Int]]) -> Int {
		// Keep count of number of fresh oranges.
		var freshOrangeCount = 0
		
		// Keep count of number of rotten oranges.
		var queue = [Coordinate]()
		
		for row in 0..<matrix.count {
			for col in 0..<matrix[row].count {
				if matrix[row][col] == 1 {
					freshOrangeCount += 1
				} else if matrix[row][col] == 2 {
					queue.append((x: row, y: col))
				}
			}
		}
		
		guard freshOrangeCount > 0 else { return 0 }
		
		let directions: [Coordinate] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
		
		var minutes = 0
		
		while queue.isEmpty == false {
			let queueSize = queue.count
			
			minutes += 1
			
			// Go through all the rotten oranges in the queue,
			// and make adjancent oranges rotten too.
			for _ in 0..<queueSize {
				let rottenOrange = queue.removeFirst()
				
				for direction in directions {
					let adjacentX = rottenOrange.x + direction.x
					let adjacentY = rottenOrange.y + direction.y
					
					// Make sure adjacent coordinate is within bounds.
					guard adjacentX >= 0, adjacentX < matrix.count,
						  adjacentY >= 0, adjacentY < matrix[0].count,
						  matrix[adjacentX][adjacentY] == 1 else {
							  continue
						  }
					
					// Rot the adjacent orange as it's fresh and within bounds.
					matrix[adjacentX][adjacentY] = 2
					
					freshOrangeCount -= 1
					
					queue.append((adjacentX, adjacentY))
				}
			}
		}
		
		if freshOrangeCount == 0 {
			return minutes - 1
		}
		
		return -1
	}
}
