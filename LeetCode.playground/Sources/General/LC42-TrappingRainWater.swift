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

public struct TrappingRainWater {
	func trap(_ height: [Int]) -> Int {
		
		guard height.count > 0 else { return 0 }
		
		var water = 0
		
		var maxHeight = Int.min
		var maxHeightIndex = -1
		
		// Find the index with maximum height.
		for (i, h) in height.enumerated() {
			if h > maxHeight {
				maxHeight = h
				maxHeightIndex = i
			}
		}
		
		/*
		 Now, iterate all heights on left of max height.
		 When we go down - we accumulate water.
		 When we go up, we check and update left height
		*/
		var maxHeightOnLeft = 0
		for i in 0..<maxHeightIndex {
			if height[i] > maxHeightOnLeft {
				maxHeightOnLeft = height[i]
			}else {
				water = water + (maxHeightOnLeft - height[i])
			}
		}
		
		/*
		 Now, iterate all heights on right of max height.
		 When we go down - we accumulate water.
		 When we go up, we check and update right height
		*/
		var maxHeightOnRight = 0
		for i in stride(from: height.count - 1, to: maxHeightIndex, by: -1) {
			if height[i] > maxHeightOnRight {
				maxHeightOnRight = height[i]
			}else {
				water = water + (maxHeightOnRight - height[i])
			}
		}
		
		return water
	}
}
