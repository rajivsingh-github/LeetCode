import Foundation

/*
 Given a matrix of N*M order. Find the shortest distance from a source cell to a destination cell, traversing through limited cells only. Also you can move only up, down, left and right. If found output the distance else -1.
 s represents ‘source’
 d represents ‘destination’
 * represents cell you can travel
 0 represents cell you can not travel
 This problem is meant for single source and destination.
 Examples:
  

 Input : {'0', '*', '0', 's'},
		 {'*', '0', '*', '*'},
		 {'0', '*', '*', '*'},
		 {'d', '*', '*', '*'}
 Output : 6

 Input :  {'0', '*', '0', 's'},
		  {'*', '0', '*', '*'},
		  {'0', '*', '*', '*'},
		  {'d', '0', '0', '0'}
 Output :  -1
 
 Explanation: https://www.geeksforgeeks.org/shortest-distance-two-cells-matrix-grid/
 
 This is similar to LC-1091: BinaryMatrix
*/

enum MatrixBFS {
	typealias Coordinate = (x: Int, y: Int, distance: Int)
	
	static let directions: [(x: Int, y: Int)] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
	
	static func traverse(_ matrix: [[Character]]) -> Int {
		
		var visited = Array(repeating:Array(repeating: false, count: matrix[0].count), count: matrix.count)
		
		var queue = [Coordinate]()
		
		// Find the source cell 's'
		for row in 0..<matrix.count {
			for col in 0..<matrix[row].count {
				
				if matrix[row][col] == "s" {
					queue.append((x: row, y: col, distance: 0))
					visited[row][col] = true
				}
				
				if matrix[row][col] == "0" {
					visited[row][col] = true
				}
			}
		}
		
		while queue.isEmpty == false {
			let cell = queue.removeFirst()
			
			if matrix[cell.x][cell.y] == "d" {
				return cell.distance
			}
			
			for direction in directions {
				let adjacentX = cell.x + direction.x
				let adjacentY = cell.y + direction.y
				
				guard adjacentX >= 0, adjacentX < matrix.count,
					  adjacentY >= 0, adjacentY < matrix[0].count,
					  visited[adjacentX][adjacentY] == false else {
					continue
				}
				
				queue.append((adjacentX, adjacentY, cell.distance + 1))
			}
		}
		
		return -1
	}
}
