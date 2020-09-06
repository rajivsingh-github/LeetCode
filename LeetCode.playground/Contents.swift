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
