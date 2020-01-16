import Foundation

extension Player {
    func devotion(_ color: Color) -> Int {
        return getPermanents().reduce(0, { result, object in result + object.pips(color) })
    }
}

extension Object {
    func pips(_ color: Color) -> Int {
        if let manaCost = manaCost {
            return manaCost.pips(color: color)
        }
        return 0
    }
}

enum THB {
    static var set = "thb"
    static var count = 254
    
    static let cards = [
//        AlseidOfLifesBounty,
//        ArchonOfFallingStars,
        ArchonOfSunsGrace,
//        BanishingLight,
        TheBirthOfMeletis,
        CaptivatingUnicorn,
//        CommandingPresence,
//        DawnEvangel,
        DaxosBlessedByTheSun,
        DaybreakChimera,
        DreadfulApathy,
//        EidolonOfObstruction,
//        ElspethConquersDeath,
//        ElspethSunsNemesis,
        FavoredOfIroas,
//        FlickerOfFate,
//        GloryBearers,
        HeliodSunCrowned,
//        HeliodsIntervention,
        HeliodsPilgrim,
//        HeliodsPunishment,
//        HeroOfThePride,
//        HeroOfTheWinds,
        IdyllicTutor,
        IndomitableWill,
        KarametrasBlessing,
        LagonnaBandStoryteller,
        LeoninOfTheLostPride,
        NyxbornCourser,
//        OmenOfTheSun,
        PhalanxTactics,
        PiousWayfarer,
        ReverentHoplite,
        RevokeExistence,
//        RumblingSentry,
//        SetinelsEyes,
        ShatterTheSky,
        SunmanePegasus,
        TaranikaAkroanVeteran,
        TranscendentEnvoy,
        TriumphantSurge,
    ]

    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    static private func Saga(_ object: Object) {
        object.addReplacementEffect(
            event: .ThisETB,
            effect: { object.addCounter(.Lore) })
        object.addReplacementEffect(
            event: .YourFirstMain,
            effect: { object.addCounter(.Lore) })
    }
        
