import Foundation

let CreatureYouControlAttacksAlone_Creature = "Creature";
let LandPutIntoGraveyardFromPlay_Land = "Land";

enum Trigger {
    case APlayerCastsInstantOrSorcery
    case AnotherCreatureEntersBattlefieldUnderYourControl
    case AnotherCreatureYouControlDies
    case AnotherCreatureOrPlaneswalkerYouControlDies
    case CreatureEntersBattlefieldUnderYourControl
    case CreatureOpponentControlsBecomesTappedBesidesAttacking
    case CreatureWithFlyingAttacks
    case CreatureYouControlAttacksAlone
    case DragonEntersBattlefieldUnderYourControl
    case EachEndStep
    case EachOpponentsUpkeep
    case EachUpkeep
    case GateEntersBattlefieldUnderYourControl
    case KnightEntersBattlefieldUnderYourControl
    case Landfall
    case LandPutIntoAGraveyardFromPlay
    case NontokenCreatureYouControlDies
    case OpponentDrawsCard
    case ThisAttacks
    case ThisBecomesBlocked
    case ThisBecomesTapped
    case ThisBlocks
    case ThisDealsCombatDamageToPlayer
    case ThisDealtDamage
    case ThisDies
    case ThisETB
    case ThisExiledFromBattlefield
    case ThisGetsLoreCounter
    case ThisGetsPlusOnePlusOneCounter
    case ThisGetsTwelfthHourCounter
    case ThisLTB
    case YouCastBlueSpell
    case YouCastCreatureSpell
    case YouCastEnchantmentSpell
    case YouCastHistoricSpell
    case YouCastInstantOrSorcery
    case YouCastInstantSpell
    case YouCastKnightSpell
    case YouCastLegendarySpell
    case YouCastMerfolkSpell
    case YouCastMulticoloredSpell
    case YouCastNoncreatureSpell
    case YouCastRedSpell
    case YouCastYourSecondSpellEachTurn
    case YouDrawCard
    case YouDrawSecondCard
    case YouGainLife
    case YouSacrificeTreasure
    case YourBeginCombat
    case YourFirstMain
    case YourEndStep
    case YourUpkeep
}
