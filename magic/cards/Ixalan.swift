import Foundation

enum XLN {
    static var set = "xln"
    static var count = 279
    
    static func AdantoVanguard() -> Card {
        let adantoVanguard = Card(name: "Adanto Vanguard", rarity: .Uncommon, set: set, number: 1)
        adantoVanguard.setManaCost("1W")
        adantoVanguard.setType(.Creature, .Vampire, .Soldier)
        adantoVanguard.addStaticAbility({ object in
            if object.id == adantoVanguard.id && object.attacking {
                object.power = object.getBasePower() + 2
            }
            return object
        })
        adantoVanguard.addActivatedAbility(
            string: "Pay 4 life: ~ gains indestructible until end of turn.",
            cost: Cost("", tap: false, life: 4),
            effect: { adantoVanguard.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in object.indestructible = true; return object }))})
        adantoVanguard.power = 1
        adantoVanguard.toughness = 1
        return adantoVanguard
    }
    // 2 Ashes of the Abhorrent
    // 3 Axis of Mortality
    // 4 Bellowing Aegisaur
    // 5 Bishop of Rebirth
    static func BishopsSoldier() -> Card {
        let bishopsSoldier = Card(name: "Bishop's Soldier", rarity: .Common, set: set, number: 6)
        bishopsSoldier.setManaCost("1W")
        bishopsSoldier.setType(.Creature, .Vampire, .Soldier)
        bishopsSoldier.lifelink = true
        bishopsSoldier.setFlavorText("Vampires, the noble class of old Torrezon, are guided by their dual loyalties to church and crown.")
        bishopsSoldier.power = 2
        bishopsSoldier.toughness = 2
        return bishopsSoldier
    }
    static func BrightReprisal() -> Card {
        let brightReprisal = Card(name: "Bright Reprisal", rarity: .Uncommon, set: set, number: 7)
        brightReprisal.setManaCost("4W")
        brightReprisal.setType(.Instant)
        brightReprisal.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && $0.attacking },
            effect: { target in
                let _ = target.destroy()
                brightReprisal.getController().drawCard()
            }))
        brightReprisal.setFlavorText("Vampires know blood and the systems that carry it. And they know exactly where to strike to set it free.")
        return brightReprisal
    }
    static func Demystify() -> Card {
        let demystify = Card(name: "Demystify", rarity: .Common, set: set, number: 8)
        demystify.setManaCost("W")
        demystify.setType(.Instant)
        demystify.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Enchantment) },
            effect: { target in let _ = target.destroy() }))
        demystify.setFlavorText("\"The River Heralds carve spells into jade, hoping to steer us from our course. But what right do they have to keep us from that which once was ours?\"")
        return demystify
    }
    static func DuskborneSkymarcher() -> Card {
        let duskborneSkymarcher = Card(name: "Duskborne Skymarcher", rarity: .Uncommon, set: set, number: 9)
        duskborneSkymarcher.setManaCost("W")
        duskborneSkymarcher.setType(.Creature, .Vampire, .Cleric)
        duskborneSkymarcher.flying = true
        duskborneSkymarcher.addActivatedAbility(
            string: "{W}, {T}: Target attacking Vampire gets +1/+1 until end of turn.",
            cost: Cost("W", tap: true),
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Creature) && $0.isType(.Vampire) && $0.attacking },
                effect: { $0.pump(1, 1) }))
        duskborneSkymarcher.setFlavorText("\"The hour of Dusk is come.\"")
        duskborneSkymarcher.power = 1
        duskborneSkymarcher.toughness = 1
        return duskborneSkymarcher
    }
    // 10 Emissary of Sunrise
    // 11 Encampment Keeper
    static func GlorifierOfDusk() -> Card {
        let glorifierOfDusk = Card(name: "Glorifier of Dusk", rarity: .Uncommon, set: set, number: 12)
        glorifierOfDusk.setManaCost("3WW")
        glorifierOfDusk.setType(.Creature, .Vampire, .Soldier)
        glorifierOfDusk.addActivatedAbility(
            string: "Pay 2 life: ~ gains flying until end of turn.",
            cost: Cost("", tap: false, life: 2),
            effect: { glorifierOfDusk.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.flying = true; return $0 }))})
        glorifierOfDusk.addActivatedAbility(
            string: "Pay 2 life: ~ gains vigilance until end of turn.",
            cost: Cost("", tap: false, life: 2),
            effect: { glorifierOfDusk.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.vigilance = true; return $0 }))})
        glorifierOfDusk.setFlavorText("\"The blood of the enemy is a sacrament. The strength it gives is proof that our cause is just.\"")
        glorifierOfDusk.power = 4
        glorifierOfDusk.toughness = 4
        return glorifierOfDusk
    }
    // 13 Goring Ceratops
    static func ImperialAerosaur() -> Card {
        let imperialAerosaur = Card(name: "Imperial Aerosaur", rarity: .Uncommon, set: set, number: 14)
        imperialAerosaur.setManaCost("3W")
        imperialAerosaur.setType(.Creature, .Dinosaur)
        imperialAerosaur.flying = true
        imperialAerosaur.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Creature) && $0.id != imperialAerosaur.id },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    // TODO: These should be different, because they are applied in different layers
                    object.power = object.getBasePower() + 1
                    object.toughness = object.getBaseToughness() + 1
                    object.flying = true
                    return object
                }))
        }))
        imperialAerosaur.setFlavorText("Its assistance is unnervingly similar to its hunting technique.")
        imperialAerosaur.power = 3
        imperialAerosaur.toughness = 3
        return imperialAerosaur
    }
    // 15 Imperial Lancer
    static func InspiringCleric() -> Card {
        let inspiringCleric = Card(name: "Inspiring Cleric", rarity: .Uncommon, set: set, number: 16)
        inspiringCleric.setManaCost("2W")
        inspiringCleric.setType(.Creature, .Vampire, .Cleric)
        inspiringCleric.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { inspiringCleric.getController().gainLife(4) })
        inspiringCleric.setFlavorText("\"The Immortal Sun will bring us true eternal life to replace the everlasting shadow of undeath.\"")
        inspiringCleric.power = 3
        inspiringCleric.toughness = 2
        return inspiringCleric
    }
    // 17 Ixalan's Binding
    // 18 Kinjalli's Caller
    static func KinallisSunwing() -> Card {
        let kinjallisSunwing = Card(name: "Kinjalli's Sunwing", rarity: .Rare, set: set, number: 19)
        kinjallisSunwing.setManaCost("2W")
        kinjallisSunwing.setType(.Creature, .Dinosaur)
        kinjallisSunwing.flying = true
        kinjallisSunwing.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() !== kinjallisSunwing.getController() {
                object.entersTapped = true
            }
            return object
        })
        kinjallisSunwing.setFlavorText("\"There are moments when I feel I could fly like the sunwing. Far away I would soar, but always a golden gale pushes me back.\"\n--Huatli")
        kinjallisSunwing.power = 2
        kinjallisSunwing.toughness = 3
        return kinjallisSunwing
    }
    // 20 Legion Conquistador
    static func LegionsJudgment() -> Card {
        let legionsJudgment = Card(name: "Legion's Judgment", rarity: .Common, set: set, number: 21)
        legionsJudgment.setManaCost("2W")
        legionsJudgment.setType(.Sorcery)
        legionsJudgment.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && $0.getToughness() >= 4 },
            effect: { target in let _ = target.destroy() }))
        legionsJudgment.setFlavorText("\"My lance was once wielded by Venerable Tarrian. In his name and by his might, I cast you down!\"")
        return legionsJudgment
    }
    // 22 Legion's Landing // Adanto the First Fort
    static func LoomingAltisaur() -> Card {
        let loomingAltisaur = Card(name: "Looming Altisaur", rarity: .Common, set: set, number: 23)
        loomingAltisaur.setManaCost("3W")
        loomingAltisaur.setType(.Creature, .Dinosaur)
        loomingAltisaur.setFlavorText("Nature can't be tamed, but the Sun Empire believes that humans are made stronger when they test themselves against the wild strength of the dinosaurs.")
        loomingAltisaur.power = 1
        loomingAltisaur.toughness = 7
        return loomingAltisaur
    }
    // 24 Mavren Fein, Dusk Apostle
    static func PaladinOfTheBloodstained() -> Card {
        let paladinOfTheBloodstained = Card(name: "Paladin of the Bloodstained", rarity: .Common, set: set, number: 25)
        paladinOfTheBloodstained.setManaCost("3W")
        paladinOfTheBloodstained.setType(.Creature, .Vampire, .Knight)
        paladinOfTheBloodstained.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { paladinOfTheBloodstained.getController().createToken(Vampire()) })
        paladinOfTheBloodstained.setFlavorText("Closely linked to the Church of Dusk, the paladins of the Bloodstained order are devout to the point of fanaticism.")
        paladinOfTheBloodstained.power = 3
        paladinOfTheBloodstained.toughness = 2
        return paladinOfTheBloodstained
    }
    // 26 Pious Interdiction
    // 27 Priest of the Wakening Sun
    static func PterodonKnight() -> Card {
        let pterodonKnight = Card(name: "Pterodon Knight", rarity: .Common, set: set, number: 28)
        pterodonKnight.setManaCost("3W")
        pterodonKnight.setType(.Creature, .Human, .Knight)
        pterodonKnight.addStaticAbility({ object in
            if object.id == pterodonKnight.id && !object.getController().getPermanents().filter({ return $0.isType(.Dinosaur) }).isEmpty {
                object.flying = true
            }
            return object
        })
        pterodonKnight.setFlavorText("\"To rise like the sun--there is no greater feeling.\"")
        pterodonKnight.power = 3
        pterodonKnight.toughness = 3
        return pterodonKnight
    }
    static func QueensCommission() -> Card {
        let queensCommission = Card(name: "Queen's Commission", rarity: .Common, set: set, number: 29)
        queensCommission.setManaCost("2W")
        queensCommission.setType(.Sorcery)
        queensCommission.addEffect({
            queensCommission.getController().createToken(Vampire())
            queensCommission.getController().createToken(Vampire())
        })
        queensCommission.setFlavorText("\"Let the blood of the impure flow through you. Only the blessings of the golden city will purge its acrid taste from your mouth.\"\n--High Marshal Arguel")
        return queensCommission
    }
    static func RallyingRoar() -> Card {
        let rallyingRoar = Card(name: "Rallying Roar", rarity: .Uncommon, set: set, number: 30)
        rallyingRoar.setManaCost("2W")
        rallyingRoar.setType(.Instant)
        rallyingRoar.addEffect({
            rallyingRoar.getController().getCreatures().forEach({ creature in
                creature.pump(1, 1)
                creature.untap()
            })
        })
        rallyingRoar.setFlavorText("\"The sun's strength sings in our hearts! I have never been more proud of my home and my people.\"\n--Huatli")
        return rallyingRoar
    }
    static func RaptorCompanion() -> Card {
        let raptorCompanion = Card(name: "Raptor Companion", rarity: .Common, set: set, number: 31)
        raptorCompanion.setManaCost("1W")
        raptorCompanion.setType(.Creature, .Dinosaur)
        raptorCompanion.setFlavorText("A raptor will follow any order as long as that order is \"hunt,\" \"kill,\" or \"go for the guts.\"")
        raptorCompanion.power = 3
        raptorCompanion.toughness = 1
        return raptorCompanion
    }
    static func RitualOfRejuvenation() -> Card {
        let ritualOfRejuvenation = Card(name: "Ritual of Rejuvenation", rarity: .Common, set: set, number: 32)
        ritualOfRejuvenation.setManaCost("2W")
        ritualOfRejuvenation.setType(.Instant)
        ritualOfRejuvenation.addEffect({
            ritualOfRejuvenation.getController().gainLife(4)
            ritualOfRejuvenation.getController().drawCard()
        })
        ritualOfRejuvenation.setFlavorText("\"Nothing is more sacred than the gift of blood. Blessed are the vein that empties and the heart that is renewed.")
        return ritualOfRejuvenation
    }
    // 33 Sanguine Sacrament
    // 34 Settle the Wreckage
    // 35 Sheltering Light
    static func ShiningAerosaur() -> Card {
        let shiningAerosaur = Card(name: "Shining Aerosaur", rarity: .Common, set: set, number: 36)
        shiningAerosaur.setManaCost("4W")
        shiningAerosaur.setType(.Creature, .Dinosaur)
        shiningAerosaur.flying = true
        shiningAerosaur.setFlavorText("\"The invaders cloak themselves in the shadows of dusk. Aerosaurs hide in the brilliance of the noonday sun.\"]n--Caparocti Sunborn")
        shiningAerosaur.power = 3
        shiningAerosaur.toughness = 4
        return shiningAerosaur
    }
    static func SkybladeOfTheLegion() -> Card {
        let skybladeOfTheLegion = Card(name: "Skyblade of the Legion", rarity: .Common, set: set, number: 37)
        skybladeOfTheLegion.setManaCost("1W")
        skybladeOfTheLegion.setType(.Creature, .Vampire, .Soldier)
        skybladeOfTheLegion.flying = true
        skybladeOfTheLegion.setFlavorText("Vampires call the gift of flight \"exultation.\" For their enemies, it brings only sorrow.")
        skybladeOfTheLegion.power = 1
        skybladeOfTheLegion.toughness = 3
        return skybladeOfTheLegion
    }
    static func SlashOfTalons() -> Card {
        let slashOfTalons = Card(name: "Slash of Talons", rarity: .Common, set: set, number: 38)
        slashOfTalons.setManaCost("W")
        slashOfTalons.setType(.Instant)
        slashOfTalons.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && ($0.attacking || $0.blocking) },
            effect: { target in slashOfTalons.damage(to: target, 2) }))
        slashOfTalons.setFlavorText("\"The amber sun smokes with fury, gazing on foes that gather like ants invading our home. We are ready! Blade and claw strike as one.\"\n--Huatli")
        return slashOfTalons
    }
    static func SteadfastArmasaur() -> Card {
        let steadfastArmasaur = Card(name: "Steadfast Armasaur", rarity: .Uncommon, set: set, number: 39)
        steadfastArmasaur.setManaCost("3W")
        steadfastArmasaur.setType(.Creature, .Dinosaur)
        steadfastArmasaur.vigilance = true
        steadfastArmasaur.addActivatedAbility(
            string: "{1}{W}, {T}: ~ deals damage equal to its power to target creature blocking or blocked by it.",
            cost: Cost("1W", tap: true),
            effect: TargetedEffect.SingleObject(
                restriction: { target in return target.isType(.Creature) && steadfastArmasaur.blockers.contains(where: { $0.id == target.id }) || steadfastArmasaur.attackers.contains(where: { $0.id == target.id }) },
                effect: { steadfastArmasaur.damage(to: $0, steadfastArmasaur.getPower()) }))
        steadfastArmasaur.setFlavorText("\"Like the mighty armasaur, we will defend against all who invade our shores.\"\n--Itzama the Crested")
        steadfastArmasaur.power = 2
        steadfastArmasaur.toughness = 3
        return steadfastArmasaur
    }
    // 40 Sunrise Seeker
    static func TerritorialHammerskull() -> Card {
        let territorialHammerskull = Card(name: "Territorial Hammerskull", rarity: .Common, set: set, number: 41)
        territorialHammerskull.setManaCost("2W")
        territorialHammerskull.setType(.Creature, .Dinosaur)
        territorialHammerskull.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Creature) && $0.getController() !== territorialHammerskull.getController() },
                effect: { target in target.tap() }))
        territorialHammerskull.setFlavorText("From the eyes up, it's solid bone and stubbornness.")
        territorialHammerskull.power = 2
        territorialHammerskull.toughness = 3
        return territorialHammerskull
    }
    // 42 Tocatli Honor Guard
    // 43 Vampire's Zeal
    // 44 Wakening Sun's Avatar
    static func AirElemental() -> Card {
        let airElemental = Card(name: "Air Elemental", rarity: .Uncommon, set: set, number: 45)
        airElemental.setManaCost("3UU")
        airElemental.setType(.Creature, .Elemental)
        airElemental.flying = true
        airElemental.setFlavorText("As the ship approached, the jade totem rose high overhead. Power rippled. Eyes of stone glowed and crackled. Out hissed a breath of the world, and a windstorm came alive.")
        airElemental.power = 4
        airElemental.toughness = 3
        return airElemental
    }
    // 46 Arcane Adaptation
    // 47 Cancel
    // 48 Chart a Course
    // 49 Daring Saboteur
    // 50 Deadeye Quartermaster
    // 51 Deeproot Waters
    static func DepthsOfDesire() -> Card {
        let depthsOfDesire = Card(name: "Depths of Desire", rarity: .Common, set: set, number: 52)
        depthsOfDesire.setManaCost("2U")
        depthsOfDesire.setType(.Instant)
        depthsOfDesire.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                target.bounce()
                depthsOfDesire.getController().createToken(Treasure())
        }))
        depthsOfDesire.setFlavorText("Pockets full of gold, lungs full of brine.")
        return depthsOfDesire
    }
    // 53 Dive Down
    // 54 Dreamcaller Siren
    // 55 Entrancing Melody
    static func FavorableWinds() -> Card {
        let favorableWinds = Card(name: "Favorable Winds", rarity: .Uncommon, set: set, number: 56)
        favorableWinds.setManaCost("1U")
        favorableWinds.setType(.Enchantment)
        favorableWinds.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() === favorableWinds.getController() && object.getBaseFlying() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        favorableWinds.setFlavorText("\"Like ribbons of wind and wisdom the coatls fly, twisting mystery into truth, shaping the clouds to suit their inscrutible will.\"\n--Huatli")
        return favorableWinds
    }
    static func FleetSwallower() -> Card {
        let fleetSwallower = Card(name: "Fleet Swallower", rarity: .Rare, set: set, number: 57)
        fleetSwallower.setManaCost("5UU")
        fleetSwallower.setType(.Creature, .Fish)
        fleetSwallower.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SinglePlayer(
                restriction: TargetedEffect.AnyPlayer,
                effect: { target in
                    let millCount = Int(ceil(Double(target.getLibrary().count) / 2.0))
                    target.mill(millCount)
            }))
        fleetSwallower.setFlavorText("\"Captain, I think that island is following us.\"")
        fleetSwallower.power = 6
        fleetSwallower.toughness = 6
        return fleetSwallower
    }
    static func HeadwaterSentries() -> Card {
        let headwaterSentries = Card(name: "Headwater Sentries", rarity: .Common, set: set, number: 58)
        headwaterSentries.setManaCost("3U")
        headwaterSentries.setType(.Creature, .Merfolk, .Warrior)
        headwaterSentries.setFlavorText("\"The elders say that if the intruders discovered the secret of the golden city, it would mean an end to our people.\"")
        headwaterSentries.power = 2
        headwaterSentries.toughness = 5
        return headwaterSentries
    }
    static func HeraldOfSecretStreams() -> Card {
        let heraldOfSecretStreams = Card(name: "Herald of Secret Streams", rarity: .Rare, set: set, number: 59)
        heraldOfSecretStreams.setManaCost("3U")
        heraldOfSecretStreams.setType(.Creature, .Merfolk, .Warrior)
        heraldOfSecretStreams.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() === heraldOfSecretStreams.getController() && object.hasCounter(.PlusOnePlusOne) {
                object.unblockable = true
            }
            return object
        })
        heraldOfSecretStreams.setFlavorText("\"You might as well try to stop the waterfall.\"")
        heraldOfSecretStreams.power = 2
        heraldOfSecretStreams.toughness = 3
        return heraldOfSecretStreams
    }
    // 60 Jace, Cunning Castaway
    // 61 Kopala, Warden of Waves
    // 62 Lookout's Dispersal
    // 63 Navigator's Ruin
    // 64 One With the Wind
    // 65 Opt
    static func OverflowingInsight() -> Card {
        let overflowingInsight = Card(name: "Overflowing Insight", rarity: .Mythic, set: set, number: 66)
        overflowingInsight.setManaCost("4UUU")
        overflowingInsight.setType(.Sorcery)
        overflowingInsight.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetedEffect.AnyPlayer,
            effect: { $0.drawCards(7) }
        ))
        overflowingInsight.setFlavorText("The truth came to Kumena like the Great River's torrent: the only way to keep his enemies away from the hidden city was to claim its power for himself.")
        return overflowingInsight
    }
    // 67 Perilous Voyage
    static func PiratesPrize() -> Card {
        let piratesPrize = Card(name: "Pirate's Prize", rarity: .Common, set: set, number: 68)
        piratesPrize.setManaCost("3U")
        piratesPrize.setType(.Sorcery)
        piratesPrize.addEffect({
            piratesPrize.getController().drawCards(2)
            piratesPrize.getController().createToken(Treasure())
        })
        piratesPrize.setFlavorText("Nothing warms the heart like plunder.")
        return piratesPrize
    }
    static func ProsperousPirates() -> Card {
        let prosperousPirates = Card(name: "Prosperous Pirates", rarity: .Common, set: set, number: 69)
        prosperousPirates.setManaCost("4U")
        prosperousPirates.setType(.Creature, .Human, .Pirate)
        prosperousPirates.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { prosperousPirates.getController().createToken(Treasure()) })
        prosperousPirates.setFlavorText("The floating city of High and Dry hasn't yet sunk under the weight of gold, but it's not for want of trying.")
        prosperousPirates.power = 3
        prosperousPirates.toughness = 4
        return prosperousPirates
    }
    // 70 River Sneak
    static func RiversRebuke() -> Card {
        let riversRebuke = Card(name: "River's Rebuke", rarity: .Rare, set: set, number: 71)
        riversRebuke.setManaCost("4UU")
        riversRebuke.setType(.Sorcery)
        riversRebuke.addEffect(TargetedEffect.SinglePlayer(
            restriction: TargetedEffect.AnyPlayer,
            effect: { $0.getPermanents().filter({ return !$0.isType(.Land) }).forEach({ $0.bounce() }) }
        ))
        riversRebuke.setFlavorText("Carefully following the thaumatic compass Bolas had given her, Vraska blundered straight into the River Heralds' trap.")
        return riversRebuke
    }
    // 72 Run Aground
    static func SailorOfMeans() -> Card {
        let sailorOfMeans = Card(name: "Sailor of Means", rarity: .Common, set: set, number: 73)
        sailorOfMeans.setManaCost("2U")
        sailorOfMeans.setType(.Creature, .Human, .Pirate)
        sailorOfMeans.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { sailorOfMeans.getController().createToken(Treasure()) })
        sailorOfMeans.setFlavorText("In the Brazen Coalition, the wheels of business are greased with plunder.")
        sailorOfMeans.power = 1
        sailorOfMeans.toughness = 4
        return sailorOfMeans
    }
    // 74 Search for Azcanta // Azcanta, the Sunken Ruin
    static func ShaperApprentice() -> Card {
        let shaperApprentice = Card(name: "Shaper Apprentice", rarity: .Common, set: set, number: 75)
        shaperApprentice.setManaCost("1U")
        shaperApprentice.setType(.Creature, .Merfolk, .Wizard)
        shaperApprentice.addStaticAbility({ object in
            if object.id == shaperApprentice.id && !object.getController().getPermanents().filter({ return $0.id != object.id && $0.isType(.Merfolk) }).isEmpty {
                object.flying = true
            }
            return object
        })
        shaperApprentice.setFlavorText("The River Heralds would wreck a thousand ships to keep intruders from finding the golden city.")
        shaperApprentice.power = 2
        shaperApprentice.toughness = 1
        return shaperApprentice
    }
    // 76 Shipwreck Looter
    static func ShoreKeeper() -> Card {
        let shoreKeeper = Card(name: "Shore Keeper", rarity: .Common, set: set, number: 77)
        shoreKeeper.setManaCost("U")
        shoreKeeper.setType(.Creature, .Trilobite)
        shoreKeeper.addActivatedAbility(
            string: "{7}{U}, {T}, Sacrifice ~: Draw three cards.",
            cost: Cost("7U", tap: true, life: 0, sacrificeSelf: true),
            effect: { shoreKeeper.getController().drawCards(3) })
        shoreKeeper.setFlavorText("Over their long life spans, the larger trilobites accumulate vast treasure troves in their guts.")
        shoreKeeper.power = 0
        shoreKeeper.toughness = 3
        return shoreKeeper
    }
    // 78 Siren Lookout
    // 79 Siren Stormtamer
    // 80 Siren's Ruse
    // 81 Spell Pierce
    // 82 Spell Swindle
    // 83 Storm Fleet Aerialist
    // 84 Storm Fleet Spy
    static func StormSculptor() -> Card {
        let stormSculptor = Card(name: "Storm Sculptor", rarity: .Common, set: set, number: 85)
        stormSculptor.setManaCost("3U")
        stormSculptor.setType(.Creature, .Merfolk, .Wizard)
        stormSculptor.unblockable = true
        stormSculptor.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getController() === stormSculptor.getController() },
                effect: { $0.bounce() }))
        stormSculptor.setFlavorText("In his hands, the wind can become a weapon or a means of escape.")
        stormSculptor.power = 3
        stormSculptor.toughness = 2
        return stormSculptor
    }
    static func TempestCaller() -> Card {
        let tempestCaller = Card(name: "Tempest Caller", rarity: .Uncommon, set: set, number: 86)
        tempestCaller.setManaCost("2UU")
        tempestCaller.setType(.Creature, .Merfolk, .Wizard)
        tempestCaller.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: { $0 !== tempestCaller.getController() },
                effect: { $0.getCreatures().forEach({ $0.tap() })}
        ))
        tempestCaller.setFlavorText("\"I <i>am</i> the storm.\"")
        tempestCaller.power = 2
        tempestCaller.toughness = 2
        return tempestCaller
    }
    // 87 Watertrap Weaver
    static func WindStrider() -> Card {
        let windStrider = Card(name: "Wind Strider", rarity: .Common, set: set, number: 88)
        windStrider.setManaCost("4U")
        windStrider.setType(.Creature, .Merfolk, .Wizard)
        windStrider.flash = true
        windStrider.flying = true
        windStrider.setFlavorText("\"Currents are currents, whether in sea or sky.\"")
        windStrider.power = 3
        windStrider.toughness = 3
        return windStrider
    }
    // 89 Anointed Deacon
    // 90 Arguel's Blood Fast // Temple of Aclazotz
    static func BishopOfTheBloodstained() -> Card {
        let bishopOfTheBloodstained = Card(name: "Bishop of the Bloodstained", rarity: .Uncommon, set: set, number: 91)
        bishopOfTheBloodstained.setManaCost("3BB")
        bishopOfTheBloodstained.setType(.Creature, .Vampire, .Cleric)
        bishopOfTheBloodstained.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: { return $0 !== bishopOfTheBloodstained.getController() },
                effect: { target in
                    let numVampires = bishopOfTheBloodstained.getController().getPermanents().filter({ $0.isType(.Vampire) }).count
                    target.loseLife(numVampires)
            }
        ))
        bishopOfTheBloodstained.setFlavorText("\"They shall give us all they have as penance for their resistance. Their ships. Their goods. Their rebellious blood.\"")
        bishopOfTheBloodstained.power = 3
        bishopOfTheBloodstained.toughness = 3
        return bishopOfTheBloodstained
    }
    static func BlightKeeper() -> Card {
        let blightKeeper = Card(name: "Blight Keeper", rarity: .Common, set: set, number: 92)
        blightKeeper.setManaCost("B")
        blightKeeper.setType(.Creature, .Bat, .Imp)
        blightKeeper.flying = true
        blightKeeper.addActivatedAbility(
            string: "{7}{B}, {T}, Sacrifice ~: Target opponent loses 4 life and you gain 4 life.",
            cost: Cost("7B", tap: true, life: 0, sacrificeSelf: true),
            effect: TargetedEffect.SinglePlayer(
                restriction: { $0 !== blightKeeper.getController() },
                effect: { target in
                    target.loseLife(4)
                    blightKeeper.getController().gainLife(4)
        }))
        blightKeeper.setFlavorText("It withers fruit and flesh alike.")
        blightKeeper.power = 1
        blightKeeper.toughness = 1
        return blightKeeper
    }
    // 93 Bloodcrazed Paladin
    // 94 Boneyard Parley
    static func ContractKilling() -> Card {
        let contractKilling = Card(name: "Contract Killing", rarity: .Common, set: set, number: 95)
        contractKilling.setManaCost("3BB")
        contractKilling.setType(.Sorcery)
        contractKilling.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                let _ = target.destroy()
                contractKilling.getController().createToken(Treasure())
                contractKilling.getController().createToken(Treasure())
        }))
        contractKilling.setFlavorText("For a price, the floating city of High and Dry offers all the amenities a pirate could want: rest, recreation, and revenge.")
        return contractKilling
    }
    // 96 Costly Plunder
    static func DarkNourishment() -> Card {
        let darkNourishment = Card(name: "Dark Nourishment", rarity: .Uncommon, set: set, number: 97)
        darkNourishment.setManaCost("4B")
        darkNourishment.setType(.Instant)
        darkNourishment.addEffect(TargetedEffect(
            restriction: TargetedEffect.AnyTarget,
            effect: { target in
                darkNourishment.damage(to: target, 3)
                darkNourishment.getController().gainLife(3)
        }))
        darkNourishment.setFlavorText("Demons lurk in the shadows of ancient ruines, spreading plague and corruption across the land.")
        return darkNourishment
    }
    // 98 Deadeye Tormenter
    // 99 Deadeye Tracker
    // 100 Deathless Ancient
    // 101 Desperate Castaways
    static func DireFleetHoarder() -> Card {
        let direFleetHoarder = Card(name: "Dire Fleet Hoarder", rarity: .Common, set: set, number: 102)
        direFleetHoarder.setManaCost("1B")
        direFleetHoarder.setType(.Creature, .Human, .Pirate)
        direFleetHoarder.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { direFleetHoarder.getController().createToken(Treasure()) })
        direFleetHoarder.setFlavorText("Among the pirates of the Brazen Coalition, the only thing more dangerous than failure is success.")
        direFleetHoarder.power = 2
        direFleetHoarder.toughness = 1
        return direFleetHoarder
    }
    // 103 Dire Fleet Interloper
    // 104 Dire Fleet Ravager
    // 105 Duress
    // 106 Fathom Fleet Captain
    // 107 Fathom Fleet Cutthroat
    // 108 Grim Captain's Call
    // 109 Heartless Pillage
    // 110 Kitesail Freebooter
    // 111 Lurking Chupacabra
    // 112 March of the Drowned
    // 113 Mark of the Vampire
    // 114 Queen's Agent
    static func QueensBaySoldier() -> Card {
        let queensBaySoldier = Card(name: "Queen's Bay Soldier", rarity: .Common, set: set, number: 115)
        queensBaySoldier.setManaCost("1B")
        queensBaySoldier.setType(.Creature, .Vampire, .Soldier)
        queensBaySoldier.setFlavorText("The soldiers of the Legion of Dusk have come to the colonies at Queen's Bay in search of glory and riches. They are veterans of centuries of warfare, and they thirst for conquest.")
        queensBaySoldier.power = 2
        queensBaySoldier.toughness = 2
        return queensBaySoldier
    }
    // 116 Raiders' Wake
    // 117 Revel in Riches
    // 118 Ruin Raider
    // 119 Ruthless Knave
    // 120 Sanctum Seeker
    // 121 Seekers' Squire
    static func SkitteringHeartstopper() -> Card {
        let skitteringHeartstopper = Card(name: "Skittering Heartstopper", rarity: .Common, set: set, number: 122)
        skitteringHeartstopper.setManaCost("B")
        skitteringHeartstopper.setType(.Creature, .Insect)
        skitteringHeartstopper.addActivatedAbility(
            string: "{B}: ~ gains deathtouch until end of turn.",
            cost: Cost("B"),
            effect: { skitteringHeartstopper.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.deathtouch = true; return $0 }))})
        skitteringHeartstopper.setFlavorText("It flows like water over the forest floor, as deadly as the swiftest current.")
        skitteringHeartstopper.power = 1
        skitteringHeartstopper.toughness = 2
        return skitteringHeartstopper
    }
    static func Skulduggery() -> Card {
        let skulduggery = Card(name: "Skulduggery", rarity: .Common, set: set, number: 123)
        skulduggery.setManaCost("B")
        skulduggery.setType(.Instant)
        skulduggery.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) && $0.getController() === skulduggery.getController() },
                           { $0.isType(.Creature) && $0.getController() !== skulduggery.getController() }],
            effect: { targets in
                targets[0].pump(1, 1)
                targets[1].pump(-1, -1)
        }))
        skulduggery.setFlavorText("\"They're so much more willing to parley once they're hanging from a boom by the ankle!\"")
        return skulduggery
    }
    static func SkymarchBloodletter() -> Card {
        let skymarchBloodletter = Card(name: "Skymarch Bloodletter", rarity: .Common, set: set, number: 124)
        skymarchBloodletter.setManaCost("2B")
        skymarchBloodletter.setType(.Creature, .Vampire, .Soldier)
        skymarchBloodletter.flying = true
        skymarchBloodletter.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: { $0 !== skymarchBloodletter.getController() },
                effect: { target in
                    target.loseLife(1)
                    skymarchBloodletter.getController().gainLife(1)
            }))
        skymarchBloodletter.setFlavorText("From the perpetual shadowsmoke that hung above the ship, a silent form emerged, lips curled with malice and anticipation.")
        skymarchBloodletter.power = 2
        skymarchBloodletter.toughness = 2
        return skymarchBloodletter
    }
    static func SpreadingRot() -> Card {
        let spreadingRot = Card(name: "Spreading Rot", rarity: .Common, set: set, number: 125)
        spreadingRot.setManaCost("4B")
        spreadingRot.setType(.Sorcery)
        spreadingRot.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Land) },
            effect: { target in
                let controller = target.getController()
                let _ = target.destroy()
                controller.loseLife(2)
        }))
        spreadingRot.setFlavorText("\"What is this foul presence that defies the sun's cleansing rays.\"\n--Itzama the Crested")
        return spreadingRot
    }
    // 126 Sword-Point Diplomacy
    static func VanquishTheWeak() -> Card {
        let vanquishTheWeak = Card(name: "Vanquish the Weak", rarity: .Common, set: set, number: 127)
        vanquishTheWeak.setManaCost("2B")
        vanquishTheWeak.setType(.Instant)
        vanquishTheWeak.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && $0.getPower() <= 3 },
            effect: { target in let _ = target.destroy() }))
        vanquishTheWeak.setFlavorText("The clerics known as condemners punish those who do not recognize the righteous authority of the church.")
        return vanquishTheWeak
    }
    static func ViciousConquistador() -> Card {
        let viciousConquistador = Card(name: "Vicious Conquistador", rarity: .Uncommon, set: set, number: 128)
        viciousConquistador.setManaCost("B")
        viciousConquistador.setType(.Creature, .Vampire, .Soldier)
        viciousConquistador.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { viciousConquistador.getOpponent().loseLife(1) })
        viciousConquistador.setFlavorText("\"He is ambitious. Tireless. And utterly ruthless. Ideal for the frontier.\"\n--Viceroy Elia Sotonores, report to the queen")
        viciousConquistador.power = 1
        viciousConquistador.toughness = 2
        return viciousConquistador
    }
    // 129 Vraska's Contempt
    static func WalkThePlank() -> Card {
        let walkThePlank = Card(name: "Walk the Plank", rarity: .Uncommon, set: set, number: 130)
        walkThePlank.setManaCost("BB")
        walkThePlank.setType(.Sorcery)
        walkThePlank.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && !$0.isType(.Merfolk) },
            effect: { target in let _ = target.destroy() }))
        walkThePlank.setFlavorText("When Captain Thorn adds a new ship to his fleet, he gives the crew a simple choice: follow me, or fall into the sea.")
        return walkThePlank
    }
    static func WantedScoundrels() -> Card {
        let wantedScoundrels = Card(name: "Wanted Scoundrels", rarity: .Uncommon, set: set, number: 131)
        wantedScoundrels.setManaCost("1B")
        wantedScoundrels.setType(.Creature, .Human, .Pirate)
        wantedScoundrels.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SinglePlayer(
                restriction: { $0 !== wantedScoundrels.getController() },
                effect: { target in
                    target.createToken(Treasure())
                    target.createToken(Treasure())
        }))
        wantedScoundrels.setFlavorText("\"Trust me. The reward's not worth it.\"")
        wantedScoundrels.power = 4
        wantedScoundrels.toughness = 3
        return wantedScoundrels
    }
    // 132 Angrath's Marauders
    // 133 Bonded Horncrest
    // 134 Brazen Buccaneers
    static func BurningSunsAvatar() -> Card {
        let burningSunsAvatar = Card(name: "Burning Sun's Avatar", rarity: .Rare, set: set, number: 135)
        burningSunsAvatar.setManaCost("3RRR")
        burningSunsAvatar.setType(.Creature, .Dinosaur)
        burningSunsAvatar.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect(
                restrictions: [{ potentialTarget in if let player = potentialTarget as? Player { return player !== burningSunsAvatar.getController(); } else { return false; }},
                               { potentialTarget in if let object = potentialTarget as? Object { return object.isType(.Creature); } else { return false; }}],
                effect: { targets in
                    for target in targets {
                        burningSunsAvatar.damage(to: target, 3)
                    }
                },
                requiredTargets: 1))
        burningSunsAvatar.setFlavorText("\"Tilonalli's searing rays carry the spark of life's eventual destruction as all light fades.\"\n--Chitlati, Lightning Rider")
        burningSunsAvatar.power = 6
        burningSunsAvatar.toughness = 6
        return burningSunsAvatar
    }
    // 136 Captain Lannery Storm
    // 137 Captivating Crew
    static func ChargingMonstrosaur() -> Card {
        let chargingMonstrosaur = Card(name: "Charging Monstrosaur", rarity: .Uncommon, set: set, number: 138)
        chargingMonstrosaur.setManaCost("4R")
        chargingMonstrosaur.setType(.Creature, .Dinosaur)
        chargingMonstrosaur.trample = true
        chargingMonstrosaur.haste = true
        chargingMonstrosaur.setFlavorText("\"I knew I should have stayed with the boat. Always stay with the boat!")
        chargingMonstrosaur.power = 5
        chargingMonstrosaur.toughness = 5
        return chargingMonstrosaur
    }
    static func Demolish() -> Card {
        let demolish = Card(name: "Demolish", rarity: .Common, set: set, number: 139)
        demolish.setManaCost("3R")
        demolish.setType(.Sorcery)
        demolish.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Land) },
            effect: { target in let _ = target.destroy() }))
        demolish.setFlavorText("What took months for human hands to carve took just seconds for the dinosaur's tail to ruin.")
        return demolish
    }
    static func DinosaurStampede() -> Card {
        let dinosaurStampede = Card(name: "Dinosaur Stampede", rarity: .Uncommon, set: set, number: 140)
        dinosaurStampede.setManaCost("2R")
        dinosaurStampede.setType(.Instant)
        dinosaurStampede.addEffect({
            Game.shared.bothPlayers({ player in
                player.getCreatures().filter({ $0.attacking }).forEach({ creature in
                    creature.pump(2, 0)
                })
            })
            dinosaurStampede.getController().getPermanents().filter({ $0.isType(.Dinosaur) }).forEach({ dinosaur in
                dinosaur.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.trample = true; return $0 }))
            })
        })
        dinosaurStampede.setFlavorText("If you're in the way of a ceratops charge and you're made of mere flesh and bone, then you're not really in the way.")
        return dinosaurStampede
    }
    static func DualShot() -> Card {
        let dualShot = Card(name: "Dual Shot", rarity: .Common, set: set, number: 141)
        dualShot.setManaCost("R")
        dualShot.setType(.Instant)
        dualShot.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) },
                           { $0.isType(.Creature) }],
            effect: { targets in
                for target in targets {
                    dualShot.damage(to: target, 1)
                }
            },
            requiredTargets: 0))
        dualShot.setFlavorText("\"Through me the rage of Tilonalli burns twice as bright.\"")
        return dualShot
    }
    static func FathomFleetFirebrand() -> Card {
        let fathomFleetFirebrand = Card(name: "Fathom Fleet Firebrand", rarity: .Common, set: set, number: 142)
        fathomFleetFirebrand.setManaCost("1R")
        fathomFleetFirebrand.setType(.Creature, .Human, .Pirate)
        fathomFleetFirebrand.addActivatedAbility(
            string: "{1}{R}: ~ gets +1/+1 until end of turn.",
            cost: Cost("1R"),
            effect: { fathomFleetFirebrand.pump(1, 0) })
        fathomFleetFirebrand.setFlavorText("As she charges into battle, her arcane tattoos stir and crawl like fiery serpents.")
        fathomFleetFirebrand.power = 2
        fathomFleetFirebrand.toughness = 2
        return fathomFleetFirebrand
    }
    static func FieryCannonade() -> Card {
        let fieryCannonade = Card(name: "Fiery Cannonade", rarity: .Uncommon, set: set, number: 143)
        fieryCannonade.setManaCost("2R")
        fieryCannonade.setType(.Instant)
        fieryCannonade.addEffect {
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach({ creature in
                    if !creature.isType(.Pirate) {
                        fieryCannonade.damage(to: creature, 2)
                    }
                })
            })
        }
        fieryCannonade.setFlavorText("Wary of the ferocious dinosaurs, the Legion of Dusk built up the walls of their fort--just in time for the pirates to burn them down.")
        return fieryCannonade
    }
    // 144 Fire Shrine Keeper
    // 145 Firecannon Blast
    static func FrenziedRaptor() -> Card {
        let frenziedRaptor = Card(name: "Frenzied Raptor", rarity: .Common, set: set, number: 146)
        frenziedRaptor.setManaCost("2R")
        frenziedRaptor.setType(.Creature, .Dinosaur)
        frenziedRaptor.setFlavorText("Sun Empire warriors are taught to emulate the fearless raptors that fling themselves against towers of horn and muscles a hundred times their size.")
        frenziedRaptor.power = 4
        frenziedRaptor.toughness = 2
        return frenziedRaptor
    }
    // 147 Headstrong Brute
    // 148 Hijack
    static func LightningStrike() -> Card {
        let lightningStrike = Card(name: "Lightning Strike", rarity: .Uncommon, set: set, number: 149)
        lightningStrike.setManaCost("1R")
        lightningStrike.setType(.Instant)
        lightningStrike.addEffect(TargetedEffect(
            restriction: TargetedEffect.AnyTarget,
            effect: { lightningStrike.damage(to: $0, 3) }))
        lightningStrike.setFlavorText("\"Storm on the horizon, cap'n!\"\n--Grick Doobin, last words")
        return lightningStrike
    }
    // 150 Lightning-Rig Crew
    // 151 Makeshift Munitions
    static func NestRobber() -> Card {
        let nestRobber = Card(name: "Nest Robber", rarity: .Common, set: set, number: 152)
        nestRobber.setManaCost("2R")
        nestRobber.setType(.Creature, .Dinosaur)
        nestRobber.haste = true
        nestRobber.setFlavorText("\"These sailors on our shores are like the dinosaurs that plunder eggs from nests. They live on the labor of others.\"\n--Itzama the Crested")
        nestRobber.power = 2
        nestRobber.toughness = 1
        return nestRobber
    }
    // 153 Otepec Huntmaster
    // 154 Rampaging Ferocidon
    // 155 Raptor Hatchling
    // 156 Repeating Barrage
    // 157 Rigging Runner
    static func Rile() -> Card {
        let rile = Card(name: "Rile", rarity: .Common, set: set, number: 158)
        rile.setManaCost("R")
        rile.setType(.Sorcery)
        rile.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) && $0.getController() === rile.getController() },
            effect: { target in
                rile.damage(to: target, 1)
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.trample = true; return $0 }))
                rile.getController().drawCard()
        }))
        rile.setFlavorText("The enormous can still be at the mercy of the small.")
        return rile
    }
    // 159 Rowdy Crew
    // 160 Rummaging Goblin
    // 161 Star of Extinction
    // 162 Storm Fleet Arsonist
    // 163 Storm Fleet Pyromancer
    // 164 Sun-Crowned Hunters
    // 165 Sunbird's Invocation
    // 166 Sure Strike
    // 167 Swashbuckling
    static func ThrashOfRaptors() -> Card {
        let thrashOfRaptors = Card(name: "Thrash of Raptors", rarity: .Common, set: set, number: 168)
        thrashOfRaptors.setManaCost("3R")
        thrashOfRaptors.setType(.Creature, .Dinosaur)
        thrashOfRaptors.addStaticAbility({ object in
            if object.id == thrashOfRaptors.id && !thrashOfRaptors.getController().getPermanents().filter({ $0.isType(.Dinosaur) && $0.id != thrashOfRaptors.id }).isEmpty {
                object.power = object.getBasePower() + 2
                // TODO: These should be in separate layers
                object.trample = true
            }
            return object
        })
        thrashOfRaptors.setFlavorText("They glide through the undergrowth, drawn to sounds of disturbance. They attack in unison and all share in the kill. And then they move on.")
        thrashOfRaptors.power = 3
        thrashOfRaptors.toughness = 3
        return thrashOfRaptors
    }
    static func TilonallisKnight() -> Card {
        let tilonallisKnight = Card(name: "Tilonalli's Knight", rarity: .Common, set: set, number: 169)
        tilonallisKnight.setManaCost("1R")
        tilonallisKnight.setType(.Creature, .Human, .Knight)
        tilonallisKnight.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { tilonallisKnight.pump(1, 1) },
            restriction: { !tilonallisKnight.getController().getPermanents().filter({ $0.isType(.Dinosaur) }).isEmpty })
        tilonallisKnight.setFlavorText("The people of the Sun Empire worship the sun in three aspects. Tilonalli is the Burning Sun, associated with ferocity, fire, and passion.")
        tilonallisKnight.power = 2
        tilonallisKnight.toughness = 2
        return tilonallisKnight
    }
    // 170 Tilonalli's Skinshifter
    // 171 Trove of Temptation
    static func UnfriendlyFire() -> Card {
        let unfriendlyFire = Card(name: "Unfriendly Fire", rarity: .Common, set: set, number: 172)
        unfriendlyFire.setManaCost("4R")
        unfriendlyFire.setType(.Instant)
        unfriendlyFire.addEffect(TargetedEffect(
            restriction: TargetedEffect.AnyTarget,
            effect: { unfriendlyFire.damage(to: $0, 4) }))
        unfriendlyFire.setFlavorText("Disputes within the Brazen Coalition can escalate from insult to broadside in the blink of an eye.")
        return unfriendlyFire
    }
    // 173 Vance's Blasting Cannons // Spitfire Bastion
    static func WilyGoblin() -> Card {
        let wilyGoblin = Card(name: "Wily Goblin", rarity: .Uncommon, set: set, number: 174)
        wilyGoblin.setManaCost("RR")
        wilyGoblin.setType(.Creature, .Goblin, .Pirate)
        wilyGoblin.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { wilyGoblin.getController().createToken(Treasure()) })
        wilyGoblin.setFlavorText("Goblins climb and swing with ease, whether through a pirate ship's rigging or a tree's branches.")
        wilyGoblin.power = 1
        wilyGoblin.toughness = 1
        return wilyGoblin
    }
    static func AncientBrontodon() -> Card {
        let ancientBrontodon = Card(name: "Ancient Brontodon", rarity: .Common, set: set, number: 175)
        ancientBrontodon.setManaCost("6GG")
        ancientBrontodon.setType(.Creature, .Dinosaur)
        ancientBrontodon.setFlavorText("It is taller than all but the tallest trees, and older than all but the oldest.")
        ancientBrontodon.power = 9
        ancientBrontodon.toughness = 9
        return ancientBrontodon
    }
    // 176 Atzocan Archer
    // 177 Blinding Fog
    static func BlossomDryad() -> Card {
        let blossomDryad = Card(name: "Blossom Dryad", rarity: .Common, set: set, number: 178)
        blossomDryad.setManaCost("2G")
        blossomDryad.setType(.Creature, .Dryad)
        blossomDryad.addActivatedAbility(
            string: "{T}: Untap target land.",
            cost: Cost("", tap: true),
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Land) },
                effect: { target in target.untap() }))
        blossomDryad.setFlavorText("The only force on Ixalan not interested in finding the golden city is Ixalan itself.")
        blossomDryad.power = 2
        blossomDryad.toughness = 2
        return blossomDryad
    }
    // 179 Carnage Tyrant
    static func ColossalDreadmaw() -> Card {
        let colossalDreadmaw = Card(name: "Colossal Dreadmaw", rarity: .Common, set: set, number: 180)
        colossalDreadmaw.setManaCost("4GG")
        colossalDreadmaw.setType(.Creature, .Dinosaur)
        colossalDreadmaw.trample = true
        colossalDreadmaw.setFlavorText("If you feel the ground quake, run. If you hear its bellow, flee. If you see its teeth, it's too late.")
        colossalDreadmaw.power = 6
        colossalDreadmaw.toughness = 6
        return colossalDreadmaw
    }
    // 181 Commune with Dinosaurs
    static func CrashTheRamparts() -> Card {
        let crashTheRamparts = Card(name: "Crash the Ramparts", rarity: .Common, set: set, number: 182)
        crashTheRamparts.setManaCost("2G")
        crashTheRamparts.setType(.Instant)
        crashTheRamparts.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                target.pump(3, 3)
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.trample = true; return $0 }))
        }))
        crashTheRamparts.setFlavorText("The Legion's conquistadors could endure Ixalan's sun. Their forst could withstand a charging ceratops. But nothing can stop a ceratops strengthened by the sun.")
        return crashTheRamparts
    }
    // 183 Crushing Canopy
    // 184 Deathgorge Scavenger
    static func DeeprootChampion() -> Card {
        let deeprootChampion = Card(name: "Deeproot Champion", rarity: .Rare, set: set, number: 185)
        deeprootChampion.setManaCost("1G")
        deeprootChampion.setType(.Creature, .Merfolk, .Warrior)
        deeprootChampion.addTriggeredAbility(
            trigger: .YouCastNoncreatureSpell,
            effect: { deeprootChampion.addCounter(.PlusOnePlusOne) })
        deeprootChampion.setFlavorText("\"No good will come from what you seek. Turn back now or suffer an ignoble death far from your home.\"")
        deeprootChampion.power = 1
        deeprootChampion.toughness = 1
        return deeprootChampion
    }
    // 186 Deeproot Warrior
    static func DroverOfTheMight() -> Card {
        let droverOfTheMighty = Card(name: "Drover of the Mighty", rarity: .Uncommon, set: set, number: 187)
        droverOfTheMighty.setManaCost("1G")
        droverOfTheMighty.setType(.Creature, .Human, .Druid)
        droverOfTheMighty.addStaticAbility({ object in
            if object.id == droverOfTheMighty.id && !object.getController().getPermanents().filter({ $0.isType(.Dinosaur) }).isEmpty {
                object.power = object.getBasePower() + 2
                object.toughness = object.getBaseToughness() + 2
            }
            return object
        })
        droverOfTheMighty.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
            effect: { droverOfTheMighty.getController().addMana(color: .White) },
            manaAbility: true)
        droverOfTheMighty.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost("", tap: true),
            effect: { droverOfTheMighty.getController().addMana(color: .Blue) },
            manaAbility: true)
        droverOfTheMighty.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
            effect: { droverOfTheMighty.getController().addMana(color: .Black) },
            manaAbility: true)
        droverOfTheMighty.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost("", tap: true),
            effect: { droverOfTheMighty.getController().addMana(color: .Red) },
            manaAbility: true)
        droverOfTheMighty.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost("", tap: true),
            effect: { droverOfTheMighty.getController().addMana(color: .Green) },
            manaAbility: true)
        droverOfTheMighty.setFlavorText("\"I do not lead. They do not follow. We walk together.\"")
        droverOfTheMighty.power = 1
        droverOfTheMighty.toughness = 1
        return droverOfTheMighty
    }
    // 188 Emergent Growth
    // 189 Emperor's Vanguard
    static func GrazingWhiptail() -> Card {
        let grazingWhiptail = Card(name: "Grazing Whiptail", rarity: .Common, set: set, number: 190)
        grazingWhiptail.setManaCost("2GG")
        grazingWhiptail.setType(.Creature, .Dinosaur)
        grazingWhiptail.reach = true
        grazingWhiptail.setFlavorText("Often found browsing on the upper canopies of Ixalan's jungles, whiptails are known to absently bay away anything foolish enough to interrupt their meal.")
        grazingWhiptail.power = 3
        grazingWhiptail.toughness = 4
        return grazingWhiptail
    }
    // 191 Growing Rites of Itlimoc // Itlimoc, Cradle of the Sun
    // 192 Ixalli's Diviner
    static func IxallisKeeper() -> Card {
        let ixallisKeeper = Card(name: "Ixalli's Keeper", rarity: .Common, set: set, number: 193)
        ixallisKeeper.setManaCost("1G")
        ixallisKeeper.setType(.Creature, .Human, .Shaman)
        ixallisKeeper.addActivatedAbility(
            string: "{7}{G}, {T}, Sacrifice ~: Target creature gets +5/+5 and gains trample until end of turn.",
            cost: Cost("7G", tap: true, life: 0, sacrificeSelf: true),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) },
                effect: { target in
                    target.pump(5, 5)
                    target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ $0.trample = true; return $0 }))
        }))
        ixallisKeeper.setFlavorText("The people of the Sun Empire worship the sun in three aspects. Ixalli is the Verdant Sun, who fosters growth in all things.")
        ixallisKeeper.power = 2
        ixallisKeeper.toughness = 2
        return ixallisKeeper
    }
    // 194 Jade Guardian
    static func JungleDelver() -> Card {
        let jungleDelver = Card(name: "Jungle Delver", rarity: .Common, set: set, number: 195)
        jungleDelver.setManaCost("G")
        jungleDelver.setType(.Creature, .Merfolk, .Warrior)
        jungleDelver.addActivatedAbility(
            string: "{3}{G}: Put a +1/+1 counter on ~.",
            cost: Cost("3G"),
            effect: { jungleDelver.addCounter(.PlusOnePlusOne) })
        jungleDelver.setFlavorText("\"There is no power too great to be used in the defense of our ancestral lands.\"")
        jungleDelver.power = 1
        jungleDelver.toughness = 1
        return jungleDelver
    }
    static func KumenasSpeaker() -> Card {
        let kumenasSpeaker = Card(name: "Kumena's Speaker", rarity: .Uncommon, set: set, number: 196)
        kumenasSpeaker.setManaCost("G")
        kumenasSpeaker.setType(.Creature, .Merfolk, .Shaman)
        kumenasSpeaker.addStaticAbility({ object in
            if object.id == kumenasSpeaker.id {
                let controlsOtherMerfolk = !object.getController().getPermanents().filter({ $0.isType(.Merfolk) && $0.id != object.id }).isEmpty
                let controlsIsland = !object.getController().getPermanents().filter({ $0.isType(.Island) }).isEmpty
                if controlsOtherMerfolk || controlsIsland {
                    object.power = object.getBasePower() + 1
                    object.toughness = object.getBaseToughness() + 1
                }
            }
            return object
        })
        kumenasSpeaker.setFlavorText("\"The same power that drives the river ever onward flows through the roots and branches--to me.\"")
        kumenasSpeaker.power = 1
        kumenasSpeaker.toughness = 1
        return kumenasSpeaker
    }
    // 197 Merfolk Branchwalker
    // 198 New Horizons
    // 199 Old Growth Dryads
    static func Pounce() -> Card {
        let pounce = Card(name: "Pounce", rarity: .Common, set: set, number: 200)
        pounce.setManaCost("1G")
        pounce.setType(.Instant)
        pounce.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) && $0.getController() === pounce.getController()},
                           { $0.isType(.Creature) && $0.getController() !== pounce.getController()}],
            effect: { targets in targets[0].fight(targets[1]) }))
        pounce.setFlavorText("The drive to hunt and feed is raw instinct for dinosaurs. The trick is simply to channel it in the right direction.")
        return pounce
    }
    // 201 Ranging Raptors
    // 202 Ravenous Daggertooth
    // 203 Ripjaw Raptor
    static func RiverHeraldsBoon() -> Card {
        let riverHeraldsBoon = Card(name: "River Heralds' Boon", rarity: .Common, set: set, number: 204)
        riverHeraldsBoon.setManaCost("1G")
        riverHeraldsBoon.setType(.Instant)
        riverHeraldsBoon.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) },
                           { $0.isType(.Merfolk) }],
            effect: { $0.forEach({ $0.addCounter(.PlusOnePlusOne) }) },
            requiredTargets: 1))
        riverHeraldsBoon.setFlavorText("\"We are kin to the trees, and their strength is their own.\"")
        return riverHeraldsBoon
    }
    // 205 Savage Stomp
    // 206 Shaper's Sanctuary
    static func SliceInTwain() -> Card {
        let sliceInTwain = Card(name: "Slice in Twain", rarity: .Uncommon, set: set, number: 207)
        sliceInTwain.setManaCost("2GG")
        sliceInTwain.setType(.Instant)
        sliceInTwain.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
            effect: { target in
                let _ = target.destroy()
                sliceInTwain.getController().drawCard()
        }))
        sliceInTwain.setFlavorText("The magic of the River Heralds is so great that even a single shaman can fend off a pirate landing party.")
        return sliceInTwain
    }
    // 208 Snapping Sailback
    // 209 Spike-Tailed Ceratops
    static func ThunderingSpineback() -> Card {
        let thunderingSpineback = Card(name: "Thundering Spineback", rarity: .Uncommon, set: set, number: 210)
        thunderingSpineback.setManaCost("5GG")
        thunderingSpineback.setType(.Creature, .Dinosaur)
        thunderingSpineback.addStaticAbility({ object in
            if object.id != thunderingSpineback.id && object.isType(.Dinosaur) && object.getController() === thunderingSpineback.getController() {
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
            }
            return object
        })
        thunderingSpineback.addActivatedAbility(
            string: "{5}{G}: Create a 3/3 green Dinosaur creature token with trample.",
            cost: Cost("5G"),
            effect: { thunderingSpineback.getController().createToken(Dinosaur()) })
        thunderingSpineback.setFlavorText("\"It appears that nature has risen up against us.\"\n--Captain Brinely Rage")
        thunderingSpineback.power = 5
        thunderingSpineback.toughness = 5
        return thunderingSpineback
    }
    // 211 Tishana's Wayfinder
    // 212 Verdant Rebirth
    // 213 Verdant Sun's Avatar
    // 214 Vineshaper Mystic
    // 215 Waker of the Wilds
    // 216 Wildgrowth Walker
    // 217 Admiral Beckett Brass
    // 218 Belligerent Brontodon
    static func CallToTheFeast() -> Card {
        let callToTheFeast = Card(name: "Call to the Feast", rarity: .Uncommon, set: set, number: 219)
        callToTheFeast.setManaCost("2WB")
        callToTheFeast.setType(.Sorcery)
        callToTheFeast.addEffect({
            callToTheFeast.getController().createToken(Vampire())
            callToTheFeast.getController().createToken(Vampire())
            callToTheFeast.getController().createToken(Vampire())
        })
        callToTheFeast.setFlavorText("By the law of church and crown, vampires feed only on the blood of the guilty--those declared heretics, rebels, or enemies of war.")
        return callToTheFeast
    }
    static func DeadeyePlunderers() -> Card {
        let deadeyePlunderers = Card(name: "Deadeye Plunderers", rarity: .Uncommon, set: set, number: 220)
        deadeyePlunderers.setManaCost("3UB")
        deadeyePlunderers.setType(.Creature, .Human, .Pirate)
        deadeyePlunderers.addStaticAbility({ object in
            if object.id == deadeyePlunderers.id {
                let numArtifacts = object.getController().getArtifacts().count
                object.power = object.getBasePower() + numArtifacts
                object.toughness = object.getBaseToughness() + numArtifacts
            }
            return object
        })
        deadeyePlunderers.addActivatedAbility(
            string: "{2}{U}{B}: Create a colorless Treasure artifact token with \"{T}: Sacrifice this artifact: Add one mana of any color to your mana pool.\"",
            cost: Cost("2UB"),
            effect: { deadeyePlunderers.getController().createToken(Treasure()) })
        deadeyePlunderers.setFlavorText("\"Keep your friends close and your enemies within range.\"")
        deadeyePlunderers.power = 3
        deadeyePlunderers.toughness = 3
        return deadeyePlunderers
    }
    static func DireFleetCaptain() -> Card {
        let direFleetCaptain = Card(name: "Dire Fleet Captain", rarity: .Uncommon, set: set, number: 221)
        direFleetCaptain.setManaCost("BR")
        direFleetCaptain.setType(.Creature, .Orc, .Pirate)
        direFleetCaptain.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: {
                let numPirates = direFleetCaptain.getController().getPermanents().filter({ return $0.isType(.Pirate) && $0.attacking && $0.id != direFleetCaptain.id }).count +
                                 direFleetCaptain.getOpponent().getPermanents().filter({ return $0.isType(.Pirate) && $0.attacking && $0.id != direFleetCaptain.id }).count
                direFleetCaptain.pump(numPirates, numPirates)
        })
        direFleetCaptain.setFlavorText("Orcs are happiest under captains who steer toward battle. Orcs of the Dire Fleet are downright jovial.")
        direFleetCaptain.power = 2
        direFleetCaptain.toughness = 2
        return direFleetCaptain
    }
    // 222 Gishath, Sun's Avatar
    // 223 Hostage Taker
    // 224 Huatli, Warrior Poet
    // 225 Marauding Looter
    static func RagingSwordtooth() -> Card {
        let ragingSwordtooth = Card(name: "Raging Swordtooth", rarity: .Uncommon, set: set, number: 226)
        ragingSwordtooth.setManaCost("3RG")
        ragingSwordtooth.setType(.Creature, .Dinosaur)
        ragingSwordtooth.trample = true
        ragingSwordtooth.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { Game.shared.bothPlayers({ player in
                player.getCreatures().forEach({ creature in
                    if creature.id != ragingSwordtooth.id {
                        ragingSwordtooth.damage(to: creature, 1)
                    }
                })
            })
        })
        ragingSwordtooth.setFlavorText("Carnivorous dinosaurs developed a taste for undead flesh, tracking the vampires by the scent of blood on their breath.")
        ragingSwordtooth.power = 5
        ragingSwordtooth.toughness = 5
        return ragingSwordtooth
    }
    static func RegisaurAlpha() -> Card {
        let regisaurAlpha = Card(name: "Regisaur Alpha", rarity: .Rare, set: set, number: 227)
        regisaurAlpha.setManaCost("3RG")
        regisaurAlpha.setType(.Creature, .Dinosaur)
        regisaurAlpha.addStaticAbility({ object in
            if object.id != regisaurAlpha.id && object.isType(.Dinosaur) && object.getController() === regisaurAlpha.getController() {
                object.haste = true
            }
            return object
        })
        regisaurAlpha.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { regisaurAlpha.getController().createToken(Dinosaur()) })
        regisaurAlpha.setFlavorText("\"Seeing a pack of these monsters hunt together, I'm at a loss to imagine the size of their prey.\"\n--Adrain Adanto of Lujio")
        regisaurAlpha.power = 3
        regisaurAlpha.toughness = 3
        return regisaurAlpha
    }
    // 228 Shapers of Nature
    // 229 Sky Terror
    // 230 Tishana, Voice of Thunder
    // 231 Vona, Butcher of Magan
    // 232 Vraska, Relic Seeker
    // 233 Cobbled Wings
    // 234 Conqueror's Galleon // Conqueror's Foothold
    // 235 Dowsing Dagger // Lost Vale
    // 236 Dusk Legion Dreadnought
    // 237 Elaborate Firecannon
    // 238 Fell Flagship
    static func GildedSentinel() -> Card {
        let gildedSentinel = Card(name: "Gilded Sentinel", rarity: .Common, set: set, number: 239)
        gildedSentinel.setManaCost("4")
        gildedSentinel.setType(.Artifact, .Creature, .Golem)
        gildedSentinel.setFlavorText("The River Heralds fight to keep all others from reaching the golden city. The city has its own defenses.")
        gildedSentinel.power = 3
        gildedSentinel.toughness = 3
        return gildedSentinel
    }
    static func HierophantsChalice() -> Card {
        let hierophantsChalice = Card(name: "Heirophant's Chalice", rarity: .Common, set: set, number: 240)
        hierophantsChalice.setManaCost("3")
        hierophantsChalice.setType(.Artifact)
        hierophantsChalice.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SinglePlayer(
                restriction: { $0 !== hierophantsChalice.getController() },
                effect: { target in
                    target.loseLife(1)
                    hierophantsChalice.getController().gainLife(1)
            }))
        hierophantsChalice.addActivatedAbility(
            string: "{T}: Add {C}.",
            cost: Cost("", tap: true),
            effect: { hierophantsChalice.getController().addMana(color: nil)},
            manaAbility: true)
        hierophantsChalice.setFlavorText("In the Rite of Redemption, nobles take the same vows as Elenda, the first vampire, and make the same eternal sacrifice.")
        return hierophantsChalice
    }
    // 241 Pillar of Origins
    // 242 Pirate's Cutlass
    // 243 Primal Amulet // Primal Wellspring
    // 244 Prying Blade
    // 245 Sentinel Totem
    // 246 Shadowed Caravel
    // 247 Sleek Schooner
    // 248 Sorcerous Spyglass
    // 249 Thaumatic Compass // Spires of Orazca
    // 250 Treasure Map // Treasure Cove
    // 251 Vanquisher's Bannner
    static func DragonskullSummit() -> Card {
        let dragonskullSummit = Card(name: "Dragonskull Summit", rarity: .Rare, set: set, number: 252)
        dragonskullSummit.setManaCost("")
        dragonskullSummit.setType(.Land)
        dragonskullSummit.addStaticAbility({ object in
            if object.id == dragonskullSummit.id {
                let controlsSwamp = !dragonskullSummit.getController().getLands().filter({ $0.isType(.Swamp) }).isEmpty
                let controlsMountain = !dragonskullSummit.getController().getLands().filter({ $0.isType(.Mountain) }).isEmpty
                object.entersTapped = !(controlsSwamp || controlsMountain)
            }
            return object
        })
        dragonskullSummit.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
            effect: { dragonskullSummit.getController().addMana(color: .Black) },
            manaAbility: true)
        dragonskullSummit.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost("", tap: true),
            effect: { dragonskullSummit.getController().addMana(color: .Red) },
            manaAbility: true)
        dragonskullSummit.setFlavorText("When the Planeswalker Angrath called dinosaurs \"dragons,\" the name stuck in certain pirate circles.")
        return dragonskullSummit
    }
    static func DrownedCatacomb() -> Card {
        let drownedCatacomb = Card(name: "Drowned Catacomb", rarity: .Rare, set: set, number: 253)
        drownedCatacomb.setManaCost("")
        drownedCatacomb.setType(.Land)
        drownedCatacomb.addStaticAbility({ object in
            if object.id == drownedCatacomb.id {
                let controlsIsland = !drownedCatacomb.getController().getLands().filter({ $0.isType(.Island) }).isEmpty
                let controlsSwamp = !drownedCatacomb.getController().getLands().filter({ $0.isType(.Swamp) }).isEmpty
                object.entersTapped = !(controlsIsland || controlsSwamp)
            }
            return object
        })
        drownedCatacomb.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost("", tap: true),
            effect: { drownedCatacomb.getController().addMana(color: .Blue) },
            manaAbility: true)
        drownedCatacomb.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
            effect: { drownedCatacomb.getController().addMana(color: .Black) },
            manaAbility: true)
        drownedCatacomb.setFlavorText("None can tell how many vessles are tangled up on the sea floor--or how much treasure rmains unclaimed.")
        return drownedCatacomb
    }
    // 254 Field of Ruin
    static func GlacialFortress() -> Card {
        let glacialFortress = Card(name: "Glacial Fortress", rarity: .Rare, set: set, number: 255)
        glacialFortress.setManaCost("")
        glacialFortress.setType(.Land)
        glacialFortress.addStaticAbility({ object in
            if object.id == glacialFortress.id {
                let controlsPlains = !glacialFortress.getController().getLands().filter({ $0.isType(.Plains) }).isEmpty
                let controlsIsland = !glacialFortress.getController().getLands().filter({ $0.isType(.Island) }).isEmpty
                object.entersTapped = !(controlsPlains || controlsIsland)
            }
            return object
        })
        glacialFortress.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
            effect: { glacialFortress.getController().addMana(color: .White) },
            manaAbility: true)
        glacialFortress.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost("", tap: true),
            effect: { glacialFortress.getController().addMana(color: .Blue) },
            manaAbility: true)
        glacialFortress.setFlavorText("Ships blown north in their voyage across the Stormwreck Sea become trapped in the unmelting ice.")
        return glacialFortress
    }
    static func RootboundCrag() -> Card {
        let rootboundCrag = Card(name: "Rootbound Crag", rarity: .Rare, set: set, number: 256)
        rootboundCrag.setManaCost("")
        rootboundCrag.setType(.Land)
        rootboundCrag.addStaticAbility({ object in
            if object.id == rootboundCrag.id {
                let controlsMountain = !rootboundCrag.getController().getLands().filter({ $0.isType(.Mountain) }).isEmpty
                let controlsForest = !rootboundCrag.getController().getLands().filter({ $0.isType(.Forest) }).isEmpty
                object.entersTapped = !(controlsMountain || controlsForest)
            }
            return object
        })
        rootboundCrag.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost("", tap: true),
            effect: { rootboundCrag.getController().addMana(color: .Red) },
            manaAbility: true)
        rootboundCrag.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost("", tap: true),
            effect: { rootboundCrag.getController().addMana(color: .Green) },
            manaAbility: true)
        rootboundCrag.setFlavorText("Cliffs echo and branches quake at the roar of life.")
        return rootboundCrag
    }
    static func SunpetalGrove() -> Card {
        let sunpetalGrove = Card(name: "Sunpetal Grove", rarity: .Rare, set: set, number: 257)
        sunpetalGrove.setManaCost("")
        sunpetalGrove.setType(.Land)
        sunpetalGrove.addStaticAbility({ object in
            if object.id == sunpetalGrove.id {
                let controlsForest = !sunpetalGrove.getController().getLands().filter({ $0.isType(.Forest) }).isEmpty
                let controlsPlains = !sunpetalGrove.getController().getLands().filter({ $0.isType(.Plains) }).isEmpty
                object.entersTapped = !(controlsForest || controlsPlains)
            }
            return object
        })
        sunpetalGrove.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost("", tap: true),
            effect: { sunpetalGrove.getController().addMana(color: .Green) },
            manaAbility: true)
        sunpetalGrove.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
            effect: { sunpetalGrove.getController().addMana(color: .White) },
            manaAbility: true)
        sunpetalGrove.setFlavorText("To the Sun Empire, any place where daylight brightens the jungle floor is sacred ground.")
        return sunpetalGrove
    }
    // 258 Unclaimed Territory
    static func UnknownShores() -> Card {
        let unknownShores = Card(name: "Unknown Shores", rarity: .Common, set: set, number: 259)
        unknownShores.setManaCost("")
        unknownShores.setType(.Land)
        unknownShores.addActivatedAbility(
            string: "{T}: Add {C}.",
            cost: Cost("", tap: true),
            effect: { unknownShores.getController().addMana(color: nil)},
            manaAbility: true)
        unknownShores.addActivatedAbility(
            string: "{1}, {T}: Add {W}.",
            cost: Cost("1", tap: true),
            effect: { unknownShores.getController().addMana(color: .White)},
            manaAbility: true)
        unknownShores.addActivatedAbility(
            string: "{1}, {T}: Add {U}.",
            cost: Cost("1", tap: true),
            effect: { unknownShores.getController().addMana(color: .Blue)},
            manaAbility: true)
        unknownShores.addActivatedAbility(
            string: "{1}, {T}: Add {B}.",
            cost: Cost("1", tap: true),
            effect: { unknownShores.getController().addMana(color: .Black)},
            manaAbility: true)
        unknownShores.addActivatedAbility(
            string: "{1}, {T}: Add {R}.",
            cost: Cost("1", tap: true),
            effect: { unknownShores.getController().addMana(color: .Red)},
            manaAbility: true)
        unknownShores.addActivatedAbility(
            string: "{1}, {T}: Add {G}.",
            cost: Cost("1", tap: true),
            effect: { unknownShores.getController().addMana(color: .Green)},
            manaAbility: true)
        unknownShores.setFlavorText("\"Just imagine what's waiting around the bend. Adventure. Discovery. Riches for the taking. This is why I sail.\"\n--Captain Lannery Storm")
        return unknownShores
    }
    // Basics
    
    static func Vampire() -> Token {
        let vampire = Token(name: "Vampire", set: set, number: 1)
        vampire.colors = [.White]
        vampire.setType(.Creature, .Vampire)
        vampire.lifelink = true
        vampire.power = 1
        vampire.toughness = 1
        return vampire
    }
    // 2 Illusion
    // 3 Merfolk
    // 4 Pirate
    static func Dinosaur() -> Token {
        let dinosaur = Token(name: "Dinosaur", set: set, number: 5)
        dinosaur.colors = [.Green]
        dinosaur.setType(.Creature, .Dinosaur)
        dinosaur.trample = true
        dinosaur.power = 3
        dinosaur.toughness = 3
        return dinosaur
    }
    // 6 Plant
    static func Treasure() -> Token {
        let r = Int.random(in: 7 ... 10)
        return makeTreasure(number: r)
    }
    private static func makeTreasure(number: Int) -> Token {
        let treasure = Token(name: "Treasure", set: set, number: number)
        treasure.setType(.Artifact, .Treasure)
        treasure.addActivatedAbility(
            string: "{T}, Sacrifice ~: Add {W}.",
            cost: Cost("", tap: true, life: 0, sacrificeSelf: true),
            effect: { treasure.getController().addMana(color: .White) },
            manaAbility: true)
        treasure.addActivatedAbility(
            string: "{T}, Sacrifice ~: Add {U}.",
            cost: Cost("", tap: true, life: 0, sacrificeSelf: true),
            effect: { treasure.getController().addMana(color: .Blue) },
            manaAbility: true)
        treasure.addActivatedAbility(
            string: "{T}, Sacrifice ~: Add {B}.",
            cost: Cost("", tap: true, life: 0, sacrificeSelf: true),
            effect: { treasure.getController().addMana(color: .Black) },
            manaAbility: true)
        treasure.addActivatedAbility(
            string: "{T}, Sacrifice ~: Add {R}.",
            cost: Cost("", tap: true, life: 0, sacrificeSelf: true),
            effect: { treasure.getController().addMana(color: .Red) },
            manaAbility: true)
        treasure.addActivatedAbility(
            string: "{T}, Sacrifice ~: Add {G}.",
            cost: Cost("", tap: true, life: 0, sacrificeSelf: true),
            effect: { treasure.getController().addMana(color: .Green) },
            manaAbility: true)
        return treasure
    }
}
