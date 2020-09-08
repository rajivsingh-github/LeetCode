import Foundation

/*
Calculate tax if Salary and Tax Brackets are given as: calculateTax(double salary, Double[][] brackets)
e.g. Salary = 35000
Brackets = [ [10000, 0.1],[20000, 0.2], [10000, 0.3], [null, .4]]
null being rest of the salary
*/

struct CalculateTax {
    static func calculateTax(_ salary: Double, _ brackets: [[Double]]) -> Double {
        var salary = salary
        
        let sortedBrackets = brackets.sorted {
            $0[0] < $1[0]
        }
        
        var tax = 0.0
        
        for bracket in sortedBrackets {
            let bracketSalary = bracket[0]
            let bracketTax = bracket[1]
            
            if salary >= bracketSalary {
                let currentBracketTax = bracketSalary * bracketTax
                tax += currentBracketTax
                salary -= bracketSalary
                continue
            }
            
            let currentBracketTax = salary * bracketTax
            tax += currentBracketTax
            
            return tax
        }
        
        return tax
    }
}
