import Foundation

/*
 There is a bookstore owner that has a store open for n minutes. Every minute, some number of customers enter the store. You are given an integer array customers of length n where customers[i] is the number of the customer that enters the store at the start of the ith minute and all those customers leave after the end of that minute.
 
 On some minutes, the bookstore owner is grumpy. You are given a binary array grumpy where grumpy[i] is 1 if the bookstore owner is grumpy during the ith minute, and is 0 otherwise.
 
 When the bookstore owner is grumpy, the customers of that minute are not satisfied, otherwise, they are satisfied.
 
 The bookstore owner knows a secret technique to keep themselves not grumpy for minutes consecutive minutes, but can only use it once.
 
 Return the maximum number of customers that can be satisfied throughout the day.
 
 
 
 Example 1:
 
 Input: customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], minutes = 3
 Output: 16
 Explanation: The bookstore owner keeps themselves not grumpy for the last 3 minutes.
 The maximum number of customers that can be satisfied = 1 + 1 + 1 + 1 + 7 + 5 = 16.
 Example 2:
 
 Input: customers = [1], grumpy = [0], minutes = 1
 Output: 1
*/

public enum GrumpyBookstoreOwner {
	public static func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ minutes: Int) -> Int {
		/*
			In the above example - all customers would be satisfied when grumpy is 0.
			So, at least 1 + 1 + 1 + 7 = 10 customers would be satisfied for sure.
			Now, we also have X continous minutes when customers could be kept satisfied.
			We need to use sliding window approach to find the window of X minutes when
			additional customers can be kept satisfied.
			In the above example, if that window of 3 minutes is kept at [1, 7, 5] then
			we will get additional customers that would be satisfied.
			
			In short - additional satisfied customers = max unsatisfied customers in the window length.
		*/
		
		// Find all the customers who are satisfied regardless.
		// These are all customers when grumpy is 0.
		var satisfiedCustomers = 0
		for (i, customer) in customers.enumerated() {
			if grumpy[i] == 0 {
				satisfiedCustomers += customer
			}
		}
		
		// Start finding max unsatisfied customers in the window length.
		var maxUnsatisfiedCustomers = 0
		var unsatisfiedCustomers = 0
		var windowStart = 0
		for (i, customer) in customers.enumerated() {
			if grumpy[i] == 1 {
				unsatisfiedCustomers += customer
			}
			
			// We wait until we reach the window length.
			if i - windowStart + 1 == minutes {
				// Once we find the window, we update our maxUnsatisfiedCustomers
				maxUnsatisfiedCustomers = max(maxUnsatisfiedCustomers, unsatisfiedCustomers)
				
				// As we keep moving the window to the right -
				// We also need to remove the unsatisfied customers that were added previously on the left.
				if grumpy[windowStart] == 1 {
					unsatisfiedCustomers -= customers[windowStart]
				}
				
				// Move the window to the right
				windowStart += 1
			}
		}
		
		// Finally, result would be satisfiedCustomers + maxUnsatisfiedCustomers
		return satisfiedCustomers + maxUnsatisfiedCustomers
	}
}
