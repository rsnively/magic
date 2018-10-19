import Foundation

enum XLN {
    static var set = "xln"
    static var count = 279
    
    // 1 Adanto Vanguard
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
        brightReprisal.addTargetedEffect(
            restriction: { return $0.isType(.Creature) && $0.attacking },
            effect: { target in
                target.destroy()
                brightReprisal.getController().drawCard()
            })
        brightReprisal.setFlavorText("Vampires know blood and the systems that carry it. And they know exactly where to strike to set it free.")
        return brightReprisal
    }
    static func Demystify() -> Card {
        let demystify = Card(name: "Demystify", rarity: .Common, set: set, number: 8)
        demystify.setManaCost("W")
        demystify.setType(.Instant)
        demystify.addTargetedEffect(
            restriction: { return $0.isType(.Enchantment) },
            effect: { target in target.destroy() })
        demystify.setFlavorText("\"The River Heralds carve spells into jade, hoping to steer us from our course. But what right do they have to keep us from that which once was ours?\"")
        return demystify
    }
    static func DuskborneSkymarcher() -> Card {
        let duskborneSkymarcher = Card(name: "Duskborne Skymarcher", rarity: .Uncommon, set: set, number: 9)
        duskborneSkymarcher.setManaCost("W")
        duskborneSkymarcher.setType(.Creature, .Vampire, .Cleric)
        duskborneSkymarcher.flying = true
        duskborneSkymarcher.addTargetedActivatedAbility(
            cost: Cost("W", tap: true),
            restriction: { return $0.isType(.Creature) && $0.isType(.Vampire) && $0.attacking },
            effect: { target in target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
                return object
            }))
        })
        duskborneSkymarcher.setFlavorText("\"The hour of Dusk is come.\"")
        duskborneSkymarcher.power = 1
        duskborneSkymarcher.toughness = 1
        return duskborneSkymarcher
    }
    // 10 Emissary of Sunrise
    // 11 Encampment Keeper
    // 12 Glorifier of Dusk
    // 13 Goring Ceratops
    static func ImperialAerosaur() -> Card {
        let imperialAerosaur = Card(name: "Imperial Aerosaur", rarity: .Uncommon, set: set, number: 14)
        imperialAerosaur.setManaCost("3W")
        imperialAerosaur.setType(.Creature, .Dinosaur)
        imperialAerosaur.flying = true
        imperialAerosaur.addTargetedTriggeredAbility(
            trigger: .ThisETB,
            restriction: { return $0.isType(.Creature) && $0 != imperialAerosaur },
            effect: { target in target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
                object.flying = true
                return object
            }))
        })
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
        inspiringCleric.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { inspiringCleric.getController().gainLife(4) })
        inspiringCleric.setFlavorText("\"The Immortal Sun will bring us true eternal life to replace the everlasting shadow of undeath.\"")
        inspiringCleric.power = 3
        inspiringCleric.toughness = 2
        return inspiringCleric
    }
    // 17 Ixalan's Binding
    // 18 Kinjalli's Caller
    // 19 Kinjalli's Sunwing
    // 20 Legion Conquistador
    static func LegionsJudgment() -> Card {
        let legionsJudgment = Card(name: "Legion's Judgment", rarity: .Common, set: set, number: 21)
        legionsJudgment.setManaCost("2W")
        legionsJudgment.setType(.Sorcery)
        legionsJudgment.addTargetedEffect(
            restriction: { return $0.isType(.Creature) && $0.getToughness() >= 4 },
            effect: { target in target.destroy() })
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
        paladinOfTheBloodstained.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { paladinOfTheBloodstained.getController().createToken(Vampire()) })
        paladinOfTheBloodstained.setFlavorText("Closely linked to the Church of Dusk, the paladins of the Bloodstained order are devout to the point of fanaticism.")
        paladinOfTheBloodstained.power = 3
        paladinOfTheBloodstained.toughness = 2
        return paladinOfTheBloodstained
    }
    // 26 Pious Interdiction
    // 27 Priest of the Wakening Sun
    // 28 Pterodon Knight
    static func QueensCommission() -> Card {
        let queensCommission = Card(name: "Queen's Commission", rarity: .Common, set: set, number: 29)
        queensCommission.setManaCost("2W")
        queensCommission.setType(.Sorcery)
        queensCommission.addUntargetedEffect({
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
        rallyingRoar.addUntargetedEffect({
            rallyingRoar.getController().getCreatures().forEach({ creature in
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() + 1
                    object.toughness = object.getBaseToughness() + 1
                    return object
                }))
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
        ritualOfRejuvenation.addUntargetedEffect({
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
        slashOfTalons.addTargetedEffect(
            restriction: { return $0.isType(.Creature) && ($0.attacking || $0.blocking) },
            effect: { target in slashOfTalons.damage(to: target, 2) })
        slashOfTalons.setFlavorText("\"The amber sun smokes with fury, gazing on foes that gather like ants invading our home. We are ready! Blade and claw strike as one.\"\n--Huatli")
        return slashOfTalons
    }
    // 39 Steadfast Armasaur
    // 40 Sunrise Seeker
    static func TerritorialHammerskull() -> Card {
        let territorialHammerskull = Card(name: "Territorial Hammerskull", rarity: .Common, set: set, number: 41)
        territorialHammerskull.setManaCost("2W")
        territorialHammerskull.setType(.Creature, .Dinosaur)
        territorialHammerskull.addTargetedTriggeredAbility(
            trigger: .ThisAttacks,
            restriction: { return $0.isType(.Creature) && $0.getController() != territorialHammerskull.getController() },
            effect: { target in target.tap() })
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
    // 52 Depths of Desire
    // 53 Dive Down
    // 54 Dreamcaller Siren
    // 55 Entrancing Melody
    // 56 Favorable Winds
    // 57 Fleet Swallower
    static func HeadwaterSentries() -> Card {
        let headwaterSentries = Card(name: "Headwater Sentries", rarity: .Common, set: set, number: 58)
        headwaterSentries.setManaCost("3U")
        headwaterSentries.setType(.Creature, .Merfolk, .Warrior)
        headwaterSentries.setFlavorText("\"The elders say that if the intruders discovered the secret of the golden city, it would mean an end to our people.\"")
        headwaterSentries.power = 2
        headwaterSentries.toughness = 5
        return headwaterSentries
    }
    // 59 Herald of Secret Streams
    // 60 Jace, Cunning Castaway
    // 61 Kopala, Warden of Waves
    // 62 Lookout's Dispersal
    // 63 Navigator's Ruin
    // 64 One With the Wind
    // 65 Opt
    // 66 Overflowing Insight
    // 67 Perilous Voyage
    // 68 Pirate's Prize
    // 69 Prosperous Pirates
    // 70 River Sneak
    // 71 River's Rebuke
    // 72 Run Aground
    // 73 Sailor of Means
    // 74 Search for Azcanta // Azcanta, the Sunken Ruin
    // 75 Shaper Apprentice
    // 76 Shipwreck Looter
    // 77 Shore Keeper
    // 78 Siren Lookout
    // 79 Siren Stormtamer
    // 80 Siren's Ruse
    // 81 Spell Pierce
    // 82 Spell Swindle
    // 83 Storm Fleet Aerialist
    // 84 Storm Fleet Spy
    // 85 Storm Sculptor
    // 86 Tempest Caller
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
    // 91 Bishop of the Bloodstained
    // 92 Blight Keeper
    // 93 Bloodcrazed Paladin
    // 94 Boneyard Parley
    // 95 Contract Killing
    // 96 Costly Plunder
    // 97 Dark Nourishment
    // 98 Deadeye Tormenter
    // 99 Deadeye Tracker
    // 100 Deathless Ancient
    // 101 Desperate Castaways
    // 102 Dire Fleet Hoarder
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
    // 122 Skittering Heartstopper
    // 123 Skulduggery
    // 124 Skymarch Bloodletter
    static func SpreadingRot() -> Card {
        let spreadingRot = Card(name: "Spreading Rot", rarity: .Common, set: set, number: 125)
        spreadingRot.setManaCost("4B")
        spreadingRot.setType(.Sorcery)
        spreadingRot.addTargetedEffect(
            restriction: { return $0.isType(.Land) },
            effect: { target in
                let controller = target.getController()
                target.destroy()
                controller.damage(2)
        })
        spreadingRot.setFlavorText("\"What is this foul presence that defies the sun's cleansing rays.\"\n--Itzama the Crested")
        return spreadingRot
    }
    // 126 Sword-Point Diplomacy
    static func VanquishTheWeak() -> Card {
        let vanquishTheWeak = Card(name: "Vanquish the Weak", rarity: .Common, set: set, number: 127)
        vanquishTheWeak.setManaCost("2B")
        vanquishTheWeak.setType(.Instant)
        vanquishTheWeak.addTargetedEffect(
            restriction: { return $0.isType(.Creature) && $0.getPower() <= 3 },
            effect: { target in target.destroy() })
        vanquishTheWeak.setFlavorText("The clerics known as condemners punish those who do not recognize the righteous authority of the church.")
        return vanquishTheWeak
    }
    static func ViciousConquistador() -> Card {
        let viciousConquistador = Card(name: "Vicious Conquistador", rarity: .Uncommon, set: set, number: 128)
        viciousConquistador.setManaCost("B")
        viciousConquistador.setType(.Creature, .Vampire, .Soldier)
        viciousConquistador.addUntargetedTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { viciousConquistador.getController().getOpponent().loseLife(1) })
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
        walkThePlank.addTargetedEffect(
            restriction: { return $0.isType(.Creature) && !$0.isType(.Merfolk) },
            effect: { target in target.destroy() })
        walkThePlank.setFlavorText("When Captain Thorn adds a new ship to his fleet, he gives the crew a simple choice: follow me, or fall into the sea.")
        return walkThePlank
    }
    // 131 Wanted Scoundrels
    // 132 Angrath's Marauders
    // 133 Bonded Horncrest
    // 134 Brazen Buccaneers
    // 135 Burning Sun's Avatar
    // 136 Captain Lannery Storm
    // 137 Captivating Crew
    // 138 Charging Monstrosaur
    static func Demolish() -> Card {
        let demolish = Card(name: "Demolish", rarity: .Common, set: set, number: 139)
        demolish.setManaCost("3R")
        demolish.setType(.Sorcery)
        demolish.addTargetedEffect(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Land) },
            effect: { target in target.destroy() })
        demolish.setFlavorText("What took months for human hands to carve took just seconds for the dinosaur's tail to ruin.")
        return demolish
    }
    // 140 Dinosaur Stampede
    // 141 Dual Shot
    static func FathomFleetFirebrand() -> Card {
        let fathomFleetFirebrand = Card(name: "Fathom Fleet Firebrand", rarity: .Common, set: set, number: 142)
        fathomFleetFirebrand.setManaCost("1R")
        fathomFleetFirebrand.setType(.Creature, .Human, .Pirate)
        fathomFleetFirebrand.addUntargetedActivatedAbility(
            cost: Cost("1R"),
            effect: { fathomFleetFirebrand.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                object.power = object.getBasePower() + 1
                return object
                
            }))
        })
        fathomFleetFirebrand.setFlavorText("As she charges into battle, her arcane tattoos stir and crawl like fiery serpents.")
        fathomFleetFirebrand.power = 2
        fathomFleetFirebrand.toughness = 2
        return fathomFleetFirebrand
    }
    static func FieryCannonade() -> Card {
        let fieryCannonade = Card(name: "Fiery Cannonade", rarity: .Uncommon, set: set, number: 143)
        fieryCannonade.setManaCost("2R")
        fieryCannonade.setType(.Instant)
        fieryCannonade.addUntargetedEffect({
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach({ creature in
                    if !creature.isType(.Pirate) {
                        fieryCannonade.damage(to: creature, 2)
                    }
                })
            })
        })
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
    // 149 Lightning Strike
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
    // 158 Rile
    // 159 Rowdy Crew
    // 160 Rummaging Goblin
    // 161 Star of Extinction
    // 162 Storm Fleet Arsonist
    // 163 Storm Fleet Pyromancer
    // 164 Sun-Crowned Hunters
    // 165 Sunbird's Invocation
    // 166 Sure Strike
    // 167 Swashbuckling
    // 168 Thrash of Raptors
    // 169 Tilonalli's Knight
    // 170 Tilonalli's Skinshifter
    // 171 Trove of Temptation
    // 172 Unfriendly Fire
    // 173 Vance's Blasting Cannons // Spitfire Bastion
    // 174 Wily Goblin
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
        blossomDryad.addTargetedActivatedAbility(
            cost: Cost("", tap: true),
            restriction: { return $0.isType(.Land) },
            effect: { target in target.untap() })
        blossomDryad.setFlavorText("The only force on Ixalan not interested in finding the golden city is Ixalan itself.")
        blossomDryad.power = 2
        blossomDryad.toughness = 2
        return blossomDryad
    }
    // 179 Carnage Tyrant
    // 180 Colossal Dreadmaw
    // 181 Commune with Dinosaurs
    // 182 Crash the Ramparts
    // 183 Crushing Canopy
    // 184 Deathgorge Scavenger
    // 185 Deeproot Champion
    // 186 Deeproot Warrior
    // 187 Drover of the Mighty
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
    // 193 Ixalli's Keeper
    // 194 Jade Guardian
    // 195 Jungle Delver
    // 196 Kumena's Speaker
    // 197 Merfolk Branchwalker
    // 198 New Horizons
    // 199 Old Growth Dryads
    // 200 Pounce
    // 201 Ranging Raptors
    // 202 Ravenous Daggertooth
    // 203 Ripjaw Raptor
    // 204 River Heralds' Boon
    // 205 Savage Stomp
    // 206 Shaper's Sanctuary
    static func SliceInTwain() -> Card {
        let sliceInTwain = Card(name: "Slice in Twain", rarity: .Uncommon, set: set, number: 207)
        sliceInTwain.setManaCost("2GG")
        sliceInTwain.setType(.Instant)
        sliceInTwain.addTargetedEffect(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
            effect: { target in
                target.destroy()
                sliceInTwain.getController().drawCard()
        })
        sliceInTwain.setFlavorText("The magic of the River Heralds is so great that even a single shaman can fend off a pirate landing party.")
        return sliceInTwain
    }
    // 208 Snapping Sailback
    // 209 Spike-Tailed Ceratops
    // 210 Thundering Spineback
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
        callToTheFeast.addUntargetedEffect({
            callToTheFeast.getController().createToken(Vampire())
            callToTheFeast.getController().createToken(Vampire())
            callToTheFeast.getController().createToken(Vampire())
        })
        callToTheFeast.setFlavorText("By the law of church and crown, vampires feed only on the blood of the guilty--those declared heretics, rebels, or enemies of war.")
        return callToTheFeast
    }
    // 220 Deadeye Plunderers
    static func DireFleetCaptain() -> Card {
        let direFleetCaptain = Card(name: "Dire Fleet Captain", rarity: .Uncommon, set: set, number: 221)
        direFleetCaptain.setManaCost("BR")
        direFleetCaptain.setType(.Creature, .Orc, .Pirate)
        direFleetCaptain.addUntargetedTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { direFleetCaptain.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                let numPirates = object.getController().getCreatures().filter({ return $0.isType(.Pirate) && $0.attacking }).count
                object.power = object.getBasePower() + numPirates
                object.toughness = object.getBaseToughness() + numPirates
                return object
            }))
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
    // 226 Raging Swordtooth
    // 227 Regisaur Alpha
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
    // 240 Hierophant's Chalice
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
    // 252 Dragonskull Summit
    // 253 Drowned Catacomb
    // 254 Field of Ruin
    // 255 Glacial Fortress
    // 256 Rootbound Crag
    // 257 Sunpetal Grove
    // 258 Unclaimed Territory
    // 259 Unknown Shores
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
    // 5 Dinosaur
    // 6 Plant
    // 7 - 10, Treasure
}
