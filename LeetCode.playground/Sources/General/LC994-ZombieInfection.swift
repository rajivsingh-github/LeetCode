import Foundation

/*
 Given a 2D grid, each cell is either a zombie 1 or a human 0. Zombies can turn adjacent (up/down/left/right) human beings into zombies every hour. Find out how many hours does it take to infect all humans?
*/

public enum ZombieInfection {
	public static func infectHumans(_ matrix: inout [[Int]]) -> Int {
		guard matrix.isEmpty == false else { return 0 }
		
		guard matrix[0].isEmpty == false else { return 0 }
		
		let rowCount = matrix.count
		let colCount = matrix[0].count
		
		// 1. Count how many humans are there.
		var humans = 0
		
		// 2. Keep zombies in a queue for BFS
		typealias Coordinate = (x: Int, y: Int)
		var queue = [Coordinate]()
		
		for row in 0..<rowCount {
			for col in 0..<matrix[row].count {
				if matrix[row][col] == 0 {
					humans += 1
					continue
				}
				
				if matrix[row][col] == 1 {
					queue.append((row, col))
				}
			}
		}
		
		// If there are no humans, we bail out.
		guard humans > 0 else { return 0 }
		
		// Prepare the adjacent directions where Zombies can go.
		let directions: [Coordinate] = [(0, 1), (1, 0), (0, -1), (-1, 0)]
		
		var elapsedTime = 0
		while queue.isEmpty == false, humans > 0 {
			// Go through all the zombies at time t = elapsedTime.
			// All zombie at this time will start infecting.
			let queueSize = queue.count
			
			for _ in 0..<queueSize {
				let zombie = queue.removeFirst()
				
				for direction in directions {
					let adjacentX = direction.x + zombie.x
					let adjacentY = direction.y + zombie.y
					
					// Check if new coordinate is within bounds.
					guard adjacentX >= 0, adjacentX < rowCount,
						  adjacentY >= 0, adjacentY < colCount,
						  matrix[adjacentX][adjacentY] == 0 else {
						continue
					}
					
					// Infect the human.
					matrix[adjacentX][adjacentY] = 1
					
					// Since human became a zombie, add it to the queue
					queue.append((adjacentX, adjacentY))
					
					// Update human count
					humans -= 1
				}
			}
			
			// Current set of zombies did their task in all directions. So update the time.
			elapsedTime += 1
		}
		
		return elapsedTime
	}
}