    // 1 Alseid of Life's Bounty
    // 2 Archon of Falling Stars
    static func ArchonOfSunsGrace() -> Card {
        let archonOfSunsGrace = Card(name: "Archon of Sun's Grace", rarity: Rarity.Rare, set: set, number: 3)
        archonOfSunsGrace.setManaCost("2WW")
        archonOfSunsGrace.setType(.Creature, .Archon)
        archonOfSunsGrace.flying = true;
        archonOfSunsGrace.lifelink = true;
        archonOfSunsGrace.addStaticAbility(
            requirement: AbilityRequirement.SubtypeYouControl(source: archonOfSunsGrace, subtype: .Pegasus),
            effect: { $0.withKeyword(.Lifelink) },
            layer: .AbilityAddingOrRemoving)
        archonOfSunsGrace.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: { archonOfSunsGrace.getController().createToken(Pegasus()) })
        archonOfSunsGrace.power = 3
        archonOfSunsGrace.toughness = 4
        return archonOfSunsGrace
    }
    // 4 Banishing Light
    static func TheBirthOfMeletis() -> Card {
        let theBirthOfMeletis = Card(name: "The Birth of Meletis", rarity: .Uncommon, set: set, number: 5)
        theBirthOfMeletis.setManaCost("1W")
        theBirthOfMeletis.setType(.Enchantment, .Saga)
        Saga(theBirthOfMeletis)
        theBirthOfMeletis.addTriggeredAbility(
            trigger: .ThisGetsLoreCounter,
            effect: {
                let loreCounters = theBirthOfMeletis.getCounters(.Lore)
                if loreCounters == 1 {
                    theBirthOfMeletis.getController().chooseCard(
                        from: theBirthOfMeletis.getController().getLibrary(),
                        restriction: { $0.isType(.Basic) && $0.isType(.Plains) },
                        action: { chosen, rest in
                            chosen?.reveal()
                            chosen?.putIntoHand()
                            theBirthOfMeletis.getController().shuffleLibrary()
                    })
                }
                else if loreCounters == 2 {
                    theBirthOfMeletis.getController().createToken(Wall())
                }
                else if loreCounters == 3 {
                    theBirthOfMeletis.getController().gainLife(2)
                }

                if loreCounters >= 3 {
                    theBirthOfMeletis.sacrifice()
                }
        })
        return theBirthOfMeletis
    }
    static func CaptivatingUnicorn() -> Card {
        let captivatingUnicorn = Card(name: "Captivating Unicorn", rarity: .Common, set: set, number: 6)
        captivatingUnicorn.setManaCost("4W")
        captivatingUnicorn.setType(.Creature, .Unicorn)
        captivatingUnicorn.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreatureAnOpponentControl(source: captivatingUnicorn),
                effect: { $0.tap() }))
        captivatingUnicorn.setFlavorText("\"Gazing at the unicorn, I felt closer to the majesty of Nyx than I ever had before.\"\n--Oineus, traveling merchant")
        captivatingUnicorn.power = 4
        captivatingUnicorn.toughness = 4
        return captivatingUnicorn
    }
    // 7 CommandingPresence
    // 8 Dawn Evangel
    static func DaxosBlessedByTheSun() -> Card {
        let daxos = Card(name: "Daxos, Blessed by the Sun", rarity: .Uncommon, set: set, number: 9)
        daxos.setManaCost("WW")
        daxos.setType(.Legendary, .Enchantment, .Creature, .Demigod)
        daxos.addStaticAbility(
            requirement: AbilityRequirement.This(daxos),
            effect: { object in
                object.toughness = object.getController().devotion(.White)
                return object
            },
            layer: .PowerToughnessCDA,
            allZones: true)
        let effect = {
            daxos.getController().gainLife(1)
        }
        daxos.addTriggeredAbility(trigger: .AnotherCreatureEntersBattlefieldUnderYourControl, effect: effect)
        daxos.addTriggeredAbility(trigger: .AnotherCreatureYouControlDies, effect: effect)
        daxos.power = 2
        return daxos
    }
    static func DaybreakChimera() -> Card {
        let daybreakChimera = Card(name: "Daybreak Chimera", rarity: .Common, set: set, number: 10)
        daybreakChimera.setManaCost("3WW")
        daybreakChimera.setType(.Creature, .Chimera)
        daybreakChimera.addStaticAbility(
            requirement: AbilityRequirement.This(daybreakChimera),
            effect: { object in
                object.castingCost = object.getBaseCastingCost().reducedBy(1)
                return object
            },
            layer: .CostReduction,
            allZones: true)
        daybreakChimera.flying = true
        daybreakChimera.power = 3
        daybreakChimera.toughness = 3
        return daybreakChimera
    }
    static func DreadfulApathy() -> Card {
        let dreadfulApathy = Card(name: "Dreadful Apathy", rarity: .Common, set: set, number: 11)
        dreadfulApathy.setManaCost("2W")
        dreadfulApathy.setType(.Enchantment, .Aura)
        dreadfulApathy.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.withKeyword(.CantAttack).withKeyword(.CantBlock) },
            layer: .AbilityAddingOrRemoving)
        dreadfulApathy.addActivatedAbility(
            string: "{2}{W}: Exile enchanted creature.",
            cost: Cost.Mana("2W"),
            effect: { dreadfulApathy.attachedTo?.exile() })
        dreadfulApathy.setFlavorText("Those whose lives were uninspired are doomed to the wretched tedium of Phylias in death.")
        return dreadfulApathy
    }
    // 12 Eidolon of Obstruction
    // 13 Elspeth Conquers Death
    // 14 Elspeth, Sun's Nemesis
    static func FavoredOfIroas() -> Card {
        let favoredOfIroas = Card(name: "Favored of Iroas", rarity: .Uncommon, set: set, number: 15)
        favoredOfIroas.setManaCost("2W")
        favoredOfIroas.setType(.Creature, .Human, .Soldier)
        favoredOfIroas.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: { favoredOfIroas.giveKeywordUntilEndOfTurn(.DoubleStrike) })
        favoredOfIroas.setFlavorText("\"The promise of victory fills my heart. There is no room for fear.\"")
        favoredOfIroas.power = 2
        favoredOfIroas.toughness = 2
        return favoredOfIroas
    }
    // 16 Flicker of Fate
    // 17 Glory Bearers
    static func HeliodSunCrowned() -> Card {
        let heliod = Card(name: "Heliod, Sun-Crowned", rarity: .Mythic, set: set, number: 18)
        heliod.setManaCost("2W")
        heliod.setType(.Legendary, .Enchantment, .Creature, .God)
        heliod.indestructible = true
        heliod.addStaticAbility(
            requirement: AbilityRequirement.This(heliod),
            effect: { object in
                if object.getController().devotion(.White) < 5 {
                    return object.withoutType(.Creature)
                }
                return object
            },
            layer: .TypeChanging)
        heliod.addTriggeredAbility(
            trigger: .YouGainLife,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.getController() === heliod.getController() && ($0.isType(.Creature) || $0.isType(.Enchantment)) },
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        heliod.addActivatedAbility(
            string: "{1}{W}: Another target creature gains lifelink until end of turn.",
            cost: Cost.Mana("1W"),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.AnotherTargetCreature(source: heliod),
                effect: { $0.giveKeywordUntilEndOfTurn(.Lifelink) }))
        heliod.power = 5
        heliod.toughness = 5
        return heliod
    }
    // 19 Heliod's Intervention
    static func HeliodsPilgrim() -> Card {
        let heliodsPilgrim = Card(name: "Heliod's Pilgrim", rarity: .Common, set: set, number: 20)
        heliodsPilgrim.setManaCost("2W")
        heliodsPilgrim.setType(.Creature, .Human, .Cleric)
        heliodsPilgrim.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                heliodsPilgrim.getController().chooseCard(
                    from: heliodsPilgrim.getController().getLibrary(),
                    restriction: { $0.isType(.Aura) },
                    action: { chosen, rest in
                        chosen?.reveal()
                        chosen?.putIntoHand()
                        heliodsPilgrim.getController().shuffleLibrary()
                })
            })
        heliodsPilgrim.power = 1
        heliodsPilgrim.toughness = 2
        return heliodsPilgrim
    }
    // 21 Heliod's Punishment
    // 22 Hero of the Pride
    // 23 Hero of the Winds
    static func IdyllicTutor() -> Card {
        let idyllicTutor = Card(name: "Idyllic Tutor", rarity: .Rare, set: set, number:  24)
        idyllicTutor.setManaCost("2W")
        idyllicTutor.setType(.Sorcery)
        idyllicTutor.addEffect({
            idyllicTutor.getController().chooseCard(
                from: idyllicTutor.getController().getLibrary(),
                restriction: { $0.isType(.Enchantment) },
                action: { chosen, rest in
                    chosen?.reveal()
                    chosen?.putIntoHand()
                    idyllicTutor.getController().shuffleLibrary()
            })
        })
        idyllicTutor.setFlavorText("\"You are loved, child.\"")
        return idyllicTutor
    }
    static func IndomitableWill() -> Card {
        let indomitableWill = Card(name: "Indomitable Will", rarity: .Common, set: set, number: 25)
        indomitableWill.setManaCost("1W")
        indomitableWill.setType(.Enchantment, .Aura)
        indomitableWill.flash = true
        indomitableWill.addEnchantAbility(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.pumped(1, 2) },
            layer: .PowerToughnessChanging)
        indomitableWill.setFlavorText("\"Charge bravely. Fight selflessly. Act honorably. Iroas will watch over you.\"\n--Verenis, priest of Iroas")
        return indomitableWill
    }
    static func KarametrasBlessing() -> Card {
        let karametrasBlessing = Card(name: "Karametra's Blessing", rarity: .Common, set: set, number: 26)
        karametrasBlessing.setManaCost("W")
        karametrasBlessing.setType(.Instant)
        karametrasBlessing.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { object in
                object.pump(2, 2)
                if object.isType(.Enchantment) || object.isEnchanted() {
                    object.giveKeywordUntilEndOfTurn(.Hexproof)
                    object.giveKeywordUntilEndOfTurn(.Indestructible)
                }
        }))
        return karametrasBlessing
    }
    static func LagonnaBandStoryteller() -> Card {
        let lagonnaBandStoryteller = Card(name: "Lagonna-Band Storyteller", rarity: .Uncommon, set: set, number: 27)
        lagonnaBandStoryteller.setManaCost("3W")
        lagonnaBandStoryteller.setType(.Creature, .Centaur, .Advisor)
        lagonnaBandStoryteller.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.getOwner() === lagonnaBandStoryteller.getController() && $0.isType(.Enchantment) },
                    zones: [.Graveyard]),
                effect: { object in
                    object.putOnTopOfLibrary()
                    lagonnaBandStoryteller.getController().gainLife(object.getConvertedManaCost())
                },
                effectOptional: true))
        lagonnaBandStoryteller.setFlavorText("\"Our stories are full of ancient wisdom; they tell us who we are.\"")
        lagonnaBandStoryteller.power = 3
        lagonnaBandStoryteller.toughness = 4
        return lagonnaBandStoryteller
    }
    static func LeoninOfTheLostPride() -> Card {
        let leoninOfTheLostPride = Card(name: "Leonin of the Lost Pride", rarity: .Common, set: set, number: 28)
        leoninOfTheLostPride.setManaCost("1W")
        leoninOfTheLostPride.setType(.Creature, .Cat, .Warrior)
        leoninOfTheLostPride.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.getOwner() !== leoninOfTheLostPride.getController()},
                    zones: [.Graveyard]),
                effect: { $0.exile() }))
        leoninOfTheLostPride.setFlavorText("Leonin band together in the Underworld, taking solace in their strength until, at last, both pride and self are forgotten.")
        leoninOfTheLostPride.power = 3
        leoninOfTheLostPride.toughness = 1
        return leoninOfTheLostPride
    }
    static func NyxbornCourser() -> Card {
        let nyxbornCourser = Card(name: "Nyxborn Courser", rarity: .Common, set: set, number: 29)
        nyxbornCourser.setManaCost("1WW")
        nyxbornCourser.setType(.Enchantment, .Creature, .Centaur, .Scout)
        nyxbornCourser.setFlavorText("\"Storms drove them westward to Ketaphos; wide plains shimmered in starlight. Centaurs greeted them, offering gold-hued apples and grain-cakes.\"\n--The Callapheia")
        nyxbornCourser.power = 2
        nyxbornCourser.toughness = 4
        return nyxbornCourser
    }
    // 30 Omen of the Sun
    static func PhalanxTactics() -> Card {
        let phalanxTactics = Card(name: "Phalanx Tactics", rarity: .Uncommon, set: set, number: 31)
        phalanxTactics.setManaCost("1W")
        phalanxTactics.setType(.Instant)
        phalanxTactics.addEffect(TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreatureYouControl(source: phalanxTactics),
                effect: { target in
                    target.pump(2, 1)
                    phalanxTactics.getController().getCreatures().filter({ $0 != target }).forEach({ $0.pump(1, 1) })
                }))
        phalanxTactics.setFlavorText("Every soldier has a place to stand and a role to play.")
        return phalanxTactics
    }
    static func PiousWayfarer() -> Card {
        let piousWayfarer = Card(name: "Pious Wayfarer", rarity: .Common, set: set, number: 32)
        piousWayfarer.setManaCost("W")
        piousWayfarer.setType(.Creature, .Human, .Scout)
        piousWayfarer.addTriggeredAbility(
            trigger: .EnchantmentEntersBattlefieldUnderYourControl,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.pump(1, 1) }))
        piousWayfarer.setFlavorText("Every footstep is a prayer, every road a temple.")
        piousWayfarer.power = 1
        piousWayfarer.toughness = 2
        return piousWayfarer
    }
    static func ReverentHoplite() -> Card {
        let reverentHoplite = Card(name: "Reverent Hoplite", rarity: .Uncommon, set: set, number: 33)
        reverentHoplite.setManaCost("4W")
        reverentHoplite.setType(.Creature, .Human, .Soldier)
        reverentHoplite.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                for _ in 0..<reverentHoplite.getController().devotion(.White) {
                    reverentHoplite.getController().createToken(HumanSoldier())
                }
            })
        reverentHoplite.setFlavorText("\"Zeal is the sharpest blade, and piety the strongest shield.\"")
        reverentHoplite.power = 1
        reverentHoplite.toughness = 2
        return reverentHoplite
    }
    static func RevokeExistence() -> Card {
        let revokeExistence = Card(name: "Revoke Existence", rarity: .Common, set: set, number: 34)
        revokeExistence.setManaCost("1W")
        revokeExistence.setType(.Sorcery)
        revokeExistence.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetArtifactOrEnchantment(),
            effect: { $0.exile() }))
        revokeExistence.setFlavorText("\"The time has come for us to throw off the chains of tyrannical gods and antiquated superstitions.\"\n--Tikaia, disciple of Uremides")
        return revokeExistence
    }
    // 35 Rumbling Sentry
    // 36 Sentinel's Eyes
    static func ShatterTheSky() -> Card {
        let shatterTheSky = Card(name: "Shatter the Sky", rarity: .Rare, set: set, number: 37)
        shatterTheSky.setManaCost("2WW")
        shatterTheSky.setType(.Sorcery)
        shatterTheSky.addEffect({
            Game.shared.bothPlayers({ player in
                if player.getCreatures().filter({ $0.getPower() >= 4 }).count > 0 {
                    player.drawCard()
                }
            })
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach({ _ = $0.destroy() })
            })
        })
        shatterTheSky.setFlavorText("When the gods go to war, mortals pay the highest price.")
        return shatterTheSky
    }
    static func SunmanePegasus() -> Card {
        let sunmanePegasus = Card(name: "Sunmane Pegasus", rarity: .Common, set: set, number: 38)
        sunmanePegasus.setManaCost("3W")
        sunmanePegasus.setType(.Creature, .Pegasus)
        sunmanePegasus.flying = true
        sunmanePegasus.addActivatedAbility(
            string: "{1}{W}: ~ gains vigilance and lifelink until end of turn.",
            cost: Cost.Mana("1W"),
            effect: {
                sunmanePegasus.giveKeywordUntilEndOfTurn(.Vigilance)
                sunmanePegasus.giveKeywordUntilEndOfTurn(.Lifelink)
        })
        sunmanePegasus.setFlavorText("Chosen by Heliod, Daxos approached the pegasus without fear, and rode it without saddle or reins.")
        sunmanePegasus.power = 2
        sunmanePegasus.toughness = 3
        return sunmanePegasus
    }
    static func TaranikaAkroanVeteran() -> Card {
        let taranika = Card(name: "Taranika, Akroan Veteran", rarity: .Rare, set: set, number: 39)
        taranika.setManaCost("1WW")
        taranika.setType(.Legendary, .Creature, .Human, .Soldier)
        taranika.vigilance = true
        taranika.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.AnotherTargetCreatureYouControl(source: taranika),
                effect: { target in
                    target.untap()
                    target.setBasePowerAndToughnessUntilEndOfTurn(4, 4)
                    target.giveKeywordUntilEndOfTurn(.Indestructible)
            }))
        taranika.setFlavorText("\"I like to think Kytheon keeps watch over all of us.\"")
        taranika.power = 3
        taranika.toughness = 3
        return taranika
    }
    static func TranscendentEnvoy() -> Card {
        let transcendentEnvoy = Card(name: "Transcendent Envoy", rarity: .Common, set: set, number: 40)
        transcendentEnvoy.setManaCost("1W")
        transcendentEnvoy.setType(.Enchantment, .Creature, .Griffin)
        transcendentEnvoy.flying = true
        transcendentEnvoy.addStaticAbility(
            requirement: AbilityRequirement.AuraSpellsYouCast(source: transcendentEnvoy),
            effect: { object in
                object.castingCost = object.getBaseCastingCost().reducedBy(1)
                return object
            },
            layer: .CostReduction)
        transcendentEnvoy.setFlavorText("\"The first griffins were made by the gods to capture falling stars; they were given the keenest eyes and the swiftest wings, and sent to keep watch above the clouds.\"\n--The Cosmogony")
        transcendentEnvoy.power = 2
        transcendentEnvoy.toughness = 1
        return transcendentEnvoy
    }
    static func TriumphantSurge() -> Card {
        let triumphantSurge = Card(name: "Triumphant Surge", rarity: .Common, set: set, number: 41)
        triumphantSurge.setManaCost("3W")
        triumphantSurge.setType(.Instant)
        triumphantSurge.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getPower() >= 4 },
                zones: [.Battlefield]),
            effect: { target in
                _ = target.destroy()
                triumphantSurge.getController().gainLife(3)
        }))
        triumphantSurge.setFlavorText("Not even death can quench a hero's inner fire.")
        return triumphantSurge
    }
    
    static func Goat() -> Token {
        let goat = Token(name: "Goat", set: set, number: 1)
        goat.colors = [.White]
        goat.setType(.Creature, .Goat)
        goat.power = 0
        goat.toughness = 1
        return goat
    }
    static func HumanSoldier() -> Token {
        let humanSoldier = Token(name: "Human Soldier", set: set, number: 2)
        humanSoldier.colors = [.White]
        humanSoldier.setType(.Creature, .Human, .Soldier)
        humanSoldier.power = 1
        humanSoldier.toughness = 1
        return humanSoldier
    }
    static func Pegasus() -> Token {
        let pegasus = Token(name: "Pegasus", set: set, number: 3)
        pegasus.colors = [.White]
        pegasus.setType(.Creature, .Pegasus)
        pegasus.flying = true
        pegasus.power = 2
        pegasus.toughness = 2
        return pegasus
    }
    static func Kraken() -> Token {
        let kraken = Token(name: "Kraken", set: set, number: 4)
        kraken.colors = [.Blue]
        kraken.setType(.Creature, .Kraken)
        kraken.hexproof = true
        kraken.power = 8
        kraken.toughness = 8
        return kraken
    }
    static func Reflection() -> Token {
        let reflection = Token(name: "Reflection", set: set, number: 5)
        reflection.colors = [.Blue]
        reflection.setType(.Creature, .Kraken)
        reflection.power = 3
        reflection.toughness = 2
        return reflection
    }
    static func Tentacle() -> Token {
        let tentacle = Token(name: "Tentacle", set: set, number: 6)
        tentacle.colors = [.Blue]
        tentacle.setType(.Creature, .Tentacle)
        tentacle.power = 1
        tentacle.toughness = 1
        return tentacle
    }
    static func Zombie() -> Token {
        let zombie = Token(name: "Zombie", set: set, number: 7)
        zombie.colors = [.Black]
        zombie.setType(.Creature, .Zombie)
        zombie.power = 2
        zombie.toughness = 2
        return zombie
    }
    static func Elemental(power: Int) -> Token {
        let elemental = Token(name: "Elemental", set: set, number: 8)
        elemental.colors = [.Red]
        elemental.setType(.Creature, .Elemental)
        elemental.trample = true
        elemental.haste = true
        elemental.power = power
        elemental.toughness = 1
        return elemental
    }
    static func Satyr() -> Token {
        let satyr = Token(name: "Satyr", set: set, number: 9)
        satyr.colors = [.Red]
        satyr.setType(.Creature, .Satyr)
        satyr.cantBlock = true
        satyr.power = 1
        satyr.toughness = 1
        return satyr
    }
    static func Spider() -> Token {
        let spider = Token(name: "Spider", set: set, number: 10)
        spider.colors = [.Green]
        spider.setType(.Creature, .Spider)
        spider.reach = true
        spider.power = 1
        spider.toughness = 2
        return spider
    }
    static func Wolf() -> Token {
        let wolf = Token(name: "Wolf", set: set, number: 11)
        wolf.colors = [.Green]
        wolf.setType(.Creature, .Wolf)
        wolf.power = 2
        wolf.toughness = 2
        return wolf
    }
    static func Nightmare() -> Token {
        let nightmare = Token(name: "Nightmare", set: set, number: 12)
        nightmare.colors = [.Blue, .Black]
        nightmare.setType(.Creature, .Nightmare)
        let effect = {
            nightmare.eachOpponent({ $0.exileTopOfLibrary(2) })
        }
        nightmare.addTriggeredAbility(trigger: .ThisAttacks, effect: effect)
        nightmare.addTriggeredAbility(trigger: .ThisBlocks, effect: effect)
        nightmare.power = 2
        nightmare.toughness = 3
        return nightmare
    }
    static func Gold() -> Token {
        let gold = Token(name: "Gold", set: set, number: 13)
        gold.setType(.Artifact, .Gold)
        gold.addActivatedAbility(
            string: "Sacrifice ~: Add {W}.",
            cost: Cost.Sacrifice(),
            effect: { gold.getController().addMana(color: .White) },
            manaAbility: true)
        gold.addActivatedAbility(
            string: "Sacrifice ~: Add {U}.",
            cost: Cost.Sacrifice(),
            effect: { gold.getController().addMana(color: .Blue) },
            manaAbility: true)
        gold.addActivatedAbility(
            string: "Sacrifice ~: Add {B}.",
            cost: Cost.Sacrifice(),
            effect: { gold.getController().addMana(color: .Black) },
            manaAbility: true)
        gold.addActivatedAbility(
            string: "Sacrifice ~: Add {R}.",
            cost: Cost.Sacrifice(),
            effect: { gold.getController().addMana(color: .Red) },
            manaAbility: true)
        gold.addActivatedAbility(
            string: "Sacrifice ~: Add {G}.",
            cost: Cost.Sacrifice(),
            effect: { gold.getController().addMana(color: .Green) },
            manaAbility: true)
        return gold
    }
    static func Wall() -> Token {
        let wall = Token(name: "Wall", set: set, number: 14)
        wall.setType(.Artifact, .Creature, .Wall)
        wall.defender = true
        wall.power = 0
        wall.toughness = 4
        return wall
    }
    
    

}

