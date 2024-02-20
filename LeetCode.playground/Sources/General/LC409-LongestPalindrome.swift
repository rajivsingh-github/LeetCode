import Foundation

/*
 Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.
 
 Letters are case sensitive, for example, "Aa" is not considered a palindrome here.
 
 
 
 Example 1:
 
 Input: s = "abccccdd"
 Output: 7
 Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
 Example 2:
 
 Input: s = "a"
 Output: 1
 Explanation: The longest palindrome that can be built is "a", whose length is 1.
*/

/*
 COMPANIES: Walmart
 TAGS: Easy
 */

public enum LongestPalindrome {
	public static func longestPalindrome(_ s: String) -> Int {
		/*
		 Here we don't need to find the longest palindrome that can be built.
		 We just need to find the length of such longest palindrome.
		 In any palindrome:
		 If length is even: then each characters would appear twice
		 If length is odd: then only one character would appear once and all others twice.
		 
		 So we will use a Set. If character is not present, we will add it.
		 If character is already present, we remove it.
		*/
		
		var characterSet = Set<Character>()
		var count = 0
		
		for (i, char) in s.enumerated() {
			if characterSet.contains(char) {
				characterSet.remove(char)
				
				// Every count represents twice the number of character.
				// Because we are incrementing it when we encounter same char twice.
				count += 1
			} else {
				characterSet.insert(char)
			}
		}
		
		// If set is empty, then it means we encountered every character twice.
		// Hence total count would be count * 2
		if characterSet.isEmpty {
			return count * 2
		}
		
		// If set is not empty, then it means we encountered every character twice, except one.
		// Hence total count would be (count * 2) + 1
		return count * 2 + 1
	}
}
