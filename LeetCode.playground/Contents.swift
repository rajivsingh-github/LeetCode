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
