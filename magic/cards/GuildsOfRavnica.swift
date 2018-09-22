import Foundation

enum GRN {
    static var set = "grn"
    static var count = 259
    
    // 1 Blade Instructor
    // 2 Bounty Agent
    // 3 Candlelight Vigil
    static func CitywideBust() -> Card {
        let citywideBust = Card(name: "Citywide Bust", rarity: .Rare, set: set, number: 4)
        citywideBust.setManaCost("1WW")
        citywideBust.setType(.Sorcery)
        citywideBust.addEffect(UntargetedEffect({_ in
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach { creature in
                    if creature.getToughness() >= 4 {
                        player.destroyPermanent(creature)
                    }
                }
            })
        }))
        citywideBust.setFlavorText("\"Oh, you fellas are going to love the lockup. Excellent gruel. Very low ceilings.\"\n--Libuse, Boros sergeant")
        return citywideBust
    }
    static func CageTheCulprit() -> Card {
        let cageTheCulprit = Card(name: "Cage the Culprit", rarity: .Common, set: set, number: 5)
        cageTheCulprit.setManaCost("3W")
        cageTheCulprit.setType(.Instant)
        cageTheCulprit.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature) && potentialTarget.getToughness() >= 4
        }, { source, target in
                target.destroy()
        }))
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
    // 14 Healer's Hawk
    // 15 Hunted Witness
    // 16 Inspiring Unicorn
    // 17 Intrusive Packbeast
    // 18 Ledev Guardian
    // 19 Light of the Legion
    // 20 Loxodon Recruiter
    // 21 Luminous Bonds
    // 22 Parhelion Patrol
    // 23 Righteous Blow
    // 24 Roc Charger
    // 25 Skyline Scout
    // 26 Sunhome Stalwart
    // 27 Sworn Companions
    // 28 Take Heart
    // 29 Tenth District Guard
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
    // 45 Murmuring Mystic
    // 46 Muse Drake
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
    // 57 Vedalken Mesmerist
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
    // 62 Bartizan Bats
    // 63 Blood Operative
    // 64 Burglar Rat
    // 65 Child of Night
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
    // 72 Hired Poisoner
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
        ritualOfSoot.addEffect(UntargetedEffect({_ in
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach { creature in
                    if creature.getConvertedManaCost() <= 3 {
                        player.destroyPermanent(creature)
                    }
                }
            })
        }))
        ritualOfSoot.setFlavorText("Only the patrol's armor was found, so tainted with the acrid smell of sudden death that it could never be worn again.")
        return ritualOfSoot
    }
    // 85 Severed Strands
    // 86 Spinal Centipede
    // 87 Undercity Necrolisk
    // 88 Veiled Shade
    // 89 Vicious Rumors
    // 90 Whispering Snitch
    // 91 Arclight Phoenix
    // 92 Barging Sergeant
    // 93 Book Devourer
    // 94 Command the Storm
    // 95 Cosmotronic Wave
    // 96 Direct Current
    // 97 Electrostatic Field
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
    // 102 Goblin Banneret
    // 103 Golin Cratermaker
    // 104 Goblin Locksmith
    // 105 Gravitic Punch
    // 106 Hellkite Whelp
    // 107 Inescapable Blaze
    // 108 Lava Coil
    // 109 Legion Warboss
    // 110 Maniacal Rage
    // 111 Maximize Velocity
    // 112 Ornery Goblin
    // 113 Risk Factor
    // 114 Rubblebelt Boar
    // 115 Runaway Steam-Kin
    // 116 Smelt-Ward Minotaur
    // 117 Street Riot
    // 118 Sure Strike
    // 119 Torch Courier
    // 120 Wojek Bodyguard
    // 121 Affectionate Indrik
    // 122 Arboretum Elemental
    // 123 Beast Whisperer
    // 124 Bounty of Might
    // 125 Circuitous Route
    // 126 Crushing Canopy
    // 127 Devkarin Dissident
    // 128 District Guide
    // 129 Generous Stray
    // 130 Golgari Raiders
    // 131 Grappling Sundew
    // 132 Hatchery Spider
    // 133 Hitchlaw Recluse
    // 134 Ironshell Beetle
    // 135 Kraul Foragers
    // 136 Kraul Harpooner
    // 137 Might of the Masses
    // 138 Nullhide Ferox
    // 139 Pack's Favor
    // 140 Pause for Reflection
    // 141 Pelt Collector
    // 142 Portcullis Vine
    // 143 Prey Upon
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
    
}
