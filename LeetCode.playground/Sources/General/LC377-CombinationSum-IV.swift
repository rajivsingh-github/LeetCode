import Foundation

/*
 Given an array of distinct integers nums and a target integer target, return the number of possible combinations that add up to target.
 
 The test cases are generated so that the answer can fit in a 32-bit integer.
 
 
 
 Example 1:
 
 Input: nums = [1,2,3], target = 4
 Output: 7
 Explanation:
 The possible combination ways are:
 (1, 1, 1, 1)
 (1, 1, 2)
 (1, 2, 1)
 (1, 3)
 (2, 1, 1)
 (2, 2)
 (3, 1)
 Note that different sequences are counted as different combinations.
 Example 2:
 
 Input: nums = [9], target = 3
 Output: 0
 */

class CombinationSum {
	var result = [[Int]]()
	
	func computeSum(_ nums: [Int], _ target: Int) -> [[Int]] {
		var currentComb = [Int]()
		var currentSum = 0
		
		helper(nums, target, 0, &currentSum, &currentComb)
		
		return result
	}
	
	private func helper(_ nums: [Int],
						_ target: Int,
						_ currentIndex: Int,
						_ currSum: inout Int,
						_ currentComb: inout [Int]
	) {
		
		// if our target becomes zero at any point, then yess!! we wil find a possible combination
		if (currSum == target) {
			result.append(currentComb) // include that combination in our answer
			return // and then return, we are now not gonna explore more possiblity
		}
		
		//
		if currSum > target {
			return
		}
		
		if currentIndex >= nums.count {
			return
		}
		
		// There are two possibilities. Either we select current num or we don't.
		// Let's start with not selecting the current num.
		// So our target & currSum remains the same and we advance to next element.
		helper(nums, target, currentIndex + 1, &currSum, &currentComb)
		
		// Now other option is to consider the current element.
		// So we add it to current combination
		currentComb.append(nums[currentIndex])
		
		// We need to update currentSum accordingly.
		currSum += nums[currentIndex]
		
		// Repeat the process. We don't advance to next element as we keep trying with current one.
		helper(nums, target, currentIndex, &currSum, &currentComb)
		
		// Backtrack
		currentComb.removeLast()
	}
}
