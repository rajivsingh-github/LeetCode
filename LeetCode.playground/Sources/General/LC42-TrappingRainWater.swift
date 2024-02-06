import Foundation

/*
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.
 
 Example 1:
 
 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 
 Example 2:
 
 Input: height = [4,2,0,3,2,5]
 Output: 9

*/

public enum TrappingRainWater {
	public static func trap(_ height: [Int]) -> Int {
		guard height.isEmpty == false else { return 0 }
		
		var waterAccumulated = 0
		
		// Find the tallest elevation.
		var tallestElevation = Int.min
		var tallestIndex = 0
		for (i, elevation) in height.enumerated() {
			if elevation > tallestElevation {
				tallestElevation = elevation
				tallestIndex = i
			}
		}
		
		/*
		Find water accumulated on left of tallest index.
		When we go down - water will be accumulated
		When we go up, check and update the tallest index on the left
		*/
		var tallestIndexOnLeft = 0
		for i in 0..<tallestIndex {
			if height[i] > height[tallestIndexOnLeft] {
				tallestIndexOnLeft = i
				continue
			}
			
			// Going down. Add the water
			let water = height[tallestIndexOnLeft] - height[i]
			waterAccumulated += water
		}
		
		/*
		 Find water accumulated on right side.
		 When we go down - water will be accumulated
		 When we go up - check and update the tallest index on the right.
		*/
		
		var tallestIndexOnRight = height.count - 1
		for i in stride(from: height.count - 1, to: tallestIndex, by: -1) {
			if height[i] > height[tallestIndexOnRight] {
				tallestIndexOnRight = i
				continue
			}
			
			let water = height[tallestIndexOnRight] - height[i]
			waterAccumulated += water
		}
		
		return waterAccumulated
	}
}
