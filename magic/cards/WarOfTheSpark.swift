import Foundation

enum WAR {
    static var set = "war"
    static var count = 264
    
    static let cards = [
        
        AjanisPridemate,
        
        BondOfDiscipline,
        BulwarkGiant,
        
        DefiantStrike,
        
//        GideonsTriumph,
        
//        GratefulApparition,
        
        IgniteTheBeacon,
        
        LawRuneEnforcer,
        LoxodonSergeant,
        
        RavnicaAtWar,
//        RisingPopulace,
//        SingleCombat,
        
        ToppleTheStatue,
        
//        TeyoTheShieldmage,
        TeyosLightshield,
        
//        TheWanderer,
//        WanderersStrike,
        
//        AugurOfBolas,
        
//        CrushDissent,
        ErraticVisionary,
        
//        FblthpTheLost,
        
//        FluxChanneler,
        
//        JaceWielderOfMysteries,
        JacesTriumph,
        
//        KiorasDambreaker,
//        LazotepPlating,
        NagaEternal,
        
//        NoEscape,
//        RelentlessAdvance,
        
//        TeferisTimeTwist,
        
        TotallyLost,
        
//        BolassCitadel,
        
        DavrielRogueShadowmage,
        DavrielsSubterfuge,
        
//        DreadhordeInvasion,
        
//        EternalTaskmaster,
        
//        HeraldOfTheDreadhorde,
//        KayasGhostform,
        LazotepBehemoth,
//        LazotepReaver,
//        LilianaDreadhordeGeneral,
        
//        ObNixilisTheHateTwisted,
//        ObNixilissCruelty,
        
        SorinsThirst,
        
//        VraskasFinisher,
//        AhnCropInvader,
        
//        BurningProphet,
        
        ChainwhipCyclops,
        
        ChandrasTriumph,
        
//        DreadhordeArcanist,
        
//        GrimInitiate,
        
//        HonorTheGodPharaoh,
        
//        InvadingManticore,
        
        KrenkoTinStreetKingpin,
        
        NahirisStoneblades,
//        NehebDreadhordeChampion,
        
//        SamutsSprint,
        
//        TibaltRakishInstigator,
        TibaltsRager,
        
//        ArlinnVoiceOfThePack,
        ArlinnsWolf,
        AwakeningOfVituGhazi,
        
        CentaurNurturer,
        
        GiantGrowth,
        
//        JiangYangguWildcrafter,
        
//        MowuLoyalCompanion,
        
        NissasTriumph,
        ParadiseDruid,
        
        ThunderingCeratok,
//        VivienChampionOfTheWilds,
//        ViviensArkbow,
        ViviensGrizzly,
        
        AjaniTheGreathearted,
//        AngrathsRampage,
        
//        CruelCelebrant,
        Deathsprout,
        
        DomrisAmbush,
        DovinsVeto,
//        DreadhordeButcher,
        
//        GleamingOverseer,
        
//        InvadeTheCity,
        LeylineProwler,
        
        PledgeOfUnity,
        
        SolarBlaze,
        
//        SorinVengefulBloodlord,
        
//        StorrevDevkarinLich,
        
//        TeferiTimeRaveler,
        
//        TimeWipe,
        
//        WidespreadBrutality,
//        AngrathCaptainOfChaos,
        
//        KayaBaneOfTheDead,
//        KioraBehemothBeckoner
//        NahiriStormOfStone,
        
//        SamutTyrantSmasher,
//        VraskaSwarmsEminence,
        
//        TezzeretMasterOfTheBridge,
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    static private func Mythics() -> [() -> Card] { return cards.filter({ $0().getRarity() == .Mythic }) }
    static private func Rares() -> [() -> Card] { return cards.filter({ $0().getRarity() == .Rare }) }
    static private func Uncommons() -> [() -> Card] { return cards.filter({ $0().getRarity() == .Uncommon }) }
    static private func Commons() -> [() -> Card] { return cards.filter({ $0().getRarity() == .Common && !$0().isBasicLand() }) }
    static private func BasicLands() -> [() -> Card] { return cards.filter({ $0().isBasicLand() }) }
    
    // 1
    // 2
    // 3
    static func AjanisPridemate() -> Card {
        let ajanisPridemate = Card(name: "Ajani's Pridemate", rarity: .Uncommon, set: set, number: 4)
        ajanisPridemate.setManaCost("1W")
        ajanisPridemate.setType(.Creature, .Cat, .Soldier)
        ajanisPridemate.addTriggeredAbility(
            trigger: .YouGainLife,
            effect: { ajanisPridemate.addCounter(.PlusOnePlusOne) }
        )
        ajanisPridemate.setFlavorText("\"When one of us prospers, the pride prospers.\"\n--Jazal Goldmane")
        ajanisPridemate.power = 2
        ajanisPridemate.toughness = 2
        return ajanisPridemate
    }
    // 5
    static func BondOfDiscipline() -> Card {
        let bondOfDiscipline = Card(name: "Bond of Discipline", rarity: .Uncommon, set: set, number: 6)
        bondOfDiscipline.setManaCost("4W")
        bondOfDiscipline.setType(.Sorcery)
        bondOfDiscipline.addEffect({
            bondOfDiscipline.eachOpponent({ opponent in
                opponent.getCreatures().forEach({ $0.tap() })
            })
            bondOfDiscipline.getController().getCreatures().forEach({ creature in
                creature.giveKeywordUntilEndOfTurn(.Lifelink)
            })
        })
        bondOfDiscipline.setFlavorText("\"We agree that order benefits everyone, but not until you enforce it.\"")
        return bondOfDiscipline
    }
    static func BulwarkGiant() -> Card {
        let bulwarkGiant = Card(name: "Bulwark Giant", rarity: .Common, set: set, number: 7)
        bulwarkGiant.setManaCost("5W")
        bulwarkGiant.setType(.Creature, .Giant, .Soldier)
        bulwarkGiant.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { bulwarkGiant.getController().gainLife(5) })
        bulwarkGiant.setFlavorText("\"Where did she come from? More importantly, are there more like her?\"\n--Gideon Jura")
        bulwarkGiant.power = 3
        bulwarkGiant.toughness = 6
        return bulwarkGiant
    }
    // 8
    static func DefiantStrike() -> Card {
        let defiantStrike = Card(name: "Defiant Strike", rarity: .Common, set: set, number: 9)
        defiantStrike.setManaCost("W")
        defiantStrike.setType(.Instant)
        defiantStrike.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: {
                $0.pump(1, 0)
                defiantStrike.getController().drawCard()
        }))
        defiantStrike.setFlavorText("\"My family was saved thanks to a single Boros soldier. It's why I joined the legion. I will be the protector now.\"")
        return defiantStrike
    }
    
    
    // 15 Gideon's Triumph
    // 16
    // 17 Grateful Apparition
    static func IgniteTheBeacon() -> Card {
        let igniteTheBeacon = Card(name: "Ignite the Beacon", rarity: .Rare, set: set, number: 18)
        igniteTheBeacon.setManaCost("4W")
        igniteTheBeacon.setType(.Sorcery)
        igniteTheBeacon.addEffect({
            igniteTheBeacon.getController().chooseCards(
                from: igniteTheBeacon.getController().getLibrary(),
                restrictions: [{$0.isType(.Planeswalker)},
                               {$0.isType(.Planeswalker)}],
                action: { chosen, rest in
                    chosen.forEach({
                        $0.reveal()
                        $0.putIntoHand()
                    })
                    igniteTheBeacon.getController().shuffleLibrary()
            })
        })
        igniteTheBeacon.setFlavorText("\"If you can't save yourself, you fight to give someone else a chance.\"\n--Ajani Goldmane")
        return igniteTheBeacon
    }
    // 19
    static func LawRuneEnforcer() -> Card {
        let lawRuneEnforcer = Card(name: "Law-Rune Enforcer", rarity: .Common, set: set, number: 20)
        lawRuneEnforcer.setManaCost("W")
        lawRuneEnforcer.setType(.Creature, .Human, .Soldier)
        lawRuneEnforcer.addActivatedAbility(
            string: "{1}, {T}: Tap target creature with converted mana cost 2 or greater.",
            cost: Cost.Mana("1").Tap(),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getConvertedManaCost() >= 2 },
                    zones: [.Battlefield]),
                effect: { $0.tap() }))
        lawRuneEnforcer.setFlavorText("\"See that no one enters or leaves New Prahv today. And notify me at once of any Planeswalker activity.\"\n--Dovin Baan")
        lawRuneEnforcer.power = 1
        lawRuneEnforcer.toughness = 2
        return lawRuneEnforcer
    }
    static func LoxodonSergeant() -> Card {
        let loxodonSergeant = Card(name: "Loxodon Sergeant", rarity: .Common, set: set, number: 21)
        loxodonSergeant.setManaCost("3W")
        loxodonSergeant.setType(.Creature, .Elephant, .Soldier)
        loxodonSergeant.vigilance = true
        loxodonSergeant.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                loxodonSergeant.getController().getCreatures().filter({ $0 != loxodonSergeant }).forEach({ creature in
                    creature.giveKeywordUntilEndOfTurn(.Vigilance)
                })
        })
        loxodonSergeant.setFlavorText("His voice is both war horn and rallying cry, a trumpeting call that stirs even the faintest hearts.")
        loxodonSergeant.power = 3
        loxodonSergeant.toughness = 3
        return loxodonSergeant
    }
    
    static func RavnicaAtWar() -> Card {
        let ravnicaAtWar = Card(name: "Ravnica at War", rarity: .Rare, set: set, number: 28)
        ravnicaAtWar.setManaCost("3W")
        ravnicaAtWar.setType(.Sorcery)
        ravnicaAtWar.addEffect({
            Game.shared.bothPlayers({ player in
                player.getPermanents().filter({ $0.isMulticolored() }).forEach({ $0.exile() })
            })
        })
        ravnicaAtWar.setFlavorText("The heart of Ravnica disappeared before anyone could strike a blow in its defense.")
        return ravnicaAtWar
    }
    // 29 Rising Populace
    // 30 Single Combat
    // 31
    // 32 Teyo, the Shieldmage
    static func TeyosLightshield() -> Card {
        let teyosLightshield = Card(name: "Teyo's Lightshield", rarity: .Common, set: set, number: 33)
        teyosLightshield.setManaCost("3W")
        teyosLightshield.setType(.Creature, .Illusion)
        teyosLightshield.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === teyosLightshield.getController() },
                    zones: [.Battlefield]),
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        teyosLightshield.setFlavorText("Teyo gifted his shields to as many allies as possible, knowing he could not always be there to protect them himself.")
        teyosLightshield.power = 0
        teyosLightshield.toughness = 3
        return teyosLightshield
    }
    // 34
    static func ToppleTheStatue() -> Card {
        let toppleTheStatue = Card(name: "Topple the Statue", rarity: .Common, set: set, number: 35)
        toppleTheStatue.setManaCost("2W")
        toppleTheStatue.setType(.Instant)
        toppleTheStatue.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetPermanent(),
            effect: { target in
                target.tap()
                if target.isType(.Artifact) {
                    _ = target.destroy()
                }
                toppleTheStatue.getController().drawCard()
        }))
        toppleTheStatue.setFlavorText("Bolas cared little when his statue fell, thinking it a useful distraction, underestimating the surge of resolve it gave his opponents.")
        return toppleTheStatue
    }
    // 36
    // 37 The Wanderer
    // 38 Wanderer's Strike
    
    // 41 Augur of Bolas
    
    // 47 Crush Dissent
    static func ErraticVisionary() -> Card {
        let erraticVisionary = Card(name: "Erratic Visionary", rarity: .Common, set: set, number: 48)
        erraticVisionary.setManaCost("1U")
        erraticVisionary.setType(.Creature, .Human, .Wizard)
        erraticVisionary.addActivatedAbility(
            string: "{1}{U}, {T}: Draw a card, then discard a card.",
            cost: Cost.Mana("1U").Tap(),
            effect: {
                erraticVisionary.getController().drawCard()
                erraticVisionary.getController().discard()
        })
        erraticVisionary.setFlavorText("An Izzet experiment begins with a \"what if,\" gets approved with a \"why not,\" and concludes with a \"eureka!\"")
        erraticVisionary.power = 1
        erraticVisionary.toughness = 3
        return erraticVisionary
    }
    // 49
    // 50 Fblthp, the Lost
    // 51
    // 52 Flux Channeler
    // 53
    // 54 Jace, Wielder of Mysteries
    static func JacesTriumph() -> Card {
        let jacesTriumph = Card(name: "Jace's Triumph", rarity: .Uncommon, set: set, number: 55)
        jacesTriumph.setManaCost("2U")
        jacesTriumph.setType(.Sorcery)
        jacesTriumph.addEffect({
            let controlsJace = !jacesTriumph.getController().getPermanents().filter({ $0.isType(.Jace) && $0.isType(.Planeswalker) }).isEmpty
            let amount = controlsJace ? 3 : 2
            jacesTriumph.getController().drawCards(amount)
        })
        jacesTriumph.setFlavorText("His triumph was not outsmarting Bolas's plan, but in understanding why ultimate power is self-defeating.")
        return jacesTriumph
    }
    // 56
    // 57
    // 58 Kiora's Dambreaker
    // 59 Lazotep Plating
    static func NagaEternal() -> Card {
        let nagaEternal = Card(name: "Naga Eternal", rarity: .Common, set: set, number: 60)
        nagaEternal.setManaCost("2U")
        nagaEternal.setType(.Creature, .Zombie, .Naga)
        nagaEternal.setFlavorText("\"I recognize that headdress. This one was feared even by her fellow initiates.\"\n--Samut")
        nagaEternal.power = 3
        nagaEternal.toughness = 2
        return nagaEternal
    }
    // 61
    // 62
    // 63 No Escape
    // 64 Relentless Advance
    
    // 72 Teferi's Time Twist
    // 73
    static func TotallyLost() -> Card {
        let totallyLost = Card(name: "Totally Lost", rarity: .Common, set: set, number: 74)
        totallyLost.setManaCost("4U")
        totallyLost.setType(.Instant)
        totallyLost.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetNonlandPermanent(),
            effect: { $0.putOnTopOfLibrary() }))
        totallyLost.setFlavorText("At least this was better than the week at the Juri Revue.")
        return totallyLost
    }
    // 75
    // 76
    // 78
    // 79 Bolas's Citadel
    // 80
    // 81
    // 82
    static func DavrielRogueShadowmage() -> Card {
        let davriel = Card(name: "Davriel, Rogue Shadowmage", rarity: .Uncommon, set: set, number: 83)
        davriel.setManaCost("2B")
        davriel.setType(.Legendary, .Planeswalker, .Davriel)
        davriel.addTriggeredAbility(
            trigger: .EachOpponentsUpkeep,
            effect: {
                let opponent = Game.shared.getActivePlayer()
                if opponent.getHand().count <= 1 {
                    davriel.damage(to: opponent, 2)
                }
        })
        davriel.addActivatedAbility(
            string: "{-1}: Target player discards a card.",
            cost: Cost.RemoveCounters(.Loyalty, 1),
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetingRestriction.TargetPlayer(),
                effect: { $0.discard() }),
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        davriel.startingLoyalty = 3
        return davriel
    }
    static func DavrielsSubterfuge() -> Card {
        let davrielsSubterfuge = Card(name: "Davriel's Subterfuge", rarity: .Common, set: set, number: 84)
        davrielsSubterfuge.setManaCost("3B")
        davrielsSubterfuge.setType(.Sorcery)
        davrielsSubterfuge.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetingRestriction.TargetPlayer(),
            effect: {
                $0.discard(2)
                $0.loseLife(2)
        }))
        davrielsSubterfuge.setFlavorText("Shadows coiled around the witness's mind. Then the moment vanished, leaving only the sting of its loss.")
        return davrielsSubterfuge
    }
    // 85
    // 86 Dreadhorde Invasion
    // 87
    // 88
    // 89
    // 90 Eternal Taskmaster
    // 91
    // 92
    // 93 Herald of the Dreadhorde
    // 94 Kaya's Ghostform
    static func LazotepBehemoth() -> Card {
        let lazotepBehemoth = Card(name: "Lazotep Behemoth", rarity: .Common, set: set, number: 95)
        lazotepBehemoth.setManaCost("4B")
        lazotepBehemoth.setType(.Creature, .Zombie, .Hippo)
        lazotepBehemoth.setFlavorText("\"I know I should be more concerned. But a big, blue, zombie-potamus from beyond the stars? This is what they're invading us with?\"\n--Mileva, Boros legionnaire")
        lazotepBehemoth.power = 5
        lazotepBehemoth.toughness = 4
        return lazotepBehemoth
    }
    // 96 Lazotep Reaver
    // 97 Liliana, Dreadhorde General
    // 98
    // 99
    // 100 Ob Nixilis, the Hate-Twisted
    // 101 Ob Nixilis's Cruelty,
    // 102
    // 103
    static func SorinsThirst() -> Card {
        let sorinsThirst = Card(name: "Sorin's Thirst", rarity: .Common, set: set, number: 104)
        sorinsThirst.setManaCost("1B")
        sorinsThirst.setType(.Instant)
        sorinsThirst.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                sorinsThirst.damage(to: target, 2)
                sorinsThirst.getController().gainLife(2)
        }))
        sorinsThirst.setFlavorText("\"I see you're out of the wall.\"\n--Nahiri")
        return sorinsThirst
    }
    
    // 112 Vraska's Finisher
    // 113 Ahn-Crop Invader
    // 114
    // 115
    // 116
    // 117 Burning Prophet
    static func ChainwhipCyclops() -> Card {
        let chainwhipCyclops = Card(name: "Chainwhip Cyclops", rarity: .Common, set: set, number: 118)
        chainwhipCyclops.setManaCost("4R")
        chainwhipCyclops.setType(.Creature, .Cyclops, .Warrior)
        chainwhipCyclops.addActivatedAbility(
            string: "{3}{R}: Target creature can't block this turn.",
            cost: Cost.Mana("3R"),
            effect: TargetedEffect.SingleObject(
                restriction: TargetingRestriction.TargetCreature(),
                effect: { $0.giveKeywordUntilEndOfTurn(.CantBlock) }))
        chainwhipCyclops.setFlavorText("\"You say this Tenth District, not Rubblebelt. But where smash happen, that Rubblebelt. Rubblebelt state of mind.\"\n--Urgdar, cyclops philosopher")
        chainwhipCyclops.power = 4
        chainwhipCyclops.toughness = 4
        return chainwhipCyclops
    }
    // 119
    // 120
    static func ChandrasTriumph() -> Card {
        let chandrasTriumph = Card(name: "Chandra's Triumph", rarity: .Uncommon, set: set, number: 121)
        chandrasTriumph.setManaCost("1R")
        chandrasTriumph.setType(.Instant)
        chandrasTriumph.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { ($0.isType(.Creature) || $0.isType(.Planeswalker)) && $0.getController() !== chandrasTriumph.getController() },
                zones: [.Battlefield]),
            effect: { target in
                let controlsChandra = !chandrasTriumph.getController().getPermanents().filter({ $0.isType(.Chandra) && $0.isType(.Planeswalker) }).isEmpty
                let amount = controlsChandra ? 5 : 3
                chandrasTriumph.damage(to: target, amount)
        }))
        chandrasTriumph.setFlavorText("Her triumph came not from achieving her ideal self, but from rejecting the idea of perfection.")
        return chandrasTriumph
    }
    // 122
    // 123
    // 124
    // 125 Dreadhorde Arcanist
    // 126
    // 127
    // 128
    // 129
    // 130 Grim Initiate
    // 131
    // 132 Honor the God-Pharaoh
    // 133
    // 134 Invading Manticore
    // 135
    // 136
    static func KrenkoTinStreetKingpin() -> Card {
        let krenko = Card(name: "Krenko, Tin Street Kingpin", rarity: .Rare, set: set, number: 137)
        krenko.setManaCost("2R")
        krenko.setType(.Legendary, .Creature, .Goblin)
        krenko.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: {
                krenko.addCounter(.PlusOnePlusOne)
                let power = krenko.getPower()
                for _ in 0..<power {
                    krenko.getController().createToken(Goblin())
                }
        })
        krenko.setFlavorText("\"After the people flee, but before the enemy arrives--that's grabbin' time.\"")
        krenko.power = 1
        krenko.toughness = 2
        return krenko
    }
    // 138
    static func NahirisStoneblades() -> Card {
        let nahirisStoneblades = Card(name: "Nahiri's Stoneblades", rarity: .Common, set: set, number: 139)
        nahirisStoneblades.setManaCost("1R")
        nahirisStoneblades.setType(.Instant)
        nahirisStoneblades.addEffect(TargetedEffect.MultiObject(
            restrictions: [TargetingRestriction.TargetCreature(optional: true), TargetingRestriction.TargetCreature(optional: true)],
            effect: { targets in
                targets.forEach({ $0?.pump(2, 0) })
            },
            distinctTargets: true))
        nahirisStoneblades.setFlavorText("The ancient Planeswalkers Sorin and Nahiri battled across Ravnica, their blows cutting as deep as the grudge.")
        return nahirisStoneblades
    }
    // 140 Neheb, Dreadhorde Champion
    // 141
    // 142 Samut's Sprint,
    // 143
    // 144
    // 145
    // 146 Tibalt, Rakish Instigator
    static func TibaltsRager() -> Card {
        let tibaltsRager = Card(name: "Tibalt's Rager", rarity: .Uncommon, set: set, number: 147)
        tibaltsRager.setManaCost("1R")
        tibaltsRager.setType(.Creature, .Devil)
        tibaltsRager.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { tibaltsRager.damage(to: $0, 1) }))
        tibaltsRager.addActivatedAbility(
            string: "{1}{R}: ~ gets +2/+0 until end of turn.",
            cost: Cost.Mana("1R"),
            effect: { tibaltsRager.pump(2, 0) })
        tibaltsRager.setFlavorText("\"Find out whose that is. I like its energy.\"\n--Judith")
        tibaltsRager.power = 1
        tibaltsRager.toughness = 2
        return tibaltsRager
    }
    // 148
    // 149
    // 150 Arlinn, Voice of the Pack
    static func ArlinnsWolf() -> Card {
        let arlinnsWolf = Card(name: "Arlinn's Wolf", rarity: .Common, set: set, number: 151)
        arlinnsWolf.setManaCost("2G")
        arlinnsWolf.setType(.Creature, .Wolf)
        arlinnsWolf.blockabilityRequirements.append({ object in
            return object.getPower() > 2
        })
        arlinnsWolf.setFlavorText("If you don't speak wolf, allow me to translate: 'One step closer and I'll rip out your throat.'\"\n--Arlinn Kord")
        arlinnsWolf.power = 3
        arlinnsWolf.toughness = 2
        return arlinnsWolf
    }
    static func AwakeningOfVituGhazi() -> Card {
        let awakeningOfVituGhazi = Card(name: "Awakening of Vitu-Ghazi", rarity: .Rare, set: set, number: 152)
        awakeningOfVituGhazi.setManaCost("3GG")
        awakeningOfVituGhazi.setType(.Instant)
        awakeningOfVituGhazi.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Land) && $0.getController() === awakeningOfVituGhazi.getController() },
                zones: [.Battlefield]),
            effect: { target in
                target.addCounters(.PlusOnePlusOne, 9)
                target.addType(.Legendary)
                target.power = 0
                target.toughness = 0
                target.addType(.Elemental)
                target.addType(.Creature)
                target.haste = true
                target.name = "Vitu-Ghazi"
        }))
        awakeningOfVituGhazi.setFlavorText("The Eternal armies advanced on Vitu-Ghazi. At Nissa's command, Vitu-Ghazi advanced on them.")
        return awakeningOfVituGhazi
    }
    // 153
    // 154
    // 155
    static func CentaurNurturer() -> Card {
        let centaurNurturer = Card(name: "Centaur Nurturer", rarity: .Common, set: set, number: 156)
        centaurNurturer.setManaCost("3G")
        centaurNurturer.setType(.Creature, .Centaur, .Druid)
        centaurNurturer.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { centaurNurturer.getController().gainLife(3) })
        centaurNurturer.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { centaurNurturer.getController().addMana(color: .White) },
            manaAbility: true)
        centaurNurturer.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { centaurNurturer.getController().addMana(color: .Blue) },
            manaAbility: true)
        centaurNurturer.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { centaurNurturer.getController().addMana(color: .Black) },
            manaAbility: true)
        centaurNurturer.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { centaurNurturer.getController().addMana(color: .Red) },
            manaAbility: true)
        centaurNurturer.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { centaurNurturer.getController().addMana(color: .Green) },
            manaAbility: true)
        centaurNurturer.setFlavorText("\"I call upon the vigor of the grasses, the hopes of the flowers, and the dreams of the trees.\"")
        centaurNurturer.power = 2
        centaurNurturer.toughness = 4
        return centaurNurturer
    }
    
    static func GiantGrowth() -> Card {
        let giantGrowth = Card(name: "Giant Growth", rarity: .Common, set: set, number: 162)
        giantGrowth.setManaCost("G")
        giantGrowth.setType(.Instant)
        giantGrowth.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { $0.pump(3, 3) }))
        return giantGrowth
    }
    // 163
    // 164 Jiang Yanggu, Wildcrafter
    // 165
    // 166
    // 167 Mowu, Loyal Companion
    // 168
    // 169
    static func NissasTriumph() -> Card {
        let nissasTriumph = Card(name: "Nissa's Triumph", rarity: .Uncommon, set: set, number: 170)
        nissasTriumph.setManaCost("GG")
        nissasTriumph.setType(.Sorcery)
        nissasTriumph.addEffect({
            let isBasicForest: (Object) -> Bool = { $0.isType(.Basic) && $0.isType(.Forest) }
            let normalRestrictions = [isBasicForest, isBasicForest]
            let isLand: (Object) -> Bool = { $0.isType(.Land) }
            let nissaRestrictions = [isLand, isLand, isLand]
            let hasNissa = !nissasTriumph.getController().getPermanents().filter({ $0.isType(.Nissa) }).isEmpty
            nissasTriumph.getController().chooseCards(
                from: nissasTriumph.getController().getLibrary(),
                restrictions: hasNissa ? nissaRestrictions : normalRestrictions,
                action: { chosen, rest in
                    chosen.forEach({
                        $0.reveal()
                        $0.putIntoHand()
                    })
                    nissasTriumph.getController().shuffleLibrary()
            })
        })
        nissasTriumph.setFlavorText("Her triumph came not from destroying the unnatural, but from fostering life.")
        return nissasTriumph
    }
    static func ParadiseDruid() -> Card {
        let paradiseDruid = Card(name: "Paradise Druid", rarity: .Uncommon, set: set, number: 171)
        paradiseDruid.setManaCost("1G")
        paradiseDruid.setType(.Creature, .Elf, .Druid)
        paradiseDruid.addStaticAbility(
            requirement: AbilityRequirement.This(paradiseDruid),
            effect: { return $0.isTapped ? $0 : $0.withKeyword(.Hexproof) },
            layer: .AbilityAddingOrRemoving)
        paradiseDruid.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { paradiseDruid.getController().addMana(color: .White) },
            manaAbility: true)
        paradiseDruid.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { paradiseDruid.getController().addMana(color: .Blue) },
            manaAbility: true)
        paradiseDruid.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { paradiseDruid.getController().addMana(color: .Black) },
            manaAbility: true)
        paradiseDruid.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { paradiseDruid.getController().addMana(color: .Red) },
            manaAbility: true)
        paradiseDruid.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { paradiseDruid.getController().addMana(color: .Green) },
            manaAbility: true)
        paradiseDruid.setFlavorText("\"There are many kinds of duty, and mine is to see our world grow and endure.\"")
        paradiseDruid.power = 2
        paradiseDruid.toughness = 1
        return paradiseDruid
    }
    
    static func ThunderingCeratok() -> Card {
        let thunderingCeratok = Card(name: "Thundering Ceratok", rarity: .Common, set: set, number: 179)
        thunderingCeratok.setManaCost("4G")
        thunderingCeratok.setType(.Creature, .Rhino)
        thunderingCeratok.trample = true
        thunderingCeratok.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                thunderingCeratok.getController().getCreatures().filter({ $0 != thunderingCeratok }).forEach({ creature in
                    creature.giveKeywordUntilEndOfTurn(.Trample)
                })
        })
        thunderingCeratok.setFlavorText("\"I thought this was a civilized plane. How are there so many feral beasts?\"\n--Dovin Baan")
        thunderingCeratok.power = 4
        thunderingCeratok.toughness = 5
        return thunderingCeratok
    }
    // 180 Vivien, Champion of the Wilds
    // 181 Vivien's Arkbow
    static func ViviensGrizzly() -> Card {
        let viviensGrizzly = Card(name: "Vivien's Grizzly", rarity: .Common, set: set, number: 182)
        viviensGrizzly.setManaCost("2G")
        viviensGrizzly.setType(.Creature, .Bear, .Spirit)
        viviensGrizzly.addActivatedAbility(
            string: "{3}{G}: Look at the top card of your library. If it's a creature or planeswalker card, you may reveal it and put it into your hand. If you don't put the card into your hand, put it on the bottom of your library.",
            cost: Cost.Mana("3G"),
            effect: {
                viviensGrizzly.getController().chooseCard(
                    from: Array(viviensGrizzly.getController().getLibrary().suffix(1)),
                    restriction: { $0.isType(.Creature) || $0.isType(.Planeswalker) },
                    action: { chosen, rest in
                        chosen?.reveal()
                        chosen?.putIntoHand()
                        if !rest.isEmpty {
                            viviensGrizzly.getController().putOnBottomOfLibrary(rest[0])
                        }
                })
        })
        viviensGrizzly.power = 2
        viviensGrizzly.toughness = 3
        return viviensGrizzly
    }
    // 183
    static func AjaniTheGreathearted() -> Card {
        let ajani = Card(name: "Ajani, the Greathearted", rarity: .Rare, set: set, number: 184)
        ajani.setManaCost("2GW")
        ajani.setType(.Legendary, .Planeswalker, .Ajani)
        ajani.addStaticAbility(
            requirement: AbilityRequirement.CreaturesYouControl(source: ajani),
            effect: { return $0.withKeyword(.Vigilance) },
            layer: .AbilityAddingOrRemoving)
        ajani.addActivatedAbility(
            string: "{+1}: You gain 3 life.",
            cost: Cost.AddCounters(.Loyalty, 1),
            effect: { ajani.getController().gainLife(3) },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        ajani.addActivatedAbility(
            string: "{-2}: Put a +1/+1 counter on each creature you control and a loyalty counter on each other planeswalker you control.",
            cost: Cost.RemoveCounters(.Loyalty, 2),
            effect: {
                ajani.getController().getPermanents().filter({ $0.isType(.Creature) }).forEach({ $0.addCounter(.PlusOnePlusOne )})
                ajani.getController().getPermanents().filter({ $0.isType(.Planeswalker) && $0 != ajani }).forEach({ $0.addCounter(.Loyalty) })
            },
            manaAbility: false,
            sorcerySpeed: true,
            loyaltyAbility: true)
        ajani.startingLoyalty = 5
        return ajani
    }
    // 185 Angrath's Rampage
    // 186
    // 187
    // 188 Cruel Celebrant
    static func Deathsprout() -> Card {
        let deathsprout = Card(name: "Deathsprout", rarity: .Uncommon, set: set, number: 189)
        deathsprout.setManaCost("1BBG")
        deathsprout.setType(.Instant)
        deathsprout.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetCreature(),
            effect: { target in
                _ = target.destroy()
                deathsprout.getController().chooseCard(
                    from: deathsprout.getController().getLibrary(),
                    restriction: { $0.isBasicLand() },
                    action: { chosen, rest in
                        chosen?.putOntoBattlefield(tapped: true)
                        deathsprout.getController().shuffleLibrary()
                    })
        }))
        deathsprout.setFlavorText("\"They say nothing lasts forever. I say everything lasts forever, just not in the form you may be accustomed to.\"\n--Vraska")
        return deathsprout
    }
    // 190
    // 191
    static func DomrisAmbush() -> Card {
        let domrisAmbush = Card(name: "Domri's Ambush", rarity: .Uncommon, set: set, number: 192)
        domrisAmbush.setManaCost("RG")
        domrisAmbush.setType(.Sorcery)
        domrisAmbush.addEffect(TargetedEffect.MultiObject(
            restrictions: [
                TargetingRestriction.SingleObject(
                    restriction: { $0.isType(.Creature) && $0.getController() === domrisAmbush.getController() },
                    zones: [.Battlefield]),
                TargetingRestriction.SingleObject(
                    restriction: { ($0.isType(.Creature) || $0.isType(.Planeswalker)) && $0.getController() !== domrisAmbush.getController() },
                    zones: [.Battlefield])
            ],
            effect: { targets in
                if let myCreature = targets[0], let theirCreatureOrPlaneswalker = targets[1] {
                    myCreature.damage(to: theirCreatureOrPlaneswalker, myCreature.getPower())
                }
            }))
        domrisAmbush.setFlavorText("\"When civilization teeters on the brink, I'll be there to kick it the rest of the way.\"")
        return domrisAmbush
    }
    static func DovinsVeto() -> Card {
        let dovinsVeto = Card(name: "Dovin's Veto", rarity: .Rare, set: set, number: 193)
        dovinsVeto.setManaCost("WU")
        dovinsVeto.setType(.Instant)
        dovinsVeto.uncounterable = true
        dovinsVeto.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetNonCreatureSpell(),
            effect: { $0.counter() }
        ))
        dovinsVeto.setFlavorText("\"I see you've learned nothing, Chandra. You'd still put a match to something rather than understand it.\"")
        return dovinsVeto
    }
    // 194 Dreadhorde Butcher
    // 195
    // 196
    // 197
    // 198 Gleaming Overseer
    // 199
    // 200
    // 201 Invade the City
    static func LeylineProwler() -> Card {
        let leylineProwler = Card(name: "Leyline Prowler", rarity: .Uncommon, set: set, number: 202)
        leylineProwler.setManaCost("1BG")
        leylineProwler.setType(.Creature, .Nightmare, .Beast)
        leylineProwler.deathtouch = true
        leylineProwler.lifelink = true
        leylineProwler.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { leylineProwler.getController().addMana(color: .White) },
            manaAbility: true)
        leylineProwler.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { leylineProwler.getController().addMana(color: .Blue) },
            manaAbility: true)
        leylineProwler.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost.Tap(),
            effect: { leylineProwler.getController().addMana(color: .Black) },
            manaAbility: true)
        leylineProwler.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost.Tap(),
            effect: { leylineProwler.getController().addMana(color: .Red) },
            manaAbility: true)
        leylineProwler.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost.Tap(),
            effect: { leylineProwler.getController().addMana(color: .Green) },
            manaAbility: true)
        leylineProwler.setFlavorText("It feeds on the dark energies that course through the deep world--and on any other creature lured by the leyline's pull.")
        leylineProwler.power = 2
        leylineProwler.toughness = 3
        return leylineProwler
    }
    // 203
    // 204
    // 205
    // 206
    // 207
    // 208
    // 209
    static func PledgeOfUnity() -> Card {
        let pledgeOfUnity = Card(name: "Pledge of Unity", rarity: .Uncommon, set: set, number: 210)
        pledgeOfUnity.setManaCost("1GW")
        pledgeOfUnity.setType(.Instant)
        pledgeOfUnity.addEffect({
            pledgeOfUnity.getController().getCreatures().forEach({ $0.addCounter(.PlusOnePlusOne ) })
            let numCreatures = pledgeOfUnity.getController().getCreatures().count
            pledgeOfUnity.getController().gainLife(numCreatures)
        })
        pledgeOfUnity.setFlavorText("\"No one hero will save this day. Today we must all be heroes.\"\n--Gideon Jura")
        return pledgeOfUnity
    }
    // 211
    // 212
    // 213
    // 214
    // 215
    static func SolarBlaze() -> Card {
        let solarBlaze = Card(name: "Solar Blaze", rarity: .Rare, set: set, number: 216)
        solarBlaze.setManaCost("2RW")
        solarBlaze.setType(.Sorcery)
        solarBlaze.addEffect({
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach({ creature in
                    creature.damage(to: creature, creature.getPower())
                })
            })
        })
        solarBlaze.setFlavorText("\"The primary weapon is nothing more than light. It shows them what they are, and they burn of their own accord.\"\n--Aurelia")
        return solarBlaze
    }
    
    static func Goblin() -> Token {
        let goblin = Token(name: "Goblin", set: set, number: 0 /* TODO */)
        // TODO: Image
        goblin.colors = [.Red]
        goblin.setType(.Creature, .Goblin)
        goblin.power = 1
        goblin.toughness = 1
        return goblin
    }
}
