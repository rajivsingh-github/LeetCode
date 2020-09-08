import Foundation
/*
 Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

 Example 1:
 Input: [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 
 Example 2:
 Input: [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
*/

// COMPANIES: Facebook - 13, PayPal - 4, Amazon - 3, Apple - 2

struct SortedArraySquares {
    static func squaresOfSortedArray(_ arr: [Int]) -> [Int] {
        var squares = [Int]()
        
        var low = 0
        var high = arr.count - 1
        
        while low <= high {
            if abs(arr[low]) > abs(arr[high]) {
                let square = arr[low] * arr[low]
                squares.append(square)
                
                low += 1
            }else {
                let square = arr[low] * arr[low]
                squares.append(square)
                
                high -= 1
            }
        }
        
        return squares.reversed()
    }
}
