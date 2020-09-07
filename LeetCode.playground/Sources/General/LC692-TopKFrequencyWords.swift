import Foundation

/*
 Given a non-empty list of words, return the k most frequent elements.

 Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.

 Example 1:

 Input: ["i", "love", "leetcode", "i", "love", "coding"], k = 2
 Output: ["i", "love"]
 Explanation: "i" and "love" are the two most frequent words.
     Note that "i" comes before "love" due to a lower alphabetical order.
 
 Example 2:
 Input: ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], k = 4
 Output: ["the", "is", "sunny", "day"]
 Explanation: "the", "is", "sunny" and "day" are the four most frequent words,
     with the number of occurrence being 4, 3, 2 and 1 respectively.
 
 Note:
 You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 Input words contain only lowercase letters.
 Follow up:

 Try to solve it in O(n log k) time and O(n) extra space.
*/

// COMPANIES: AMAZON - 111, Facebook - 6, Google - 4, Microsoft - 2

class Solution {
    static func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var wordCountMap = [String: Int]()
        
        for word in words {
            if let existingCount = wordCountMap[word] {
                wordCountMap[word] = existingCount + 1
            }else {
                wordCountMap[word] = 1
            }
        }
        
        var wordFrequency = Array.init(repeating: [String](), count: words.count + 1)
        for (word, count) in wordCountMap {
            let sameFrequencyWords = wordFrequency[count] + [word]
            wordFrequency[count] = sameFrequencyWords.sorted()
        }
        
        var result = [String]()
        for (_, words) in wordFrequency.reversed().enumerated() {
            guard words.isEmpty == false else { continue }
            
            for word in words {
                result += [word]
                
                if result.count >= k { return result }
            }
        }
        
        return result
    }
}
