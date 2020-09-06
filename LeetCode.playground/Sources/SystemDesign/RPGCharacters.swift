import Foundation

/*
You have to create character classes for an RPG game. The classes we need to begin with are:
  - Warrior
  - Wizard
  - HighWizard

All classes will have:
  - health
  - mana
  - power

All classes can perform:
  - attack
  - performSkill

The behavior for each function is defined as follows:

  Warrior
    - attack: Will cause damage using its [power] value
    - skill: Will cause damage using 2 times its power value

  Wizard
    - attack: Will cause damage using its [power] value
    - skill: Swaps its health and his mana values

  HighWizard
    - attack: Will cause damage using its [mana] value
    - skill: Swaps its health and his mana values

Considerations:
  - To simplify the program, attack functions will just print the damage inflicted in the format:
  [Class type] hits with: [hitAmount]

  - Skill functions will either do the action of swapping the health and mana or print any damage inflicted
  
Constraints:
  - Any character should at a given point be able to perform any other character's skill
    e.g. The Warrior could temporally transform into a Wizard and should be able to perform the Wizard's skill
    - BONUS: Every function should contain only one line of code (except initializers)
    - BONUS: Class initializers can take 0 or more parameters


The main program expects to perform the following actions:

  1- Instantiate a Warrior, Wizard and High Wizard with or without params
  2- Make Warrior attack
  3- Make Warrior perform its skill
  4- Make Wizard attack
  5- Make Wizard perform its skill
  6- Make High Wizard attack
  7- Make High Wizard perform its skill
  8- Make the Warrior perform the skill of a Wizard

*/

// COMPANIES: Audible/Amazon

public protocol RPGCharacterEquippable: AnyObject {
    var health: Int { get set }
    var mana: Int { get set }
    var power: Int { get set }
}

public protocol RPGCharacterBehavior {
    func attack()
    func skill()
}

public class WarriorBehavior: RPGCharacterBehavior {
    public unowned var character: RPGCharacterEquippable!
    
    public init() {}
    
    public func attack() {
        print("Warrior hits with: \(character.power)")
    }
    
    public func skill() {
        print("Warrior hits with: \(character.power * 2)")
    }
}

public class WizardBehavior: RPGCharacterBehavior {
    public unowned var character: RPGCharacterEquippable!
    
    public init() {}
    
    public func attack() {
        print("Wizard hits with: \(character.power)")
    }
    
    public func skill() {
        swap(&character.health, &character.mana)
    }
}

public class HighWizardBehavior: RPGCharacterBehavior {
    public unowned var character: RPGCharacterEquippable!
    
    public init() {}
    
    public func attack() {
        print("High Wizard hits with: \(character.mana)")
    }
    
    public func skill() {
        swap(&character.health, &character.mana)
    }
}

public class Warrior: RPGCharacterEquippable, RPGCharacterBehavior {
    public var health: Int = 100
    public var mana: Int
    public var power: Int
    
    public var behavior: RPGCharacterBehavior
    
    public init(mana: Int, power: Int, behavior: RPGCharacterBehavior) {
        self.mana = mana
        self.power = power
        self.behavior = behavior
    }
    
    public func attack() {
        behavior.attack()
    }
    
    public func skill() {
        behavior.skill()
    }
}

public class Wizard: RPGCharacterEquippable, RPGCharacterBehavior {
    public var health: Int = 100
    public var mana: Int
    public var power: Int
    
    public var behavior: RPGCharacterBehavior
    
    public init(mana: Int, power: Int, behavior: RPGCharacterBehavior) {
        self.mana = mana
        self.power = power
        self.behavior = behavior
    }
    
    public func attack() {
        behavior.attack()
    }
    
    public func skill() {
        behavior.skill()
    }
}

public class HighWizard: RPGCharacterEquippable, RPGCharacterBehavior {
    public var health: Int = 100
    public var mana: Int
    public var power: Int
    
    public var behavior: RPGCharacterBehavior
    
    public init(mana: Int, power: Int, behavior: RPGCharacterBehavior) {
        self.mana = mana
        self.power = power
        self.behavior = behavior
    }
    
    public func attack() {
        behavior.attack()
    }
    
    public func skill() {
        behavior.skill()
    }
}
