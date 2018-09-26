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
    static func SwornCompanions() -> Card {
        let swornCompanions = Card(name: "Sworn Companions", rarity: .Common, set: set, number: 27)
        swornCompanions.setManaCost("2W")
        swornCompanions.setType(.Sorcery)
        swornCompanions.addEffect(UntargetedEffect({ source in
            source.getController().createToken(Soldier())
            source.getController().createToken(Soldier())
        }))
        swornCompanions.setFlavorText("\"The trouble with youths these days is that, in outright defiance of their elders, they refuse to be bought.\"\n--Karlov of the Ghost Council")
        return swornCompanions
    }
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
    static func CommandTheStorm() -> Card {
        let commandTheStorm = Card(name: "Command the Storm", rarity: .Common, set: set, number: 94)
        commandTheStorm.setManaCost("4R")
        commandTheStorm.setType(.Instant)
        commandTheStorm.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature)
        }, { source, target in
            target.dealDamage(5)
        }))
        commandTheStorm.setFlavorText("In the wake of Niv-Mizzet's disappearance, Ral found himself leading the guild. He had dreamed of this day, but couldn't help feeling like a pawn in someone else's game.")
        return commandTheStorm
    }
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
    static func GenerousStray() -> Card {
        let generousStray = Card(name: "Generous Stray", rarity: .Common, set: set, number: 129)
        generousStray.setManaCost("2G")
        generousStray.setType(.Creature, .Cat)
        generousStray.addTriggeredAbility(UntargetedTriggeredAbility(
            source: generousStray,
            trigger: .ThisETB,
            effect: { source in
                source.getController().drawCard()
        }))
        generousStray.setFlavorText("Cats place their gifts with care, so that a bare foot will step on them in the middle of the night.")
        generousStray.power = 1
        generousStray.toughness = 2
        return generousStray
    }
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
    // 151 Artful Takedown
    // 152 Assassin's Trophy
    // 153 Aurelia, Exemplar of Justice
    // 154 Beacon Bolt
    // 155 Beamsplitter Mage
    // 156 Boros Challenger
    // 157 Camaraderie
    // 158 Centaur Peacemaker
    // 159 Chance for Glory
    // 160 Charnel Troll
    // 161 Conclave Cavalier
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
    // 176 Hammer Dropper
    // 177 House Guildmage
    // 178 Hypothesizzle
    // 179 Ionize
    // 180 Izoni, Thousand-Eyed
    // 181 Join Shields
    // 182 Justice Strike
    // 183 Knight of Autumn
    // 184 Lazav, the Multifarious
    // 185 League Guildmage
    // 186 Ledev Champion
    // 187 Legion Guildmage
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
    // 198 Skyknight Legionnaire
    // 199 Sonic Assault
    // 200 Sumala Woodshaper
    // 201 Swarm Guildmage
    // 202 Swathcutter Giant
    // 203 Swiftblade Vindicator
    // 204 Tajic, Legion's Edge
    // 205 Thief of Sanity
    // 206 Thought Erasure
    // 207 Thousand-Year Storm
    // 208 Trostani Discordant
    // 209 Truefire Captain
    // 210 Undercity Uprising
    // 211 Underrealm Lich
    // 212 Unmoored Ego
    // 213 Vraska, Golgari Queen
    // 214 Wee Dragonauts
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
    // 243 Boros Guildgate
    // 244 Boros Guildgate
    // 245 Dimir Guildgate
    // 246 Dimir Guildgate
    // 247 Gateway Plaza
    // 248 Golgari Guildgate
    // 249 Golgari Guildgate
    // 250 Guildmages' Forum
    // 251 Izzet Guildgate
    // 252 Izzet Guildgate
    // 253 Overgrown Tomb
    // 254 Sacred Foundary
    // 255 Selesnya Guildgate
    // 256 Selesnya Guildgate
    // 257 Steam Vents
    // 258 Temple Garden
    // 259 Watery Grave
    // 260 Plains
    // 261 Island
    // 262 Swamp
    // 263 Mountain
    // 264 Forest
    
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
    // t3 Bird Illusion
    // t4 Gobblin
    // t5 Insect
    // t6 Elf Knight
    // t7 Ral Emblem
    // t8 Vraska Emblem
}
