import Foundation

/*
 Given a non-empty array of non-negative integers nums, the degree of this array is defined as the maximum frequency of any one of its elements.
 
 Your task is to find the smallest possible length of a (contiguous) subarray of nums, that has the same degree as nums.
 
 
 
 Example 1:
 
 Input: nums = [1,2,2,3,1]
 Output: 2
 Explanation:
 The input array has a degree of 2 because both elements 1 and 2 appear twice.
 Of the subarrays that have the same degree:
 [1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
 The shortest length is 2. So return 2.
 Example 2:
 
 Input: nums = [1,2,2,3,1,4,2]
 Output: 6
 Explanation:
 The degree is 3 because the element 2 is repeated 3 times.
 So [2,2,3,1,4,2] is the shortest subarray, therefore returning 6.
*/

/*
 COMPANIES: Walmart
 TAGS: Easy
 */

public enum ArrayDegree {
	public static func findShortestSubArray(_ nums: [Int]) -> Int {
		// We traverse the array and keep track of every num's count, it's occurences min index and max index
		typealias ElementDegree = (count: Int, minIndex: Int, maxIndex: Int)
		var elementMap = [Int: ElementDegree]()
		
		for (index, num) in nums.enumerated() {
			if let existingDegree = elementMap[num] {
				// num already exists. Here it's count and max index would change.
				elementMap[num] = (1 + existingDegree.count, existingDegree.minIndex, index)
			} else {
				// num doesn't exists. Here it's count would be 1, min and max index would be i.
				elementMap[num] = (1, index, index)
			}
		}
		
		// Now we have count, min and max index for every num.
		var maxDegree = Int.min
		var shortestSubarrayLength = Int.max
		for (num, degree) in elementMap {
			// If degree is more, then update the degree and shortestSubarrayLength.
			if degree.count > maxDegree {
				maxDegree = degree.count
				shortestSubarrayLength = (degree.maxIndex - degree.minIndex) + 1
				continue
			}
			
			// If degree is same - then the shortest subarray would be the min of -
			// shortestSubarrayLength & current element's (max - min)
			if degree.count == maxDegree {
				let existingElementSubarrayLength = (degree.maxIndex - degree.minIndex) + 1
				shortestSubarrayLength = min(shortestSubarrayLength, existingElementSubarrayLength)
			}
		}
		
		return shortestSubarrayLength
	}
}
