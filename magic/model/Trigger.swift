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
    case CreatureYouControlDies
    case DragonEntersBattlefieldUnderYourControl
    case EachEndStep
    case EachOpponentsUpkeep
    case EachUpkeep
    case EnchantmentEntersBattlefieldUnderYourControl
    case GateEntersBattlefieldUnderYourControl
    case KnightEntersBattlefieldUnderYourControl
    case Landfall
    case LandPutIntoAGraveyardFromPlay
    case NontokenCreatureYouControlDies
    case OpponentDrawsCard
    case ThisAttacks
    case ThisBecomesBlocked
    case ThisBecomesTapped
    case ThisBecomesTargetOfSpellOrAbility
    case ThisBlocks
    case ThisDealsDamageToOpponent
    case ThisDealsCombatDamageToPlayer
    case ThisDealtDamage
    case ThisDies
    case ThisETB
    case ThisExiledFromBattlefield
    case ThisGetsLoreCounter
    case ThisGetsPlusOnePlusOneCounter
    case ThisGetsTwelfthHourCounter
    case ThisLTB
    case WhiteCreatureYouControlAttacks
    case YouCastBlueSpell
    case YouCastCreatureSpell
    case YouCastEnchantmentSpell
    case YouCastFirstSpellEachOpponentsTurn
    case YouCastHistoricSpell
    case YouCastInstantOrSorcery
    case YouCastInstantSpell
    case YouCastKnightSpell
    case YouCastLegendarySpell
    case YouCastMerfolkSpell
    case YouCastMulticoloredSpell
    case YouCastNoncreatureSpell
    case YouCastRedSpell
    case YouCastSpell
    case YouCastSpellCMCFiveOrGreater
    case YouCastSpellDuringOpponentsTurn
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
