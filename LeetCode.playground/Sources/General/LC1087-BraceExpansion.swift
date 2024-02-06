import Foundation

/*
 A string S represents a list of words.
 
 Each letter in the word has 1 or more options.  If there is one option, the letter is represented as is.  If there is more than one option, then curly braces delimit the options.  For example, "{a,b,c}" represents options ["a", "b", "c"].
 
 For example, "{a,b,c}d{e,f}" represents the list ["ade", "adf", "bde", "bdf", "cde", "cdf"].
 
 Return all words that can be formed in this manner, in lexicographical order.
 
 Example 1:
 Input: "{a,b}c{d,e}f"
 Output: ["acdf","acef","bcdf","bcef"]
 
 Example 2:
 Input: "abcd"
 Output: ["abcd"]
 
 Note:
 1 <= S.length <= 50
 There are no nested curly brackets.
 All characters inside a pair of consecutive opening and ending curly brackets are different.
*/

public enum BraceExpansion {
	public static func braceExmapnsion(_ s: String) -> [String] {
		guard s.isEmpty == false else { return [] }
		
		var ans = [String]()
		
		backTrack(s, 0, "", &ans)
		
		return ans
	}
	
	/*
	s: Original input string
	index: current index
	curr: currently accumulated expansion
	*/
	private static func backTrack(_ s: String,
								  _ index: Int,
								  _ curr: String,
								  _ ans: inout [String]) {
		// When index goes out of bounds, we stop
		if index == s.count {
			ans.append(curr)
			return
		}
		
		// Get the current character to process
		let currentIndex = s.index(s.startIndex, offsetBy: index)
		let currentCharacter = s[currentIndex]
		
		if currentCharacter != "{" {
			/*
			 Current character isn't opening brace.
			 Accumulate the current character & continue backtracking
			*/
			backTrack(s, index + 1, curr + String(currentCharacter), &ans)
		} else {
			/*
			 Current character is an opening brace.
			 Get to the next closing brace so that we can get options.
			 */
			var closingBracePosition = -1
			for i in index..<s.count {
				let charIndex = s.index(s.startIndex, offsetBy: i)
				if s[charIndex] == "}" {
					closingBracePosition = i
					break
				}
			}
			
			// Backtrack all the options.
			let closingBraceIndex = s.index(s.startIndex, offsetBy: closingBracePosition)
			let optionStartIndex = s.index(after: currentIndex)
			let options = s[optionStartIndex..<closingBraceIndex]
			let optionComponents = options.components(separatedBy: ",")
			for option in optionComponents {
				backTrack(s, closingBracePosition + 1, curr + String(option), &ans)
			}
		}
	}
}
