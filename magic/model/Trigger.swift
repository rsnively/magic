import Foundation

enum Trigger {
    case APlayerCastsInstantOrSorcery
    case CreatureEntersBattlefieldUnderYourControl
    case CreatureWithFlyingAttacks
    case DragonEntersBattlefieldUnderYourControl
    case EachEndStep
    case EachUpkeep
    case Landfall
    case NontokenCreatureYouControlDies
    case ThisAttacks
    case ThisBecomesTapped
    case ThisBlocks
    case ThisDealsCombatDamageToPlayer
    case ThisDealtDamage
    case ThisDies
    case ThisETB
    case ThisGetsLoreCounter
    case ThisGetsPlusOnePlusOneCounter
    case ThisLTB
    case YouCastBlueSpell
    case YouCastCreatureSpell
    case YouCastEnchantmentSpell
    case YouCastHistoricSpell
    case YouCastInstantOrSorcery
    case YouCastMerfolkSpell
    case YouCastMulticoloredSpell
    case YouCastNoncreatureSpell
    case YouCastRedSpell
    case YouDrawCard
    case YouGainLife
    case YouSacrificeTreasure
    case YourBeginCombat
    case YourFirstMain
    case YourEndStep
    case YourUpkeep
}
