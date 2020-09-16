
import Foundation

/*
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

 The replacement must be in-place and use only constant extra memory.

 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.

 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
*/

class NextPermutation {
    static func getNextPermutation(_ arr: inout [Int]) {
        // 1. Find the largest index k such that nums[k] < nums[k + 1]. If no such index exists, just reverse nums and done.
        var k = -1
        
        while k >= 0 {
            if arr[k] < arr[k + 1] {
                break
            }
            
            k -= 1
        }
        
        guard k >= 0 else {
            arr.reverse()
            return
        }
        
        // 2. Find the largest index l > k such that nums[k] < nums[l].
        var l = arr.count - 2
        while l > k {
            if arr[k] < arr[l] {
                break
            }
            
            l -= 1
        }
        
        // 3. Swap nums[k] and nums[l]
        arr.swapAt(k, l)
        
        // 4. Reverse the array from begin + k + 1 to the end of array
    }
}
