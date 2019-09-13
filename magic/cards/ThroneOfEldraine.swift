import Foundation

enum ELD {
    static var set = "eld"
    static var count = 269
    
    static let cards = [
        
        AllThatGliters,
        
        BelovedPrincess,
//        CharmingPrince,
        TheCircleOfLoyalty,
        
//        FaerieGodmother,
        
//        Giant Killer,
        
        HarmoniousArchon,
        
        Righteousness,
        
        ShiningArmor,
//        SilverflameRitual,
        
        TrappedInTheTower,
        TrueLovesKiss,
        VenerableKnight,
        WorthyKnight,
        
//        AnimatingFaerie,
        
        CorridorMonitor,
        
//        EmryLurkerOfTheLoch,
        
        FaerieVandal,
        
//        Frogify,
//        Gadwick, the Wizened,
//        HypnoticSprite,
        IntoTheStory,
        
        MidnightClock,
        
//        MysticalDispute,
//        Opt,
        
//        RunAwayTogether,
        
//        StolenByTheFae,
//        SyrElenoraTheDiscerning,
        TomeRaider,
//        TurnIntoAPumpkin,
        
//        WishfulMerfolk,
//        WitchingWell,
//        AyaraFirstOfLochthwain,
        BakeIntoAPie,
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    // 1
    static func AllThatGliters() -> Card {
        let allThatGlitters = Card(name: "All That Glitters", rarity: .Uncommon, set: set, number: 2)
        allThatGlitters.setManaCost("1W")
        allThatGlitters.setType(.Enchantment, .Aura)
        allThatGlitters.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                let numArtifactsEnchantments = allThatGlitters.getController().getArtifactsAndEnchantments().count
                return object.pumped(numArtifactsEnchantments, numArtifactsEnchantments)
            },
            layer: .PowerToughnessChanging)
        allThatGlitters.setFlavorText("A faerie's glee at her trove quickly fades to contentment, then to boredom, then to an urge to steal more.")
        return allThatGlitters
    }
    // 2
    // 3
    // 4
    // 5
    // 6
    static func BelovedPrincess() -> Card {
        let belovedPrincess = Card(name: "Beloved Princess", rarity: .Common, set: set, number: 7)
        belovedPrincess.setManaCost("W")
        belovedPrincess.setType(.Creature, .Human, .Noble)
        belovedPrincess.lifelink = true
        belovedPrincess.blockabilityRequirements.append({ object in
            return object.getPower() < 3
        })
        belovedPrincess.setFlavorText("Sometimes a gentle slipper can travel where an armored boot's been denied.")
        belovedPrincess.power = 1
        belovedPrincess.toughness = 1
        return belovedPrincess
    }
    // 8 Charming Prince
    static func TheCircleOfLoyalty() -> Card {
        let theCircleOfLoyalty = Card(name: "The Circle of Loyalty", rarity: .Mythic, set: set, number: 9)
        theCircleOfLoyalty.setManaCost("4WW")
        theCircleOfLoyalty.setType(.Legendary, .Artifact)
        theCircleOfLoyalty.addStaticAbility(
            requirement: AbilityRequirement.This(theCircleOfLoyalty),
            effect: { object in
                // TODO: Make sure casting circle of loyalty w/ another on the battlefield works
                let numKnights = object.getController().getPermanents().filter({ $0.isType(.Knight) }).count
                object.castingCost = object.getBaseCastingCost().reducedBy(numKnights)
                return object
            },
            layer: .CostReduction,
            allZones: true)
        theCircleOfLoyalty.addStaticAbility(
            requirement: AbilityRequirement.SubtypeYouControl(source: theCircleOfLoyalty, subtype: .Knight),
            effect: { $0.pumped(1, 1) },
            layer: .PowerToughnessChanging)
        theCircleOfLoyalty.addTriggeredAbility(
            trigger: .YouCastLegendarySpell,
            effect: { theCircleOfLoyalty.getController().createToken(Knight()) })
        theCircleOfLoyalty.addActivatedAbility(
            string: "{3}{W}, {T}: Create a 2/2 white Knight creature token with vigilance.",
            cost: Cost.Mana("3W").Tap(),
            effect: { theCircleOfLoyalty.getController().createToken(Knight()) })
        return theCircleOfLoyalty
    }
    // 10
    // 11 Faerie Godmother
    // 12
    // 13
    // 14 Giant Killer
    // 15
    // 16
    static func HarmoniousArchon() -> Card {
        let harmoniousArchon = Card(name: "Harmonious Archon", rarity: .Mythic, set: set, number: 17)
        harmoniousArchon.setManaCost("4WW")
        harmoniousArchon.setType(.Creature, .Archon)
        harmoniousArchon.flying = true
        harmoniousArchon.addStaticAbility(
            requirement: AbilityRequirement.Creatures(additionalRequirement: { !$0.isType(.Archon) }),
            effect: { $0.withBasePowerAndToughness(3, 3) },
            layer: .PowerToughnessSetting)
        harmoniousArchon.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                harmoniousArchon.getController().createToken(Human())
                harmoniousArchon.getController().createToken(Human())
            })
        harmoniousArchon.setFlavorText("First among equals.")
        harmoniousArchon.power = 4
        harmoniousArchon.toughness = 5
        return harmoniousArchon
    }
    
    static func Righteousness() -> Card {
        let righteousness = Card(name: "Righteousness", rarity: .Uncommon, set: set, number: 27)
        righteousness.setManaCost("W")
        righteousness.setType(.Instant)
        righteousness.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.blocking },
                zones: [.Battlefield]),
            effect: { $0.pump(7, 7) }))
        righteousness.setFlavorText("Syr Damon looked at the dragon and saw the faces of every innocent it had devoured. Suddenly, his sword blazed like the sun.")
        return righteousness
    }
    // 28
    static func ShiningArmor() -> Card {
        let shiningArmor = Card(name: "Shining Armor", rarity: .Common, set: set, number: 29)
        shiningArmor.setManaCost("1W")
        shiningArmor.setType(.Artifact, .Equipment)
        shiningArmor.flash = true
        shiningArmor.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Knight) && $0.getController() === shiningArmor.getController() },
                    zones: [.Battlefield]),
                effect: { shiningArmor.attachTo($0) }))
        shiningArmor.addEquipAbility(
            string: "{3}: Equip",
            cost: Cost.Mana("3"),
            effects: [
                ({ $0.pumped(0, 2) }, .PowerToughnessChanging),
                ({ $0.withKeyword(.Vigilance) }, .AbilityAddingOrRemoving)
            ])
        return shiningArmor
    }
    // 30 Silverflame Ritual
    // 31
    // 32
    static func TrappedInTheTower() -> Card {
        let trappedInTheTower = Card(name: "Trapped in the Tower", rarity: .Common, set: set, number: 33)
        trappedInTheTower.setManaCost("1W")
        trappedInTheTower.setType(.Enchantment, .Aura)
        trappedInTheTower.addEnchantAbility(
            restriction: TargetingRestriction.SingleObject(
                // TODO: make sure you can't enchant flying creatures, make sure giving flying causes to fall off
                restriction: { $0.isType(.Creature) && !$0.flying },
                zones: [.Battlefield]),
            effects: [
                ({ return $0.withKeyword(.CantAttack) }, .AbilityAddingOrRemoving),
                ({ return $0.withKeyword(.CantBlock) }, .AbilityAddingOrRemoving),
                ({ return $0.withKeyword(.CantActivateAbilities) }, .AbilityAddingOrRemoving),
            ])
        trappedInTheTower.setFlavorText("\"At least up here I have some peace and quiet.\"")
        return trappedInTheTower
    }
    static func TrueLovesKiss() -> Card {
        let trueLovesKiss = Card(name: "True Love's Kiss", rarity: .Common, set: set, number: 34)
        trueLovesKiss.setManaCost("2WW")
        trueLovesKiss.setType(.Instant)
        trueLovesKiss.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifactOrEnchantment(),
            effect: { object in
                object.exile()
                trueLovesKiss.getController().drawCard()
        }))
        trueLovesKiss.setFlavorText("\"Be careful, dear. Some people deserve their curses.\"\n--Marawen, barrow witch")
        return trueLovesKiss
    }
    static func VenerableKnight() -> Card {
        let venerableKnight = Card(name: "Venerable Knight", rarity: .Uncommon, set: set, number: 35)
        venerableKnight.setManaCost("W")
        venerableKnight.setType(.Creature, .Human, .Knight)
        venerableKnight.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Knight) && $0.getController() === venerableKnight.getController()},
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        venerableKnight.setFlavorText("\"May this blade guide you on your great journey, as it did me on mine.\"")
        venerableKnight.power = 2
        venerableKnight.toughness = 1
        return venerableKnight
    }
    static func WorthyKnight() -> Card {
        let worthyKnight = Card(name: "Worthy Knight", rarity: .Rare, set: set, number: 36)
        worthyKnight.setManaCost("1W")
        worthyKnight.setType(.Creature, .Human, .Knight)
        worthyKnight.addTriggeredAbility(
            trigger: .YouCastKnightSpell,
            effect: { worthyKnight.getController().createToken(Human()) })
        worthyKnight.setFlavorText("Every Ardenvale aspirant must step through the flame. Their honor determines whether they burn or shine.")
        worthyKnight.power = 2
        worthyKnight.toughness = 2
        return worthyKnight
    }
    // 37
    // 38 Animating Faerie
    // 39
    // 40
    static func CorridorMonitor() -> Card {
        let corridorMonitor = Card(name: "Corridor Monitor", rarity: .Common, set: set, number: 41)
        corridorMonitor.setManaCost("1U")
        corridorMonitor.setType(.Artifact, .Creature, .Construct)
        corridorMonitor.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { ($0.isType(.Artifact) || $0.isType(.Creature)) && $0.getController() === corridorMonitor.getController()},
                    zones: [.Battlefield]),
                effect: { $0.untap() }))
        corridorMonitor.setFlavorText("Castle Vantress has no locks on its doors, but interlopers rarely make it past the foyer.")
        corridorMonitor.power = 1
        corridorMonitor.toughness = 4
        return corridorMonitor
    }
    // 42
    // 43 Emry, Lurker of the Loch
    // 44
    static func FaerieVandal() -> Card {
        let faerieVandal = Card(name: "Faerie Vandal", rarity: .Uncommon, set: set, number: 45)
        faerieVandal.setManaCost("1U")
        faerieVandal.setType(.Creature, .Faerie, .Rogue)
        faerieVandal.flash = true
        faerieVandal.flying = true
        faerieVandal.addTriggeredAbility(
            trigger: .YouDrawSecondCard,
            effect: { faerieVandal.addCounter(.PlusOnePlusOne) })
        faerieVandal.setFlavorText("History may be written by the triumphant, but it's often rewritten by the troublesome.")
        faerieVandal.power = 1
        faerieVandal.toughness = 2
        return faerieVandal
    }
    // 46
    // 47 Frogify
    // 48 Gadwick, the Wizened
    // 49 Hypnotic Sprite
    static func IntoTheStory() -> Card {
        let intoTheStory = Card(name: "Into the Story", rarity: .Uncommon, set: set, number: 50)
        intoTheStory.setManaCost("5UU")
        intoTheStory.setType(.Instant)
        intoTheStory.addStaticAbility(
            requirement: AbilityRequirement.This(intoTheStory),
            effect: { object in
                if object.anyOpponent({ $0.getGraveyard().count >= 7 }) {
                    object.castingCost = object.getBaseCastingCost().reducedBy(3)
                }
                return object
            },
            layer: .CostReduction,
            allZones: true)
        intoTheStory.addEffect({
            intoTheStory.getController().drawCards(4)
        })
        intoTheStory.setFlavorText("The boundary between real and imaginary is as thin as the page, and just as easily torn.")
        return intoTheStory
    }
    // 51
    // 52
    // 53
    static func MidnightClock() -> Card {
        let midnightClock = Card(name: "Midnight Clock", rarity: .Rare, set: set, number: 54)
        midnightClock.setManaCost("2U")
        midnightClock.setType(.Artifact)
        midnightClock.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { midnightClock.getController().addMana(color: .Blue )},
            manaAbility: true)
        midnightClock.addActivatedAbility(
            string: "{2}{U}: Put an hour counter on ~.",
            cost: Cost.Mana("2U"),
            effect: { midnightClock.addCounter(.Hour) })
        midnightClock.addTriggeredAbility(
            trigger: .EachUpkeep,
            effect: { midnightClock.addCounter(.Hour) })
        midnightClock.addTriggeredAbility(
            trigger: .ThisGetsTwelfthHourCounter,
            effect: {
                midnightClock.getController().shuffleGraveyardAndHandIntoLibrary()
                midnightClock.getController().drawCards(7)
                midnightClock.exile()
            })
        return midnightClock
    }
    // 55
    // 56
    // 57
    // 58 Mystical Dispute
    // 59 Opt
    // 60
    // 61
    // 62 Run Away Together
    // 63
    // 64
    // 65
    // 66 Stolen by the Fae
    // 67 Syr Elenora, the Discerning
    static func TomeRaider() -> Card {
        let tomeRaider = Card(name: "Tome Raider", rarity: .Common, set: set, number: 68)
        tomeRaider.setManaCost("2U")
        tomeRaider.setType(.Creature, .Faerie)
        tomeRaider.flying = true
        tomeRaider.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { tomeRaider.getController().drawCard() })
        tomeRaider.setFlavorText("\"Humans are so forgetful. Every page I steal becomes a secret they can't remember.\"")
        tomeRaider.power = 1
        tomeRaider.toughness = 1
        return tomeRaider
    }
    // 69 Turn Into a Pumpkin
    // 70
    // 71
    // 72
    // 73 Wishful Merfolk
    // 74 Witching Well
    // 75 Ayara, First of Lochthwain
    static func BakeIntoAPie() -> Card {
        let bakeIntoAPie = Card(name: "Bake Into a Pie", rarity: .Common, set: set, number: 76)
        bakeIntoAPie.setManaCost("2BB")
        bakeIntoAPie.setType(.Instant)
        bakeIntoAPie.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: {
                _ = $0.destroy()
                bakeIntoAPie.getController().createToken(Food())
        }))
        bakeIntoAPie.setFlavorText("\"My secret ingredient? Well, I can't tell you that. But here's a hint. It's not love.\"")
        return bakeIntoAPie
    }
    
    static func Human() -> Token {
        let human = Token(name: "Human", set: set, number: -1 /*todo*/)
        human.colors = [Color.White]
        human.setType(.Creature, .Human)
        human.power = 1
        human.toughness = 1
        return human
    }
    static func Knight() -> Token {
        let knight = Token(name: "Knight", set: set, number: -1 /*todo*/)
        knight.colors = [Color.White]
        knight.setType(.Creature, .Knight)
        knight.vigilance = true
        knight.power = 2
        knight.toughness = 2
        return knight;
    }
    
    static func Food() -> Token {
        let r = Int.random(in: 15 ... 18)
        return makeFood(number: r)
    }
    private static func makeFood(number: Int) -> Token {
        let food = Token(name: "Food", set: set, number: number)
        food.setType(.Artifact, .Food)
        food.addActivatedAbility(
            string: "{2}, {T}, Sacrifice ~: You gain 3 life.",
            cost: Cost.Mana("2").Tap().Sacrifice(),
            effect: { food.getController().gainLife(3) })
        return food
    }
}
