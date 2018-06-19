import Foundation

enum Supertype {
    case Basic
    case Legendary
    case Snow
}

enum Type {
    case Artifact
    case Creature
    case Enchantment
    case Instant
    case Land
    case Planeswalker
    case Sorcery
    case Tribal
}

enum Subtype {
    case Beast
    case Cat
    case Centaur
    case Dinosaur
    case Elemental
    case Elephant
    case Forest
    case Human
    case Island
    case Mountain
    case Ogre
    case Plains
    case Scarecrow
    case Soldier
    case Swamp
    case Warrior
    case Wizard
    case Wolf
    case Zombie
}
//
//enum TypeBase {
//    case supertype(st: Supertype)
//    case type(t: Type)
//    case subtype(st: Subtype)
//    
//    init?(_ theSubtype: Subtype) {
//        self = .subtype(st: theSubtype)
//        return nil
//    }
//}
//
//func foo(a: TypeBase) {
//    print(a)
//}
//
//var x = foo(a: Subtype.Zombie as! TypeBase)
