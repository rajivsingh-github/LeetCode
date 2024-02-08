import Foundation

/*
 Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.
 
 Note that after backspacing an empty text, the text will continue empty.
 
 
 
 Example 1:
 
 Input: s = "ab#c", t = "ad#c"
 Output: true
 Explanation: Both s and t become "ac".
 Example 2:
 
 Input: s = "ab##", t = "c#d#"
 Output: true
 Explanation: Both s and t become "".
 Example 3:
 
 Input: s = "a#c", t = "b"
 Output: false
 Explanation: s becomes "c" while t becomes "b".
*/

public enum BackSpaceStringCompare {
	public static func compare(_ s1: String, _ s2: String) -> Bool {
		// We make use of stacks. If character isn't #, we push.
		// Once we encounter #, we will pop.
		var stack1 = [Character]()
		for (i, char) in s1.enumerated() {
			switch char {
			case "#":
				guard stack1.isEmpty == false else {
					continue
				}
				stack1.removeLast()
			default:
				stack1.append(char)
			}
		}
		
		var stack2 = [Character]()
		for (i, char) in s2.enumerated() {
			switch char {
			case "#":
				guard stack2.isEmpty == false else {
					continue
				}
				stack2.removeLast()
			default:
				stack2.append(char)
			}
		}
		
		return stack1 == stack2
	}
}
