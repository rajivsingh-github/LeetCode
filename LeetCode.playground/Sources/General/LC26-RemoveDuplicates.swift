import Foundation

/*
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.
 
 Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:
 
 Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
 Return k.
 
 Example 1:
 
 Input: nums = [1,1,2]
 Output: 2, nums = [1,2,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 
 Example 2:
 
 Input: nums = [0,0,1,1,1,2,2,3,3,4]
 Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
*/

public enum RemoveDuplicates {
	public static func removeDuplicatesFromSortedArray(_ arr: inout [Int]) -> Int {
		guard arr.isEmpty == false else {
			return 0
		}
		
		guard arr.count > 1 else {
			return arr[0]
		}
		
		// We keep an index at the position that needs to be replaced.
		// 2nd element or position 1 is a good place to start.
		var indexToReplace = 1
		for i in 0..<arr.count - 1 {
			
			// If current num and next num are same: no-op
			// This is because we need to find the first non-duplicate num to put at indexToReplace
			if arr[i] == arr[i + 1] {
				continue
			}
			
			// Found non-duplicate element.
			arr[indexToReplace] = arr[i + 1]
			indexToReplace += 1
		}
		
		return indexToReplace
	}
}
