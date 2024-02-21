import UIKit

// LC-135
let insertPosition = SearchInsertPosition.searchInsert([1,3,5,6], 5)
print("Insert Position is: \(insertPosition)")

// RPG Game
let warriorBehavior = WarriorBehavior()
let warrior = Warrior(mana: 50, power: 50, behavior: warriorBehavior)
warriorBehavior.character = warrior

let wizardBehavior = WizardBehavior()
let wizard = Wizard(mana: 80, power: 80, behavior: wizardBehavior)
wizardBehavior.character = wizard

let highWizardBehavior = HighWizardBehavior()
let highWizard = HighWizard(mana: 100, power: 100, behavior: highWizardBehavior)
highWizardBehavior.character = highWizard

warrior.attack()
warrior.skill()

wizard.attack()
wizard.skill()

highWizard.attack()
highWizard.skill()

let warriorWizardBehavior = WizardBehavior()
warriorWizardBehavior.character = warrior
warrior.behavior = warriorWizardBehavior

warrior.attack()

// MyNotificationCenter
let identifier1 = MyNotificationCenter.default.addObserver(forName: NSNotification.Name("TestNotification"), object: nil) { notificaton in
    print("First Notification")
}

let identifier2 = MyNotificationCenter.default.addObserver(forName: NSNotification.Name("TestNotification"), object: nil) { notificaton in
    print("Second Notification")
}

MyNotificationCenter.default.post(name: NSNotification.Name("TestNotification"), object: nil)

MyNotificationCenter.default.removeObserver(identifier1, name: NSNotification.Name("TestNotification"), object: nil)

MyNotificationCenter.default.post(name: NSNotification.Name("TestNotification"), object: nil)

MyNotificationCenter.default.removeObserver(identifier2, name: NSNotification.Name("TestNotification"), object: nil)

MyNotificationCenter.default.post(name: NSNotification.Name("TestNotification"), object: nil)

// Reverse LinkedList
let head = LinkedListHelper.makeLinkedList(with: [1, 2, 3, 4, 5])
let reversedHead = ReverseLinkedList.reverse(head)

// Rottin Oranges
var orangeMatrix = [[2,1,1],[1,1,0],[0,1,1]]
let rottinOrangesMinutes = RottingOranges.findRottingOranges(&orangeMatrix)

// Binary Matrix
let binaryMatrix = [[1,0,0],[1,1,0],[1,1,0]]
let binaryMatrixDistance = BinaryMatrix.shortestPath(binaryMatrix)

// Remove duplicates
var lc26RemoveDuplicates = [1, 2, 3, 4, 5]
let index = RemoveDuplicates.removeDuplicatesFromSortedArray(&lc26RemoveDuplicates)

// Trapping rain water
let lc42_elevations = [0,1,0,2,1,0,1,3,2,1,2,1]
let trappedWater = TrappingRainWater.trap(lc42_elevations)

// Brace expansion
let lc1087_braceString = "{a,b,c}d{e,f}"
let braceExpanded = BraceExpansion.braceExmapnsion(lc1087_braceString)

// Zombie Infection
var lc994_zombieAndHumans = [[0, 1, 1, 0, 1],
							 [0, 1, 0, 1, 0],
							 [0, 0, 0, 0, 1],
							 [0, 1, 0, 0, 0]]
let zombieInfectionTime = ZombieInfection.infectHumans(&lc994_zombieAndHumans)

// Compare backspace string
let lc844_s1 = "ab##"
let lc844_s2 = "c#d#"
let lc844_compare = BackSpaceStringCompare.compare(lc844_s1, lc844_s2)

// Perfect Number
let lc507_isPerfectNumber = PerfectNumber.checkPerfectNumber(7)

// Two Sum
let lc01_twoSum = TwoSum.twoSumExists([3, 2, 4], 0)

// Max earning from taxi
let lc2008_rides = [[1,6,1],[3,10,2],[10,12,3],[11,12,2],[12,15,2],[13,18,1]]
let maxTaxiEarning = MaxTaxiEarning.maxEarningFromTaxi(rides: lc2008_rides, n: 20)


// Degree of an array
let lc697_nums = [1,2,2,3,1,4,2]
let lc697_shortestSubarrayLength = ArrayDegree.findShortestSubArray(lc697_nums)

// Grumpy Bookstore Owner
let lc1052_customers = [1,0,1,2,1,1,7,5]
let lc1052_grumpy = [0,1,0,1,0,1,0,1]
let lc1052_minutesWindow = 3
let lc1052_maxSatisfied = GrumpyBookstoreOwner.maxSatisfied(lc1052_customers, lc1052_grumpy, lc1052_minutesWindow)
