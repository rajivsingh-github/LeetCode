import Foundation

/*
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.

 Example 1:
 Input: [3,2,3]
 Output: 3
 
 Example 2:
 Input: [2,2,1,1,1,2,2]
 Output: 2
*/

// COMPANIES: Amazon - 5, Microsoft - 4, Google - 3, Apple - 2, Adobe - 2

public struct MajorityElement {
    public static func majorityElement(_ nums: [Int]) -> Int {
        guard nums.isEmpty == false else { return Int.min }
        
        var majorityElementCount = 1
        var majorityElement = nums[0]
        
        for i in 1..<nums.count {
            if majorityElementCount == 0 {
                majorityElementCount = 1
                majorityElement = nums[i]
            }else if nums[i] == majorityElement {
                majorityElementCount += 1
            }else {
                majorityElementCount -= 1
            }
        }
        
        return majorityElement
    }
}
