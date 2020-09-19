import Foundation

// COMPANIES: PayPal

class ColorPairs {
    static func findColorPairs(arr: [Int]) -> Int {
        var result = 0
        
        // 1. Keep count of each number in a dictionary.
        var elementCountMap = [Int: Int]()
        
        for (_, num) in arr.enumerated() {
            if let existingCount = elementCountMap[num] {
                elementCountMap[num] = 1 + existingCount
            }else {
                elementCountMap[num] = 1
            }
        }
        
        for (_, count) in elementCountMap {
            result += count / 2
        }
        
        return result
    }
}
