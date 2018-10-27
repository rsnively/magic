import Foundation

enum GRN {
    static var set = "grn"
    static var count = 259
    
    static func Mentor(_ source: Object) -> TriggeredAbility {
        return TargetedTriggeredAbility(
            source: source,
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0.attacking && $0.getPower() < source.getPower() },
                effect: { $0.addCounter(.PlusOnePlusOne) }))
    }

    static func BladeInstructor() -> Card {
        let bladeInstructor = Card(name: "Blade Instructor", rarity: .Common, set: set, number: 1)
        bladeInstructor.setManaCost("2W")
        bladeInstructor.setType(.Creature, .Human, .Soldier)
        bladeInstructor.triggeredAbilities.append(Mentor(bladeInstructor));
        bladeInstructor.setFlavorText("\"Watch carefully. The gap between death and victory is thinner than your blade.\"")
        bladeInstructor.power = 3
        bladeInstructor.toughness = 1
        return bladeInstructor
    }
    // 2 Bounty Agent
    // 3 Candlelight Vigil
    static func CitywideBust() -> Card {
        let citywideBust = Card(name: "Citywide Bust", rarity: .Rare, set: set, number: 4)
        citywideBust.setManaCost("1WW")
        citywideBust.setType(.Sorcery)
        citywideBust.addEffect {
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach { creature in
                    if creature.getToughness() >= 4 {
                        player.destroyPermanent(creature)
                    }
                }
            })
        }
        citywideBust.setFlavorText("\"Oh, you fellas are going to love the lockup. Excellent gruel. Very low ceilings.\"\n--Libuse, Boros sergeant")
        return citywideBust
    }
    static func CageTheCulprit() -> Card {
        let cageTheCulprit = Card(name: "Cage the Culprit", rarity: .Common, set: set, number: 5)
        cageTheCulprit.setManaCost("3W")
        cageTheCulprit.setType(.Instant)
        cageTheCulprit.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && $0.getToughness() >= 4 },
            effect: { target in target.destroy() }))
        cageTheCulprit.setFlavorText("\"Reports of Gruul rioters in four districts. Start with the big ones and work your way up.\"\n--Libuse, Boros sergeant")
        return cageTheCulprit
    }
    // 6 Conclave Tribunal
    // 7 Crush Contraband
    // 8 Dawn of Hope
    // 9 Demotion
    // 10 Divine Visitation
    // 11 Flight of Equenauts
    // 12 Gird for Battle
    // 13 Haazda Marshal
    static func HealersHawk() -> Card {
        let healersHawk = Card(name: "Healer's Hawk", rarity: .Common, set: set, number: 14)
        healersHawk.setManaCost("W")
        healersHawk.setType(.Creature, .Bird)
        healersHawk.flying = true
        healersHawk.lifelink = true
        healersHawk.setFlavorText("The wounded see the glow of its vials long before they see its wings diving out of the clouds.")
        healersHawk.power = 1
        healersHawk.toughness = 1
        return healersHawk
    }
    static func HuntedWitness() -> Card {
        let huntedWitness = Card(name: "Hunted Witness", rarity: .Common, set: set, number: 15)
        huntedWitness.setManaCost("W")
        huntedWitness.setType(.Creature, .Human)
        huntedWitness.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { huntedWitness.getController().createToken(Soldier()) })
        huntedWitness.setFlavorText("He ferried weapons, spells, exotic animals--but his most dangerous cargo was the truth.")
        huntedWitness.power = 1
        huntedWitness.toughness = 1
        return huntedWitness
    }
    static func InspiringUnicorn() -> Card {
        let inspiringUnicorn = Card(name: "Inspiring Unicorn", rarity: .Uncommon, set: set, number: 16)
        inspiringUnicorn.setManaCost("2WW")
        inspiringUnicorn.setType(.Creature, .Unicorn)
        inspiringUnicorn.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: {
                inspiringUnicorn.getController().getCreatures().forEach({ creature in
                    creature.pump(1, 1)
                })
            })
        inspiringUnicorn.setFlavorText("There are two lives: the life you live before you see a unicorn, and the life you live after.")
        inspiringUnicorn.power = 2
        inspiringUnicorn.toughness = 2
        return inspiringUnicorn
    }
    // 17 Intrusive Packbeast
    // 18 Ledev Guardian
    static func LightOfTheLegion() -> Card {
        let lightOfTheLegion = Card(name: "Light of the Legion", rarity: .Rare, set: set, number: 19)
        lightOfTheLegion.setManaCost("4WW")
        lightOfTheLegion.setType(.Creature, .Angel)
        lightOfTheLegion.flying = true
        lightOfTheLegion.triggeredAbilities.append(Mentor(lightOfTheLegion))
        lightOfTheLegion.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { lightOfTheLegion.getController().getCreatures().filter({ $0.isColor(.White) }).forEach({ $0.addCounter(.PlusOnePlusOne)} )})
        lightOfTheLegion.power = 5
        lightOfTheLegion.toughness = 5
        return lightOfTheLegion
    }
    // 20 Loxodon Recruiter
    // 21 Luminous Bonds
    static func ParhelionPatrol() -> Card {
        let parhelionPatrol = Card(name: "Parhelion Patrol", rarity: .Common, set: set, number: 22)
        parhelionPatrol.setManaCost("3W")
        parhelionPatrol.setType(.Creature, .Human, .Knight)
        parhelionPatrol.flying = true
        parhelionPatrol.vigilance = true
        parhelionPatrol.triggeredAbilities.append(Mentor(parhelionPatrol))
        parhelionPatrol.setFlavorText("\"Too many have disappeared in these dark days. I am the light that will lead them home.\"")
        parhelionPatrol.power = 2
        parhelionPatrol.toughness = 3
        return parhelionPatrol
    }
    static func RighteousBlow() -> Card {
        let righteousBlow = Card(name: "Righteous Blow", rarity: .Common, set: set, number: 23)
        righteousBlow.setManaCost("W")
        righteousBlow.setType(.Instant)
        righteousBlow.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && ($0.attacking || $0.blocking) },
            effect: { target in righteousBlow.damage(to: target, 2) }))
        righteousBlow.setFlavorText("\"The Golgari believe they should be given what they deserve. On this we agree.\"\n--Tajic")
        return righteousBlow
    }
    static func RocCharger() -> Card {
        let rocCharger = Card(name: "Roc Charger", rarity: .Uncommon, set: set, number: 24)
        rocCharger.setManaCost("2W")
        rocCharger.setType(.Creature, .Bird)
        rocCharger.flying = true
        rocCharger.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.attacking && $0.isType(.Creature) && !$0.flying },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.flying = true
                    return object
                }))
            }))
        rocCharger.setFlavorText("Rocs' innate fearlessness makes them ideal mounts for emergency response.")
        rocCharger.power = 1
        rocCharger.toughness = 3
        return rocCharger
    }
    // 25 Skyline Scout
    // 26 Sunhome Stalwart
    static func SwornCompanions() -> Card {
        let swornCompanions = Card(name: "Sworn Companions", rarity: .Common, set: set, number: 27)
        swornCompanions.setManaCost("2W")
        swornCompanions.setType(.Sorcery)
        swornCompanions.addEffect({
            swornCompanions.getController().createToken(Soldier())
            swornCompanions.getController().createToken(Soldier())
        })
        swornCompanions.setFlavorText("\"The trouble with youths these days is that, in outright defiance of their elders, they refuse to be bought.\"\n--Karlov of the Ghost Council")
        return swornCompanions
    }
    static func TakeHeart() -> Card {
        let takeHeart = Card(name: "Take Heart", rarity: .Common, set: set, number: 28)
        takeHeart.setManaCost("W")
        takeHeart.setType(.Instant)
        takeHeart.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.pump(2, 2)
                takeHeart.getController().gainLife(takeHeart.getController().getCreatures().filter({$0.attacking}).count)
        }))
        takeHeart.setFlavorText("In the quiet before a battle, Boros soldiers whisper prayers that steady their nerves and focus their minds.")
        return takeHeart
    }
    static func TenthDistrictGuard() -> Card {
        let tenthDistrictGuard = Card(name: "Tenth District Guard", rarity: .Common, set: set, number: 29)
        tenthDistrictGuard.setManaCost("1W")
        tenthDistrictGuard.setType(.Creature, .Human, .Soldier)
        tenthDistrictGuard.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Creature) },
                effect: { $0.pump(0, 1) }))
        tenthDistrictGuard.setFlavorText("\"The Tenth has always been my home. This city is constantly embroiled in one crisis or another, but I'm determined to protect my piece.\"")
        tenthDistrictGuard.power = 2
        tenthDistrictGuard.toughness = 2
        return tenthDistrictGuard
    }
    // 30 Venerated Loxodon
    // 31 Capture Sphere
    // 32 Chemister's Insight
    // 33 Citywatch Sphinx
    // 34 Dazzling Lights
    // 35 Devious Cover-Up
    // 36 Dimir Informant
    // 37 Disdainful Stroke
    // 38 Dream Eater
    // 39 Drowned Secrets
    // 40 Enhanced Surveillance
    // 41 Guild Summit
    // 42 Leapfrog
    // 43 Maximize Altitude
    // 44 Mission Briefing
    static func MurmuringMystic() -> Card {
        let murmuringMystic = Card(name: "Murmuring Mystic", rarity: .Uncommon, set: set, number: 45)
        murmuringMystic.setManaCost("3U")
        murmuringMystic.setType(.Creature, .Human, .Wizard)
        murmuringMystic.addTriggeredAbility(
            trigger: .CastInstantOrSorcery,
            effect: { murmuringMystic.getController().createToken(BirdIllusion()) })
        murmuringMystic.setFlavorText("Rumors float through the city like crows, alighting on citizens seemingly at random.")
        murmuringMystic.power = 1
        murmuringMystic.toughness = 5
        return murmuringMystic
    }
    static func MuseDrake() -> Card {
        let museDrake = Card(name: "Muse Drake", rarity: .Common, set: set, number: 46)
        museDrake.setManaCost("3U")
        museDrake.setType(.Creature, .Drake)
        museDrake.flying = true
        museDrake.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { museDrake.getController().drawCard() })
        museDrake.setFlavorText("A composer wrote a symphony based on the drakes screeching outside her window. Reviews were mixed--except among the drakes.")
        museDrake.power = 1
        museDrake.toughness = 3
        return museDrake
    }
    // 47 Narcomeba
    // 48 Nightveil Sprite
    // 49 Omnispell Adept
    // 50 Passwall Adept
    // 51 Quasiduplicate
    // 52 Radical Idea
    // 53 Selective Snare
    // 54 Sinister Sabotage
    // 55 Thoughtbound Phantasm
    // 56 Unexplained Disappearance
    static func VedalkenMesmerist() -> Card {
        let vedalkenMesmerist = Card(name: "Vedalken Mesmerist", rarity: .Common, set: set , number: 57)
        vedalkenMesmerist.setManaCost("1U")
        vedalkenMesmerist.setType(.Creature, .Vedalken, .Wizard)
        vedalkenMesmerist.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Creature) &&  $0.getController() !== vedalkenMesmerist.getController()},
                effect: { $0.pump(-2, 0) }))
        vedalkenMesmerist.setFlavorText("\"There's no need to sound the alarm. You are minding your post admirably. I am authorized. All is well.\"")
        vedalkenMesmerist.power = 2
        vedalkenMesmerist.toughness = 1
        return vedalkenMesmerist
    }
    static func WallOfMist() -> Card {
        let wallOfMist = Card(name: "Wall of Mist", rarity: .Common, set: set, number: 58)
        wallOfMist.setManaCost("1U")
        wallOfMist.setType(.Creature, .Wall)
        wallOfMist.defender = true
        wallOfMist.setFlavorText("Fog haunts the streets, rendering the familiar otherworldly, changing neighbors into shadows, and muffling cries for help.")
        wallOfMist.power = 0
        wallOfMist.toughness = 5
        return wallOfMist
    }
    // 59 Watcher in the Mist
    static func WishcoinCrab() -> Card {
        let wishcoinCrab = Card(name: "Wishcoin Crab", rarity: .Common, set: set, number: 60)
        wishcoinCrab.setManaCost("3U")
        wishcoinCrab.setType(.Creature, .Crab)
        wishcoinCrab.setFlavorText("\"What wishes do they grant? Mostly pinching-related ones.\"\n--Omik, superintendant of waterworks")
        wishcoinCrab.power = 2
        wishcoinCrab.toughness = 5
        return wishcoinCrab
    }
    // 61 Barrier of Bones
    static func BartizanBats() -> Card {
        let bartizanBats = Card(name: "Bartizan Bats", rarity: .Common, set: set, number: 62)
        bartizanBats.setManaCost("3B")
        bartizanBats.setType(.Creature, .Bat)
        bartizanBats.flying = true
        bartizanBats.setFlavorText("\"Bats are welcome to eat thousands of my pets. I have multitudes more that will ultimately eat the bats.\"\n--Izoni")
        bartizanBats.power = 3
        bartizanBats.toughness = 1
        return bartizanBats
    }
    // 63 Blood Operative
    // 64 Burglar Rat
    static func ChildOfNight() -> Card {
        let childOfNight = Card(name: "Child of Night", rarity: .Common, set: set, number: 65)
        childOfNight.setManaCost("1B")
        childOfNight.setType(.Creature, .Vampire)
        childOfNight.lifelink = true
        childOfNight.setFlavorText("No guilds -- that is her rule. The House vampires unnerve her. The Combine would dissect her, the Legion burn her, the Conclave \"cure\" her. The shadows are all the family she needs.")
        childOfNight.power = 2
        childOfNight.toughness = 1
        return childOfNight
    }
    // 66 Creeping Chill
    // 67 Dead Weight
    // 68 Deadly Visit
    // 69 Doom Whisperer
    static func DouserOfLights() -> Card {
        let douserOfLights = Card(name: "Douser of Lights", rarity: .Common, set: set, number: 70)
        douserOfLights.setManaCost("4B")
        douserOfLights.setType(.Creature, .Horror)
        douserOfLights.setFlavorText("The party of Rakdos revelers cackled and capered as the thing approached. It hissed, and they jabbed their torches at it, giggling when it recoiled. Then, one by one, the torches went out -- and the screaming began.")
        douserOfLights.power = 4
        douserOfLights.toughness = 5
        return douserOfLights
    }
    // 71 Gruesome Menagerie
    static func HiredPoisoner() -> Card {
        let hiredPoisoner = Card(name: "Hired Poisoner", rarity: .Common, set: set, number: 72)
        hiredPoisoner.setManaCost("B")
        hiredPoisoner.setType(.Creature, .Human, .Assassin)
        hiredPoisoner.deathtouch = true
        hiredPoisoner.setFlavorText("\"They don't even feel the cut. I'm ordering a drink in a nearby tavern before anyone notices something's wrong.\"")
        hiredPoisoner.power = 1
        hiredPoisoner.toughness = 1
        return hiredPoisoner
    }
    // 73 Kraul Swarm
    // 74 Lotleth Giant
    // 75 Mausoleum Secrets
    // 76 Mephitic Vapors
    // 77 Midnight Repear
    // 78 Moodmark Painter
    // 79 Necrotic Wound
    // 80 Never Happened
    // 81 Pilfering Imp
    // 82 Plaguecrafter
    // 83 Price of Fame
    static func RitualOfSoot() -> Card {
        let ritualOfSoot = Card(name: "Ritual of Soot", rarity: .Rare, set: set, number: 84)
        ritualOfSoot.setManaCost("2BB")
        ritualOfSoot.setType(.Sorcery)
        ritualOfSoot.addEffect {
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach { creature in
                    if creature.getConvertedManaCost() <= 3 {
                        player.destroyPermanent(creature)
                    }
                }
            })
        }
        ritualOfSoot.setFlavorText("Only the patrol's armor was found, so tainted with the acrid smell of sudden death that it could never be worn again.")
        return ritualOfSoot
    }
    // 85 Severed Strands
    static func SpinalCentipede() -> Card {
        let spinalCentipede = Card(name: "Spinal Centipede", rarity: .Common, set: set, number: 86)
        spinalCentipede.setManaCost("2B")
        spinalCentipede.setType(.Creature, .Insect)
        spinalCentipede.addTriggeredAbility(
            trigger: .ThisDies,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0.getController() === spinalCentipede.getController() },
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        spinalCentipede.setFlavorText("The Golgari adorn themselves with the exoskeletons of iridescent insects. It's only fair the insects do likewise.")
        spinalCentipede.power = 3
        spinalCentipede.toughness = 2
        return spinalCentipede
    }
    // 87 Undercity Necrolisk
    static func VeiledShade() -> Card {
        let veiledShade = Card(name: "Veiled Shade", rarity: .Common, set: set, number: 88)
        veiledShade.setManaCost("2B")
        veiledShade.setType(.Creature, .Shade)
        veiledShade.addActivatedAbility(
            string: "{1}{B}: ~ gets +1/+1 until end of turn.",
            cost: Cost("1B"),
            effect: { veiledShade.pump(1, 1) })
        veiledShade.setFlavorText("\"I sang songs of sorrow for my lost love. Imagine my horror when, one night, they were answered.\"\n--Milana, Orzgov prelate")
        veiledShade.power = 2
        veiledShade.toughness = 2
        return veiledShade
    }
    // 89 Vicious Rumors
    // 90 Whispering Snitch
    // 91 Arclight Phoenix
    static func BargingSergeant() -> Card {
        let bargingSergeant = Card(name: "Barging Sergeant", rarity: .Common, set: set, number: 92)
        bargingSergeant.setManaCost("4R")
        bargingSergeant.setType(.Creature, .Minotaur, .Soldier)
        bargingSergeant.haste = true
        bargingSergeant.triggeredAbilities.append(Mentor(bargingSergeant))
        bargingSergeant.setFlavorText("\"Don't stop till your horns come out their back.\"")
        bargingSergeant.power = 4
        bargingSergeant.toughness = 2
        return bargingSergeant
    }
    // 93 Book Devourer
    static func CommandTheStorm() -> Card {
        let commandTheStorm = Card(name: "Command the Storm", rarity: .Common, set: set, number: 94)
        commandTheStorm.setManaCost("4R")
        commandTheStorm.setType(.Instant)
        commandTheStorm.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in commandTheStorm.damage(to: target, 5) }))
        commandTheStorm.setFlavorText("In the wake of Niv-Mizzet's disappearance, Ral found himself leading the guild. He had dreamed of this day, but couldn't help feeling like a pawn in someone else's game.")
        return commandTheStorm
    }
    // 95 Cosmotronic Wave
    // 96 Direct Current
    static func ElectrostaticField() -> Card {
        let electrostaticField = Card(name: "Electrostatic Field", rarity: .Uncommon, set: set, number: 97)
        electrostaticField.setManaCost("1R")
        electrostaticField.setType(.Creature, .Wall)
        electrostaticField.defender = true
        electrostaticField.addTriggeredAbility(
            trigger: .CastInstantOrSorcery,
            effect: { electrostaticField.damage(to: electrostaticField.getOpponent(), 1) })
        electrostaticField.setFlavorText("\"It's both an ingress-denial mechanism and an attractive hallway light!\"\n--Daxiver, Izzet electromancer")
        electrostaticField.power = 0
        electrostaticField.toughness = 4
        return electrostaticField
    }
    // 98 Erratic Cyclops
    // 99 Experimental Frenzy
    static func FearlessHalberdier() -> Card {
        let fearlessHalberdier = Card(name: "Fearless Halberdier", rarity: .Common, set: set, number: 100)
        fearlessHalberdier.setManaCost("2R")
        fearlessHalberdier.setType(.Creature, .Human, .Warrior)
        fearlessHalberdier.setFlavorText("\"I spent some time in the Legion, but I'm done taking orders all  day.\"")
        fearlessHalberdier.power = 3
        fearlessHalberdier.toughness = 2
        return fearlessHalberdier
    }
    // 101 Fire Urchin
    static func GoblinBanneret() -> Card {
        let goblinBanneret = Card(name: "Goblin Banneret", rarity: .Uncommon, set: set, number: 102)
        goblinBanneret.setManaCost("R")
        goblinBanneret.setType(.Creature, .Goblin, .Soldier)
        goblinBanneret.triggeredAbilities.append(Mentor(goblinBanneret))
        goblinBanneret.addActivatedAbility(
            string: "{1}{R}: ~ gets +2/+0 until end of turn.",
            cost: Cost("1R"),
            effect: { goblinBanneret.pump(2, 0) })
        goblinBanneret.setFlavorText("The Boros banner stands tall even if its bearer doesn't.")
        goblinBanneret.power = 1
        goblinBanneret.toughness = 1
        return goblinBanneret
    }
    // 103 Golin Cratermaker
    // 104 Goblin Locksmith
    // 105 Gravitic Punch
    static func HellkiteWhelp() -> Card {
        let hellkiteWhelp = Card(name: "Hellkite Whelp", rarity: .Uncommon, set: set, number: 106)
        hellkiteWhelp.setManaCost("4R")
        hellkiteWhelp.setType(.Creature, .Dragon)
        hellkiteWhelp.flying = true
        hellkiteWhelp.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.getController() !== hellkiteWhelp.getController() },
                effect: { target in hellkiteWhelp.damage(to: target, 1) }))
        hellkiteWhelp.setFlavorText("\"They play by spitting fire at each other. Don't be offended if one gives you a love-scorch.\"\n--Esfir, Rakdos drangon wrangler")
        hellkiteWhelp.power = 3
        hellkiteWhelp.toughness = 3
        return hellkiteWhelp
    }
    // 107 Inescapable Blaze
    // 108 Lava Coil
    // 109 Legion Warboss
    // 110 Maniacal Rage
    // 111 Maximize Velocity
    // 112 Ornery Goblin
    // 113 Risk Factor
    static func RubblebeltBoar() -> Card {
        let rubblebeltBoar = Card(name: "Rubblebelt Boar", rarity: .Common, set: set, number: 114)
        rubblebeltBoar.setManaCost("3R")
        rubblebeltBoar.setType(.Creature, .Boar)
        rubblebeltBoar.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Creature) },
                effect: { $0.pump(2, 0) }))
        rubblebeltBoar.setFlavorText("Some Gruul druis believe that boars are spawn of the great Illharg, the mighty Raze-Boar who will one day rise and level the city.")
        rubblebeltBoar.power = 3
        rubblebeltBoar.toughness = 3
        return rubblebeltBoar
    }
    // 115 Runaway Steam-Kin
    // 116 Smelt-Ward Minotaur
    // 117 Street Riot
    // 118 Sure Strike
    // 119 Torch Courier
    // 120 Wojek Bodyguard
    // 121 Affectionate Indrik
    // 122 Arboretum Elemental
    static func BeastWhisperer() -> Card {
        let beastWhisperer = Card(name: "Beast Whisperer", rarity: .Rare, set: set, number: 123)
        beastWhisperer.setManaCost("2GG")
        beastWhisperer.setType(.Creature, .Elf, .Druid)
        beastWhisperer.addTriggeredAbility(
            trigger: .CastCreatureSpell,
            effect: { beastWhisperer.getController().drawCard() })
        beastWhisperer.setFlavorText("\"The tiniest mouse speaks louder to me than all the festival crowds on Tin Street.\"")
        beastWhisperer.power = 2
        beastWhisperer.toughness = 3
        return beastWhisperer
    }
    static func BountyOfMight() -> Card {
        let bountyOfMight = Card(name: "Bounty of Might", rarity: .Rare, set: set, number: 124)
        bountyOfMight.setManaCost("4GG")
        bountyOfMight.setType(.Instant)
        bountyOfMight.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) }, { $0.isType(.Creature) }, { $0.isType(.Creature) }],
            effect: { targets in
                for target in targets {
                    target.pump(3, 3)
                }
            }))
        bountyOfMight.setFlavorText("\"I am the very soul of battle, but even I would never advise open war with the Conclave.\"\n--Aurelia")
        return bountyOfMight
    }
    // 125 Circuitous Route
    // 126 Crushing Canopy
    static func DevkarinDissident() -> Card {
        let devkarinDissident = Card(name: "Devkarin Dissident", rarity: .Common, set: set, number: 127)
        devkarinDissident.setManaCost("1G")
        devkarinDissident.setType(.Creature, .Elf, .Warrior)
        devkarinDissident.addActivatedAbility(
            string: "{4}{G}: ~ gets +2/+2 until end of turn.",
            cost: Cost("4G"),
            effect: { devkarinDissident.pump(2, 2) })
        devkarinDissident.setFlavorText("\"This is Mileva, in the Tenth. We've got an elf in the plaza with a chip on her shoulder. Actually, it's more of a morningstar.\"")
        devkarinDissident.power = 2
        devkarinDissident.toughness = 2
        return devkarinDissident
    }
    // 128 District Guide
    static func GenerousStray() -> Card {
        let generousStray = Card(name: "Generous Stray", rarity: .Common, set: set, number: 129)
        generousStray.setManaCost("2G")
        generousStray.setType(.Creature, .Cat)
        generousStray.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { generousStray.getController().drawCard() })
        generousStray.setFlavorText("Cats place their gifts with care, so that a bare foot will step on them in the middle of the night.")
        generousStray.power = 1
        generousStray.toughness = 2
        return generousStray
    }
    // 130 Golgari Raiders
    // 131 Grappling Sundew
    // 132 Hatchery Spider
    static func HitchclawRecluse() -> Card {
        let hitchlawRecluse = Card(name: "Hitchclaw Recluse", rarity: .Common, set: set, number: 133)
        hitchlawRecluse.setManaCost("2G")
        hitchlawRecluse.setType(.Creature, .Spider)
        hitchlawRecluse.reach = true
        hitchlawRecluse.setFlavorText("Nearly invisible strands of web reach far beyond its lair to alert it of the approach of prey.")
        hitchlawRecluse.power = 1
        hitchlawRecluse.toughness = 4
        return hitchlawRecluse
    }
    static func IronshellBeetle() -> Card {
        let ironshellBeetle = Card(name: "Ironshell Beetle", rarity: .Common, set: set, number: 134)
        ironshellBeetle.setManaCost("1G")
        ironshellBeetle.setType(.Creature, .Insect)
        ironshellBeetle.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) },
                effect: { $0.addCounter(.PlusOnePlusOne) }))
        ironshellBeetle.setFlavorText("\"Please don't feed the beetles.\"\n--Promenade warning sign")
        ironshellBeetle.power = 1
        ironshellBeetle.toughness = 1
        return ironshellBeetle
    }
    static func KraulForagers() -> Card {
        let kraulForagers = Card(name: "Kraul Foragers", rarity: .Common, set: set, number: 135)
        kraulForagers.setManaCost("4G")
        kraulForagers.setType(.Creature, .Insect, .Scout)
        kraulForagers.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                let creaturesInGraveyard = kraulForagers.getController().getGraveyard().filter({$0.isType(.Creature)}).count
                kraulForagers.getController().gainLife(creaturesInGraveyard)
            })
        kraulForagers.setFlavorText("Feed on food, you eventually rot. Feed on rot, you live forever.\n--Kraul saying")
        kraulForagers.power = 4
        kraulForagers.toughness = 4
        return kraulForagers
    }
    // 136 Kraul Harpooner
    static func MightOfTheMasses() -> Card {
        let mightOfTheMasses = Card(name: "Might of the Masses", rarity: .Uncommon, set: set, number: 137)
        mightOfTheMasses.setManaCost("G")
        mightOfTheMasses.setType(.Instant)
        mightOfTheMasses.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    let x = mightOfTheMasses.getController().getCreatures().count
                    object.power = object.getBasePower() + x
                    object.toughness = object.getBaseToughness() + x
                    return object
                }))
        }))
        mightOfTheMasses.setFlavorText("\"There is nothing stronger than many hearts united for a single cause.\"\n--Emmara")
        return mightOfTheMasses
    }
    // 138 Nullhide Ferox
    // 139 Pack's Favor
    // 140 Pause for Reflection
    // 141 Pelt Collector
    // 142 Portcullis Vine
    static func PreyUpon() -> Card {
        let preyUpon = Card(name: "Prey Upon", rarity: .Common, set: set, number: 143)
        preyUpon.setManaCost("G")
        preyUpon.setType(.Sorcery)
        preyUpon.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) && $0.getController() === preyUpon.getController() },
                           { $0.isType(.Creature) && $0.getController() !== preyUpon.getController() }],
            effect: { targets in targets[0].fight(targets[1]) }))
        preyUpon.setFlavorText("\"Light up the dark to find your way, and the dark may seek you out.\"\n--Zalin the Gutter Bard")
        return preyUpon
    }
    // 144 Siege Wurm
    // 145 Sprouting Renewal
    // 146 Urban Utopia
    // 147 Vigorspore Wurm
    // 148 Vivid Revival
    static func WaryOkapi() -> Card {
        let waryOkapi = Card(name: "Wary Okapi", rarity: .Common, set: set, number: 149)
        waryOkapi.setManaCost("2G")
        waryOkapi.setType(.Creature, .Antelope)
        waryOkapi.vigilance = true
        waryOkapi.setFlavorText("\"Be like the grazers of the Saruli. Keep your herd close, and stay alert for encroaching danger.\"\n--Lalia, Selesnya dryad")
        waryOkapi.power = 3
        waryOkapi.toughness = 2
        return waryOkapi
    }
    static func WildCeratok() -> Card {
        let wildCeratok = Card(name: "Wild Ceratok", rarity: .Common, set: set, number: 150)
        wildCeratok.setManaCost("3G")
        wildCeratok.setType(.Creature, .Rhino)
        wildCeratok.setFlavorText("Once part of a wealthy merchant's private zoo, the herd roams feral throughout the Tenth, where it will remain until the guilds can agree to relocate, cull, or befriend it.")
        wildCeratok.power = 4
        wildCeratok.toughness = 3
        return wildCeratok
    }
    // 151 Artful Takedown
    // 152 Assassin's Trophy
    // 153 Aurelia, Exemplar of Justice
    // 154 Beacon Bolt
    // 155 Beamsplitter Mage
    static func BorosChallenger() -> Card {
        let borosChallenger = Card(name: "Boros Challenger", rarity: .Uncommon, set: set, number: 156)
        borosChallenger.setManaCost("RW")
        borosChallenger.setType(.Creature, .Human, .Soldier)
        borosChallenger.triggeredAbilities.append(Mentor(borosChallenger))
        borosChallenger.addActivatedAbility(
            string: "{2}{R}{W}: ~ gets +1/+1 until end of turn.",
            cost: Cost("2RW"),
            effect: { borosChallenger.pump(1, 1) })
        borosChallenger.setFlavorText("\"Send your champion. I could use a light workout.\"")
        borosChallenger.power = 2
        borosChallenger.toughness = 3
        return borosChallenger
    }
    static func Camaraderie() -> Card {
        let camaraderie = Card(name: "Camaraderie", rarity: .Rare, set: set, number: 157)
        camaraderie.setManaCost("4GW")
        camaraderie.setType(.Sorcery)
        camaraderie.addEffect {
            let numCreatures = camaraderie.getController().getCreatures().count
            camaraderie.getController().gainLife(numCreatures)
            camaraderie.getController().drawCards(numCreatures)
            camaraderie.getController().getCreatures().forEach({ $0.pump(1, 1) })
        }
        camaraderie.setFlavorText("\"Within the song of Mat'Selesnya, one becomes all.\"\n--Heruj, Selesnya hierophant")
        return camaraderie
    }
    static func CentaurPeacemaker() -> Card {
        let centaurPeacemaker = Card(name: "Centaur Peacemaker", rarity: .Common, set: set, number: 158)
        centaurPeacemaker.setManaCost("1GW")
        centaurPeacemaker.setType(.Creature, .Centaur, .Cleric)
        centaurPeacemaker.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { Game.shared.bothPlayers({$0.gainLife(4)}) })
        centaurPeacemaker.setFlavorText("\"Please accept this offering. I sincerely hope to leave my mace at my side.\"")
        centaurPeacemaker.power = 3
        centaurPeacemaker.toughness = 3
        return centaurPeacemaker
    }
    // 159 Chance for Glory
    // 160 Charnel Troll
    static func ConclaveCavalier() -> Card {
        let conclaveCavalier = Card(name: "ConclaveCavalier", rarity: .Uncommon, set: set, number: 161)
        conclaveCavalier.setManaCost("GGWW")
        conclaveCavalier.setType(.Creature, .Centaur, .Knight)
        conclaveCavalier.vigilance = true
        conclaveCavalier.addTriggeredAbility(
            trigger: .ThisDies,
            effect: {
                conclaveCavalier.getController().createToken(ElfKnight())
                conclaveCavalier.getController().createToken(ElfKnight())
            })
        conclaveCavalier.setFlavorText("\"Just as leaves fall and the tree blooms again, one day I will fall and the Conclave will endure.\"")
        conclaveCavalier.power = 4
        conclaveCavalier.toughness = 4
        return conclaveCavalier
    }
    // 162 Conclave Guildmage
    // 163 Crackling Drake
    // 164 Darkblade Agent
    // 165 Deafening Clarion
    // 166 Dimir Spybug
    // 167 Disinformation Campaign
    // 168 Emmara, Soul of the Accord
    // 169 Erstwhile Trooper
    // 170 Etrata, the Silencer
    // 171 Firemind's Research
    // 172 Garrison Sergeant
    // 173 Glowspore Shaman
    // 174 Goblin Electromancer
    // 175 Golgari Findbroker
    static func HammerDropper() -> Card {
        let hammerDropper = Card(name: "Hammer Dropper", rarity: .Common, set: set, number: 176)
        hammerDropper.setManaCost("2RW")
        hammerDropper.setType(.Creature, .Giant, .Soldier)
        hammerDropper.triggeredAbilities.append(Mentor(hammerDropper))
        hammerDropper.setFlavorText("Giants know a solid hit is one part strength, four parts leverage.")
        hammerDropper.power = 5
        hammerDropper.toughness = 2
        return hammerDropper
    }
    // 177 House Guildmage
    // 178 Hypothesizzle
    // 179 Ionize
    // 180 Izoni, Thousand-Eyed
    // 181 Join Shields
    static func JusticeStrike() -> Card {
        let justiceStrike = Card(name: "Justice Strike", rarity: .Uncommon, set: set, number: 182)
        justiceStrike.setManaCost("RW")
        justiceStrike.setType(.Instant)
        justiceStrike.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in target.damage(to: target, target.getPower()) }))
        justiceStrike.setFlavorText("\"Those who show no mercy to the weak deserve no mercy from the strong.\"\n--Firemane Kavrova")
        return justiceStrike
    }
    // 183 Knight of Autumn
    // 184 Lazav, the Multifarious
    // 185 League Guildmage
    // 186 Ledev Champion
    static func LegionGuildmage() -> Card {
        let legionGuildmage = Card(name: "Legion Guildmage", rarity: .Uncommon, set: set, number: 187)
        legionGuildmage.setManaCost("RW")
        legionGuildmage.setType(.Creature, .Human, .Wizard)
        legionGuildmage.addActivatedAbility(
            string: "{5}{R}, {T}: ~ deals 3 damage to each opponent.",
            cost: Cost("5R", tap: true),
            effect: { legionGuildmage.damage(to: legionGuildmage.getOpponent(), 3) })
        legionGuildmage.addActivatedAbility(
            string: "{2}{W}, {T}: Tap another target creature.",
            cost: Cost("2W", tap: true),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) && $0 !== legionGuildmage },
                effect: { $0.tap() }))
        legionGuildmage.power = 2
        legionGuildmage.toughness = 2
        return legionGuildmage
    }
    // 188 March of the Multitudes
    // 189 Mnemonic Betrayal
    // 190 Molderhulk
    // 191 Nightveil Predator
    // 192 Niv-Mizzet, Parun
    // 193 Notion Rain
    // 194 Ochran Assassin
    // 195 Ral, Izzet Viceroy
    // 196 Rhizome Lurcher
    // 197 Rosemane Centaur
    static func SkyknightLegionnaire() -> Card {
        let skyknightLegionnaire = Card(name: "Skyknight Legionnaire", rarity: .Common, set: set, number: 198)
        skyknightLegionnaire.setManaCost("1RW")
        skyknightLegionnaire.setType(.Creature, .Human, .Knight)
        skyknightLegionnaire.flying = true
        skyknightLegionnaire.haste = true
        skyknightLegionnaire.setFlavorText("Squadrons of skyknights are available for deployment around the clock, capable of reaching any district in the city within minutes.")
        skyknightLegionnaire.power = 2
        skyknightLegionnaire.toughness = 2
        return skyknightLegionnaire
    }
    // 199 Sonic Assault
    // 200 Sumala Woodshaper
    // 201 Swarm Guildmage
    static func SwathcutterGiant() -> Card {
        let swathcutterGiant = Card(name: "Swathcutter Giant", rarity: .Uncommon, set: set, number: 202)
        swathcutterGiant.setManaCost("4RW")
        swathcutterGiant.setType(.Creature, .Giant, .Soldier)
        swathcutterGiant.vigilance = true
        swathcutterGiant.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { swathcutterGiant.getOpponent().getCreatures().forEach({ swathcutterGiant.damage(to: $0, 1) }) })
        swathcutterGiant.setFlavorText("\"Now do you understand what we meant when we said disperse?\"\n--Eksari, Boros patrol leader")
        swathcutterGiant.power = 5
        swathcutterGiant.toughness = 5
        return swathcutterGiant
    }
    // 203 Swiftblade Vindicator
    // 204 Tajic, Legion's Edge
    // 205 Thief of Sanity
    // 206 Thought Erasure
    // 207 Thousand-Year Storm
    // 208 Trostani Discordant
    // 209 Truefire Captain
    static func UndercityUprising() -> Card {
        let undercityUprising = Card(name: "Undercity Uprising", rarity: .Common, set: set, number: 210)
        undercityUprising.setManaCost("2BG")
        undercityUprising.setType(.Sorcery)
        undercityUprising.addEffect(TargetedEffect.MultiObject(
            restrictions: [{ $0.isType(.Creature) && $0.getController() === undercityUprising.getController() },
                           { $0.isType(.Creature) && $0.getController() !== undercityUprising.getController() }],
            effect: { targets in
                undercityUprising.getController().getCreatures().forEach({ creature in
                    creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                        object.deathtouch = true
                        return object
                    }))
                })
                targets[0].fight(targets[1])
        }))
        undercityUprising.setFlavorText("\"Now it's your turn to hide.\"\n--Vraska")
        return undercityUprising
    }
    // 211 Underrealm Lich
    // 212 Unmoored Ego
    // 213 Vraska, Golgari Queen
    static func WeeDragonauts() -> Card {
        let weeDragonauts = Card(name: "Wee Dragonauts", rarity: .Uncommon, set: set, number: 214)
        weeDragonauts.setManaCost("1UR")
        weeDragonauts.setType(.Creature, .Faerie, .Wizard)
        weeDragonauts.flying = true
        weeDragonauts.addTriggeredAbility(
            trigger: .CastInstantOrSorcery,
            effect: { weeDragonauts.pump(2, 0) })
        weeDragonauts.setFlavorText("\"Something's causing electrospheric disruption in the blazekite's spire-vanes. Find the cause, and tell them to keep it up!\"\n--Juzba, Izzet tinker.")
        weeDragonauts.power = 1
        weeDragonauts.toughness = 3
        return weeDragonauts
    }
    // 215 Worldsoul Colossus
    // 216 Fresh-Faced Recruit
    // 217 Piston-Fist Cyclops
    // 218 Pitiless Gorgon
    // 219 Vernadi Shieldmate
    // 220 Whisper Agent
    // 221 Assure // Assemble
    // 222 Connive // Concoct
    // 223 Discovery // Dispersal
    // 224 Expansion // Explosion
    // 225 Find // Finality
    // 226 Flower // Flourish
    // 227 Integrity // Intervention
    // 228 Invert // Invent
    // 229 Response // Resurgence
    // 230 Status // Statue
    // 231 Boros Locket
    // 232 Chamber Sentry
    // 233 Chromatic Lantern
    // 234 Dimir Locket
    // 235 Gatekeeper Gargoyle
    // 236 Glaive of the Guildpact
    // 237 Golgari Locket
    // 238 Izzet Locket
    // 239 Rampaging Monument
    // 240 Selsnya Locket
    // 241 Silent Dart
    // 242 Wand of Verterae
    static func BorosGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? BorosGuildgate243() : BorosGuildgate244()
    }
    static func BorosGuildgate243() -> Card {
        let borosGuildgate = Card(name: "Boros Guildgate", rarity: .Common, set: set, number: 243)
        borosGuildgate.setManaCost("")
        borosGuildgate.setType(.Land, .Gate)
        borosGuildgate.entersTapped = true
        borosGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost("", tap: true),
            effect: { borosGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        borosGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
            effect: { borosGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        borosGuildgate.setFlavorText("\"The more trust breaks down, the more we must throw open the front gates.\"\n--Aurelia")
        return borosGuildgate
    }
    static func BorosGuildgate244() -> Card {
        let borosGuildgate = Card(name: "Boros Guildgate", rarity: .Common, set: set, number: 244)
        borosGuildgate.setManaCost("")
        borosGuildgate.setType(.Land, .Gate)
        borosGuildgate.entersTapped = true
        borosGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost("", tap: true),
            effect: { borosGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        borosGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
            effect: { borosGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        borosGuildgate.setFlavorText("\"It is our duty to protect all those in need. But the other guilds have never shown themselves worthy of that protection.\"\n--Tajic")
        return borosGuildgate
    }
    static func DimirGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? DimirGuildgate245() : DimirGuildgate246()
    }
    static func DimirGuildgate245() -> Card {
        let dimirGuildgate = Card(name: "Dimir Guildgate", rarity: .Common, set: set, number: 245)
        dimirGuildgate.setManaCost("")
        dimirGuildgate.setType(.Land, .Gate)
        dimirGuildgate.entersTapped = true
        dimirGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost("", tap: true),
            effect: { dimirGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        dimirGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
            effect: { dimirGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        dimirGuildgate.setFlavorText("\"Every guild dreads infiltration. I should know--I've been a member of all of them.\"\n--Lazav")
        return dimirGuildgate
    }
    static func DimirGuildgate246() -> Card {
        let dimirGuildgate = Card(name: "Dimir Guildgate", rarity: .Common, set: set, number: 246)
        dimirGuildgate.setManaCost("")
        dimirGuildgate.setType(.Land, .Gate)
        dimirGuildgate.entersTapped = true
        dimirGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost("", tap: true),
            effect: { dimirGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        dimirGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
            effect: { dimirGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        dimirGuildgate.setFlavorText("\"You've found this place only because you were summoned. Pray you're worthy of the invitation.\"\n--Etrata")
        return dimirGuildgate
    }
    // 247 Gateway Plaza
    static func GolgariGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? GolgariGuildgate248() : GolgariGuildgate249()
    }
    static func GolgariGuildgate248() -> Card {
        let golgariGuildgate = Card(name: "Golgari Guildgate", rarity: .Common, set: set, number: 248)
        golgariGuildgate.setManaCost("")
        golgariGuildgate.setType(.Land, .Gate)
        golgariGuildgate.entersTapped = true
        golgariGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
            effect: { golgariGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        golgariGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost("", tap: true),
            effect: { golgariGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        golgariGuildgate.setFlavorText("\"Shut the gates. In the Underrealm we will outlast the coming doom.\"\n--Vraska")
        return golgariGuildgate
    }
    static func GolgariGuildgate249() -> Card {
        let golgariGuildgate = Card(name: "Golgari Guildgate", rarity: .Common, set: set, number: 249)
        golgariGuildgate.setManaCost("")
        golgariGuildgate.setType(.Land, .Gate)
        golgariGuildgate.entersTapped = true
        golgariGuildgate.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
            effect: { golgariGuildgate.getController().addMana(color: .Black) },
            manaAbility: true)
        golgariGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost("", tap: true),
            effect: { golgariGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        golgariGuildgate.setFlavorText("\"Jarad was a friend of the Devkarin. Now we slink through neglected tunnels, befriending those who crawl them.\"\n--Izoni")
        return golgariGuildgate
    }
    // 250 Guildmages' Forum
    static func IzzetGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? IzzetGuildgate251() : IzzetGuildgate252()
    }
    static func IzzetGuildgate251() -> Card {
        let izzetGuildgate = Card(name: "Izzet Guildgate", rarity: .Common, set: set, number: 251)
        izzetGuildgate.setManaCost("")
        izzetGuildgate.setType(.Land, .Gate)
        izzetGuildgate.entersTapped = true
        izzetGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost("", tap: true),
            effect: { izzetGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        izzetGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost("", tap: true),
            effect: { izzetGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        izzetGuildgate.setFlavorText("Every laboratory buzzes with new experiments, each a piece of Ral's ambitious project.")
        return izzetGuildgate
    }
    static func IzzetGuildgate252() -> Card {
        let izzetGuildgate = Card(name: "Izzet Guildgate", rarity: .Common, set: set, number: 252)
        izzetGuildgate.setManaCost("")
        izzetGuildgate.setType(.Land, .Gate)
        izzetGuildgate.entersTapped = true
        izzetGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost("", tap: true),
            effect: { izzetGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        izzetGuildgate.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost("", tap: true),
            effect: { izzetGuildgate.getController().addMana(color: .Red) },
            manaAbility: true)
        izzetGuildgate.setFlavorText("\"Yesterday I didn't recognize my own guild. Today I see why. And for tomorrow I must be prepared.\"\n--Niv-Mizzet")
        return izzetGuildgate
    }
    // 253 Overgrown Tomb
    // 254 Sacred Foundary
    static func SelesnyaGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? SelesnyaGuildgate255() : SelesnyaGuildgate256()
    }
    static func SelesnyaGuildgate255() -> Card {
        let selesnyaGuildgate = Card(name: "Selesnya Guildgate", rarity: .Common, set: set, number: 255)
        selesnyaGuildgate.setManaCost("")
        selesnyaGuildgate.setType(.Land, .Gate)
        selesnyaGuildgate.entersTapped = true
        selesnyaGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost("", tap: true),
            effect: { selesnyaGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        selesnyaGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
            effect: { selesnyaGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        selesnyaGuildgate.setFlavorText("\"Everyone who crosses that threshold is our most cherished friend. Everyone who crosses it again is our bitterest enemy.\"\n--Trostani")
        return selesnyaGuildgate
    }
    static func SelesnyaGuildgate256() -> Card {
        let selesnyaGuildgate = Card(name: "Selesnya Guildgate", rarity: .Common, set: set, number: 256)
        selesnyaGuildgate.setManaCost("")
        selesnyaGuildgate.setType(.Land, .Gate)
        selesnyaGuildgate.entersTapped = true
        selesnyaGuildgate.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost("", tap: true),
            effect: { selesnyaGuildgate.getController().addMana(color: .Green) },
            manaAbility: true)
        selesnyaGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
            effect: { selesnyaGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        selesnyaGuildgate.setFlavorText("\"We leave our gardens open, so all may know wonder, but guarded, so all may know peace.\"\n--Emmara")
        return selesnyaGuildgate
    }
    // 257 Steam Vents
    // 258 Temple Garden
    // 259 Watery Grave
    static func Plains() -> Card {
        let plains = Card(name: "Plains", rarity: .Common, set: set, number: 260)
        plains.setManaCost("")
        plains.setType(.Basic, .Land, .Plains)
        plains.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost("", tap: true),
            effect: { plains.getController().addMana(color: .White) },
            manaAbility: true)
        return plains
    }
    static func Island() -> Card {
        let island = Card(name: "Island", rarity: .Common, set: set, number: 261)
        island.setManaCost("")
        island.setType(.Basic, .Land, .Island)
        island.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost("", tap: true),
            effect: { island.getController().addMana(color: .Blue) },
            manaAbility: true)
        return island
    }
    static func Swamp() -> Card {
        let swamp = Card(name: "Swamp", rarity: .Common, set: set, number: 262)
        swamp.setManaCost("")
        swamp.setType(.Basic, .Land, .Swamp)
        swamp.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
            effect: { swamp.getController().addMana(color: .Black) },
            manaAbility: true)
        return swamp
    }
    static func Mountain() -> Card {
        let mountain = Card(name: "Mountain", rarity: .Common, set: set, number: 263)
        mountain.setManaCost("")
        mountain.setType(.Basic, .Land, .Mountain)
        mountain.addActivatedAbility(
            string: "{T}: Add {R}.",
            cost: Cost("", tap: true),
            effect: { mountain.getController().addMana(color: .Red) },
            manaAbility: true)
        return mountain;
    }
    static func Forest() -> Card {
        let forest = Card(name: "Forest", rarity: .Common, set: set, number: 264)
        forest.setManaCost("")
        forest.setType(.Basic, .Land, .Forest)
        forest.addActivatedAbility(
            string: "{T}: Add {G}.",
            cost: Cost("", tap: true),
            effect: { forest.getController().addMana(color: .Green) },
            manaAbility: true)
        return forest;
    }

    // t1 Angel
    static func Soldier() -> Token {
        let soldier = Token(name: "Soldier", set: set, number: 2)
        soldier.colors = [Color.White]
        soldier.setType(.Creature, .Soldier)
        soldier.lifelink = true
        soldier.power = 1
        soldier.toughness = 1
        return soldier
    }
    static func BirdIllusion() -> Token {
        let birdIllusion = Token(name: "Bird Illusion", set: set, number: 3)
        birdIllusion.colors = [.Blue]
        birdIllusion.setType(.Creature, .Bird, .Illusion)
        birdIllusion.flying = true
        birdIllusion.power = 1
        birdIllusion.toughness = 1
        return birdIllusion
    }
    // t4 Gobblin
    // t5 Insect
    static func ElfKnight() -> Token {
        let elfKnight = Token(name: "Elf Knight", set: set, number: 6)
        elfKnight.colors = [Color.Green, Color.White]
        elfKnight.setType(.Creature, .Elf, .Knight)
        elfKnight.vigilance = true
        elfKnight.power = 2
        elfKnight.toughness = 2
        return elfKnight;
    }
    // t7 Ral Emblem
    // t8 Vraska Emblem
}
