import Foundation

enum KeywordAbility {
    case CanAttackWithDefender
    case CantActivateAbilities
    case CantAttack
    case CantBlock
    case Deathtouch
    case Defender
    case DoubleStrike
    case EntersTapped
    case FirstStrike
    case Flash
    case Flying
    case Haste
    case Hexproof
    case Indestructible
    case Lifelink
    case Reach
    case Trample
    case Unblockable
    case Vigilance
}

extension Object {
    // TODO: keywords should be in list of KeywordAbilities instead of a bunch of boolean attributes
    func setKeyword(_ keyword: KeywordAbility, _ value: Bool) {
        switch keyword {
        case .CanAttackWithDefender: self.canAttackWithDefender = value
            case .CantActivateAbilities: self.cantActivateAbilities = value
            case .CantAttack: self.cantAttack = value
            case .CantBlock: self.cantBlock = value
            case .Deathtouch: self.deathtouch = value
            case .Defender: self.defender = value
            case .DoubleStrike: self.doubleStrike = value
            case .EntersTapped: self.entersTapped = value
            case .FirstStrike: self.firstStrike = value
            case .Flash: self.flash = value
            case .Flying: self.flying = value
            case .Haste: self.haste = value
            case .Hexproof: self.hexproof = value
            case .Indestructible: self.indestructible = value
            case .Lifelink: self.lifelink = value
            case .Reach: self.reach = value
            case .Trample: self.trample = value
            case .Unblockable: self.unblockable = value
            case .Vigilance: self.vigilance = value
        }
    }
    
    func giveKeyword(_ keyword: KeywordAbility) {
        setKeyword(keyword, true)
    }
    
    func removeKeyword(_ keyword: KeywordAbility) {
        setKeyword(keyword, false);
    }
    
    func withKeyword(_ keyword: KeywordAbility) -> Object {
        let object = self.copy() as! Object
        object.giveKeyword(keyword)
        return object
    }
    
    func withoutKeyword(_ keyword: KeywordAbility) -> Object {
        let object = self.copy() as! Object
        object.removeKeyword(keyword)
        return object
    }
}
