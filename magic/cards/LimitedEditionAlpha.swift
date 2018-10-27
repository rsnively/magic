import Foundation

enum LEA {
    static var set = "lea"
    static var count = 295
    
    // 1 Animate Wall
    static func Armageddon() -> Card {
        let armageddon = Card(name: "Armageddon", rarity: .Rare, set: set, number: 2)
        armageddon.setManaCost("3W")
        armageddon.setType(.Sorcery)
        armageddon.addEffect {
            Game.shared.bothPlayers({ player in
                player.getLands().forEach({ card in player.destroyPermanent(card) })
            })
        }
        return armageddon
    }
    // 3 Balance
    // 4 Benalish Hero
    // 5 Black Ward
    // 6 Blaze of Glory
    // 7 Blessing
    // 8 Blue Ward
    // 9 Castle
    // 10 Circle of Protection: Blue
    // 11 Circle of Protection: Green
    // 12 Circle of Protection: Red
    // 13 Circle of Protection: White
    // 14 Consecrate Land
    // 15 Conversion
    // 16 Crusade
    // 17 Death Ward
    static func Disenchant() -> Card {
        let disenchant = Card(name: "Disenchant", rarity: .Common, set: set, number: 18)
        disenchant.setManaCost("1W")
        disenchant.setType(.Instant)
        disenchant.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
            effect: { target in target.destroy() }))
        return disenchant
    }
    // 19 Farmstead
    // 20 Green Ward
    // 21 Guardian Angel
    // 22 Healing Salve
    // 23 Holy Armor
    // 24 Holy Strength
    // 25 Island Sanctuary
    static func Karma() -> Card {
        let karma = Card(name: "Karma", rarity: .Uncommon, set: set, number: 26)
        karma.setManaCost("2WW")
        karma.setType(.Enchantment)
        karma.addTriggeredAbility(
            trigger: .EachUpkeep,
            effect: {
                let numSwamps = Game.shared.getActivePlayer().getPermanents().filter({ $0.isType(.Swamp) }).count
                karma.damage(to: Game.shared.getActivePlayer(), numSwamps)
        })
        return karma
    }
    // 27 Lance
    // 28 Mesa Pegasus
    // 29 Northern Paladin
    static func PearledUnicorn() -> Card {
        let pearledUnicorn = Card(name: "Pearled Unicorn", rarity: .Common, set: set, number: 30)
        pearledUnicorn.setManaCost("2W")
        pearledUnicorn.setType(.Creature, .Unicorn)
        pearledUnicorn.setFlavorText("\"'Do you know, I always thought Unicorns were faulous monsters, too? I never saw one alive before!' 'Well now that we have seen each other,' said the Unicorn, 'if you'll believe in me, I'll believe in you.'\"\n--Lewis Carroll")
        pearledUnicorn.power = 2
        pearledUnicorn.toughness = 2
        return pearledUnicorn
    }
    // 31 Personal Incarnation
    // 32 Purelace
    // 33 Red Ward
    // 34 Resurrection
    // 35 Reverse Damage
    static func Righteousness() -> Card {
        let righteousness = Card(name: "Righteousness", rarity: .Rare, set: set, number: 36)
        righteousness.setManaCost("W")
        righteousness.setType(.Instant)
        righteousness.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) && $0.blocking },
            effect: { $0.pump(7, 7) }))
        return righteousness
    }
    // 37 Samite Healer
    static func SavannahLions() -> Card {
        let savannahLions = Card(name: "Savannah Lions", rarity: .Rare, set: set, number: 38)
        savannahLions.setManaCost("W")
        savannahLions.setType(.Creature, .Cat)
        savannahLions.setFlavorText("The traditional kings of the jungle command a healthy respect in other climates as well. Relying mainly on their stealth and speed, Savannah Lions can take a victim by surprise, even in the endless flat plains of their homeland.")
        savannahLions.power = 2
        savannahLions.toughness = 1
        return savannahLions
    }
    static func SerraAngel() -> Card {
        let serraAngel = Card(name: "Serra Angel", rarity: .Uncommon, set: set, number: 39)
        serraAngel.setManaCost("3WW")
        serraAngel.setType(.Creature, .Angel)
        serraAngel.flying = true
        serraAngel.vigilance = true
        serraAngel.setFlavorText("Born with wings of light and a sword of faith, this heavenly incarnation embodies both fury and purity.")
        serraAngel.power = 4
        serraAngel.toughness = 4
        return serraAngel
    }
    // 40 Swords to Plowshares
    // 41 Veteran Bodyguard
    static func WallOfSwords() -> Card {
        let wallOfSwords = Card(name: "Wall of Swords", rarity: .Uncommon, set: set, number: 42)
        wallOfSwords.setManaCost("3W")
        wallOfSwords.setType(.Creature, .Wall)
        wallOfSwords.defender = true
        wallOfSwords.flying = true
        wallOfSwords.setFlavorText("Just as the evil ones approached to slay Justina, she cast a great spell, imbuing her weapons with her own life force. Thus she fulfilled the prophecy: \"In the death of your savior will you find salvation.\"")
        wallOfSwords.power = 3
        wallOfSwords.toughness = 5
        return wallOfSwords
    }
    // 43 White Knight
    // 44 White Ward
    // 45 Wrath of God
    // 46 Air Elemental
    // 47 Ancestrall Recall
    // 48 Animate Artifact
    // 49 Blue Elemental Blast
    // 50 Braingeyser
    // 51 Clone
    // 52 Control Magic
    // 53 Copy Artifact
    // 54 Counterspell
    // 55 Creature Bond
    // 56 Drain Power
    // 57 Feedback
    // 58 Flight
    // 59 Invisibility
    // 60 Jump
    // 61 Lifetap
    // 62 Lord of Atlantis
    // 63 Magical Hack
    // 64 Mahamoti Djinn
    // 65 Mana Short
    static func MerfolkOfThePearlTrident() -> Card {
        let merfolkOfThePearlTrident = Card(name: "Merfolk of the Pearl Trident", rarity: .Common, set: set, number: 66)
        merfolkOfThePearlTrident.setManaCost("U")
        merfolkOfThePearlTrident.setType(.Creature, .Merfolk)
        merfolkOfThePearlTrident.setFlavorText("Most human scholars believe that Merfolk are the survivors of sunken Atlantis, humans adapted to the water. Merfolk, however, believe that humans sprang forth from Merfolk who adapted themselves in order to explore their last frontier.")
        merfolkOfThePearlTrident.power = 1
        merfolkOfThePearlTrident.toughness = 1
        return merfolkOfThePearlTrident
    }
    // 67 Phantasmal Forces
    // 68 Phantasmal Terrain
    // 69 Phantom Monster
    // 70 Pirate Ship
    // 71 Power Leak
    // 72 Power Sink
    // 73 Prodigal Sorcerer
    // 74 Psionic Blast
    // 75 Psychic Venom
    // 76 Sea Serpent
    // 77 Siren's Call
    // 78 Sleight of Mind
    // 79 Spell Blast
    // 80 Stasis
    // 81 Steal Artifact
    // 82 Thoughtlace
    // 83 Time Walk
    // 84 Timetwister
    // 85 Twiddle
    static func Unsummon() -> Card {
        let unsummon = Card(name: "Unsummon", rarity: .Common, set: set, number: 86)
        unsummon.setManaCost("U")
        unsummon.setType(.Instant)
        unsummon.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in target.bounce() }))
        return unsummon
    }
    // 87 Vesuvan Doppleganger
    // 88 Volcanic Eruption
    // 89 Wall of Air
    // 90 Wall of Water
    static func WaterElemental() -> Card {
        let waterElemental = Card(name: "Water Elemental", rarity: .Uncommon, set: set, number: 91)
        waterElemental.setManaCost("3UU")
        waterElemental.setType(.Creature, .Elemental)
        waterElemental.setFlavorText("Unpredictable as the sea itself, Water Elementals shift without warning from tranquility to tempest. Capricious and fickle, they flow restlessly from one shape to another, expressing their moods with their physical forms.")
        waterElemental.power = 5
        waterElemental.toughness = 4
        return waterElemental
    }
    // 92 Animate Dead
    // 93 Bad Moon
    // 94 Black Knight
    // 95 Bog Wraith
    // 96 Contract from Below
    // 97 Cursed Land
    static func DarkRitual() -> Card {
        let darkRitual = Card(name: "Dark Ritual", rarity: .Common, set: set, number: 98)
        darkRitual.setManaCost("B")
        darkRitual.setType(.Instant)
        darkRitual.addEffect {
            darkRitual.getController().addMana(color: .Black)
            darkRitual.getController().addMana(color: .Black)
            darkRitual.getController().addMana(color: .Black)
        }
        return darkRitual
    }
    // 99 Darkpact
    // 100 Deathgrip
    // 101 Deathlace
    // 102 Demonic Attorney
    // 103 Demonic Hordes
    // 104 Demonic Tutor
    // 105 Drain Life
    // 106 Drudge Skeletons
    // 107 Evil Presence
    // 108 Fear
    // 109 Frozen Shade
    // 110 Gloom
    // 111 Howl from Beyond
    // 112 Hypnotic Spectre
    // 113 Lich
    // 114 Lord of the Pit
    // 115 Mind Twist
    // 116 Nether Shadow
    // 117 Nettling Imp
    // 118 Nightmare
    // 119 Paralyze
    // 120 Pestilence
    // 121 Plague Rats
    // 122 Raise Dead
    // 123 Royal Assassin
    // 124 Sacrifice
    static func ScatheZombies() -> Card {
        let scatheZombies = Card(name: "Scathe Zombies", rarity: .Common, set: set, number: 125)
        scatheZombies.setManaCost("2B")
        scatheZombies.setType(.Creature, .Zombie)
        scatheZombies.setFlavorText("\"They groaned, they stirred, they all uprose,\nNor spake, nor moved their eyes;\nIt had been strange, even in a dream,\nTo have seen those dead men rise.\"\n--Samuel Taylor Colridge, \"The Rime of the Ancient Mariner")
        scatheZombies.power = 2
        scatheZombies.toughness = 2
        return scatheZombies
    }
    // 126 Scavenging Ghoul
    // 127 Sengir Vampire
    // 128 Simulacrum
    static func Sinkhole() -> Card {
        let sinkhole = Card(name: "Sinkhole", rarity: .Common, set: set, number: 129)
        sinkhole.setManaCost("BB")
        sinkhole.setType(.Sorcery)
        sinkhole.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Land) },
            effect: { target in target.destroy() }))
        return sinkhole
    }
    // 130 Terror
    // 131 Unholy Strength
    // 132 Wall of Bone
    // 133 Warp Artifact
    // 134 Weakness
    // 135 Will-O-The-Wisp
    // 136 Word of Command
    // 137 Zombie Master
    // 138 Burrowing
    // 139 Chaoslace
    // 140 Disintegrate
    // 141 Dragon Whelp
    // 142 Dwarven Demolition Team
    // 143 Dwarven Warriors
    static func EarthElemental() -> Card {
        let earthElemental = Card(name: "Earth Elemental", rarity: .Uncommon, set: set, number: 144)
        earthElemental.setManaCost("3RR")
        earthElemental.setType(.Creature, .Elemental)
        earthElemental.setFlavorText("Earth Elementals have the eternal strength of stone and the endurance of mountains. Primordially connected to the land they inhabit, they take a long-term view of things, scorning the impetuous haste of short-lived mortal creatures.")
        earthElemental.power = 4
        earthElemental.toughness = 5
        return earthElemental
    }
    // 145 Earthbind
    // 146 Earthquake
    // 147 False Orders
    static func FireElemental() -> Card {
        let fireElemental = Card(name: "Fire Elemental", rarity: .Uncommon, set: set, number: 148)
        fireElemental.setManaCost("3RR")
        fireElemental.setType(.Creature, .Elemental)
        fireElemental.setFlavorText("Fire Elementals are ruthless infernos, annihilating and consuming their foes in a frenzied holocaust. Crackling and blazing, they sear swift, terrilble paths, leaving the land charred and scorched in their wake.")
        fireElemental.power = 5
        fireElemental.toughness = 4
        return fireElemental
    }
    // 149 Fireball
    // 150 Firebreathing
    static func Flashfires() -> Card {
        let flashfires = Card(name: "Flashfires", rarity: .Uncommon, set: set, number: 151)
        flashfires.setManaCost("3R")
        flashfires.setType(.Sorcery)
        flashfires.addEffect {
            Game.shared.bothPlayers({ player in
                player.getLands().filter({$0.isType(.Plains)}).forEach({$0.destroy()})
            })
        }
        return flashfires
    }
    // 152 Fork
    // 153 Goblin Balloon Brigade
    // 154 Goblin King
    // 155 Granite Gargoyle
    static func GrayOgre() -> Card {
        let grayOgre = Card(name: "Gray Ogre", rarity: .Common, set: set, number: 156)
        grayOgre.setManaCost("2R")
        grayOgre.setType(.Creature, .Ogre)
        grayOgre.setFlavorText("The Ogre philosopher Gnerdel believed the purpose of life was to live as high on the food chain as possible. She refused to eat vegetarians, and preferred to live entirely on creatures that preyed on sentient beings.")
        grayOgre.power = 2
        grayOgre.toughness = 2
        return grayOgre
    }
    static func HillGiant() -> Card {
        let hillGiant = Card(name: "Hill Giant", rarity: .Common, set: set, number: 157)
        hillGiant.setManaCost("3R")
        hillGiant.setType(.Creature, .Giant)
        hillGiant.setFlavorText("Fortunately, Hill Giants have large blind spots in which a human can easily hide. Unfortunately, these blind spots are beneath the bottoms of their feet.")
        hillGiant.power = 3
        hillGiant.toughness = 3
        return hillGiant
    }
    static func HurloonMinotaur() -> Card {
        let hurloonMinotaur = Card(name: "Hurloon Minotaur", rarity: .Common, set: set, number: 158)
        hurloonMinotaur.setManaCost("1RR")
        hurloonMinotaur.setType(.Creature, .Minotaur)
        hurloonMinotaur.setFlavorText("The Minotaurs of the Hurloon Mountains are known for their love of battle. They are also known for their hymns to the dead, sung for friend and foe alike. These hymns can last for days, filling the mountain valleys with their low, haunting sounds.")
        hurloonMinotaur.power = 2
        hurloonMinotaur.toughness = 3
        return hurloonMinotaur
    }
    // 159 Ironclaw Orcs
    // 160 Keldon Warlord
    // 161 Lightning Bolt
    // 162 Mana Flare
    // 163 Manabarbs
    static func MonssGoblinRaiders() -> Card {
        let monssGoblinRaiders = Card(name: "Mons's Goblin Raiders", rarity: .Common, set: set, number: 164)
        monssGoblinRaiders.setManaCost("R")
        monssGoblinRaiders.setType(.Creature, .Goblin)
        monssGoblinRaiders.setFlavorText("The intricate dynamics of Rundvelt Goblin affairs are often confused with anarchy. The chaos, however, is the chaos of a thundercloud, and direction will sporadically and violently appear. Pashalik Mons and his raiders are the thunderhead that leads the storm.")
        monssGoblinRaiders.power = 1
        monssGoblinRaiders.toughness = 1
        return monssGoblinRaiders
    }
    // 165 Orcish Artillery
    // 166 Orcish Oriflamme
    // 167 Power Surge
    // 168 Raging River
    // 169 Red Elemental Blast
    // 170 Roc of Kher Ridges
    // 171 Rock Hydra
    // 172 Sedge Troll
    static func Shatter() -> Card {
        let shatter = Card(name: "Shatter", rarity: .Common, set: set, number: 173)
        shatter.setManaCost("1R")
        shatter.setType(.Instant)
        shatter.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) },
            effect: { target in target.destroy() }))
        return shatter
    }
    // 174 Shivan Dragon
    // 175 Smoke
    // 176 Stone Giant
    static func StoneRain() -> Card {
        let stoneRain = Card(name: "Stone Rain", rarity: .Common, set: set, number: 177)
        stoneRain.setManaCost("2R")
        stoneRain.setType(.Sorcery)
        stoneRain.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Land) },
            effect: { target in target.destroy() }))
        return stoneRain
    }
    // 178 Tunnel
    // 179 Two-Headed Giant of Foriys
    // 180 Uthden Troll
    // 181 Wall of Fire
    static func WallOfStone() -> Card {
        let wallOfStone = Card(name: "Wall of Stone", rarity: .Uncommon, set: set, number: 182)
        wallOfStone.setManaCost("1RR")
        wallOfStone.setType(.Creature, .Wall)
        wallOfStone.defender = true
        wallOfStone.setFlavorText("The Earth herself lends her strength to these walls of living stone, which possess the stability of ancient mountains. These mighty bulwarks thwart ground-based troops, providing welcome relief for weary warriors who defend the land.")
        wallOfStone.power = 0
        wallOfStone.toughness = 8
        return wallOfStone
    }
    static func WheelOfFortune() -> Card {
        let wheelOfFortune = Card(name: "Wheel of Fortune", rarity: .Rare, set: set, number: 183)
        wheelOfFortune.setManaCost("2R")
        wheelOfFortune.setType(.Sorcery)
        wheelOfFortune.addEffect {
            Game.shared.bothPlayers({ player in
                player.getHand().forEach({$0.discard()})
                player.drawCards(7)
            })
        }
        return wheelOfFortune
    }
    // 184 Aspect of Wolf
    // 185 Berserk
    // 186 Birds of Paradise
    // 187 Camouflage
    // 188 Channel
    // 189 Cockatrice
    static func CrawWurm() -> Card {
        let crawWurm = Card(name: "Craw Wurm", rarity: .Common, set: set, number: 190)
        crawWurm.setManaCost("4GG")
        crawWurm.setType(.Creature, .Wurm)
        crawWurm.setFlavorText("The most terrifying thing about the Craw Wurm is probably the horrible crashing sound it makes as it speeds through the forest. This noise is so loud it echoes through the trees and seems to come from all directions at once.")
        crawWurm.power = 6
        crawWurm.toughness = 4
        return crawWurm
    }
    // 191 Elvish Archers
    // 192 Fastbond
    // 193 Fog
    // 194 Force of Nature
    // 195 Fungusaur
    // 196 Gaea's Liege
    // 197 Giant Growth
    // 198 Giant Spider
    static func GrizzlyBears() -> Card {
        let grizzlyBears = Card(name: "Grizzly Bears", rarity: .Common, set: set, number: 199)
        grizzlyBears.setManaCost("1G")
        grizzlyBears.setType(.Creature, .Bear)
        grizzlyBears.setFlavorText("Don't try to outrun one of Dominaria's Grizzlies; it'll catch you, knock you down, and eat you. Of course, you could run up a tree. In that case you'd get a nice view before it knocks the tree down and eats you.")
        grizzlyBears.power = 2
        grizzlyBears.toughness = 2
        return grizzlyBears
    }
    // 200 Hurricane
    static func IceStorm() -> Card {
        let iceStorm = Card(name: "Ice Rain", rarity: .Uncommon, set: set, number: 201)
        iceStorm.setManaCost("2G")
        iceStorm.setType(.Sorcery)
        iceStorm.addEffect(TargetedEffect.SingleObject(
            restriction: {  return $0.isType(.Land) },
            effect: { target in target.destroy() }))
        return iceStorm
    }
    // 202 Instill Energy
    static func IronrootTreefolk() -> Card {
        let ironrootTreefolk = Card(name: "Ironroot Treefolk", rarity: .Common, set: set, number: 203)
        ironrootTreefolk.setManaCost("4G")
        ironrootTreefolk.setType(.Creature, .Treefolk)
        ironrootTreefolk.setFlavorText("The mating habits of Treefolk, particularly the stalwart Ironroot Treefolk, are truly absurd. Molasses comes to mind. It's amazing the species can survive at all given such protracted periods of mate selection, conjugation, and gestation.")
        ironrootTreefolk.power = 3
        ironrootTreefolk.toughness = 5
        return ironrootTreefolk
    }
    // 204 Kudzu
    // 205 Ley Druid
    // 206 Lifeforce
    // 207 Lifelace
    // 208 Living Artifact
    // 209 Living Lands
    // 210 Llanowar Elves
    // 211 Lure
    // 212 Natural Selection
    // 213 Regeneration
    // 214 Regrowth
    // 215 Scryb Sprites
    // 216 Shanodin Dryads
    // 217 Stream of Life
    // 218 Thicket Basilisk
    // 219 Timber Wolves
    static func Tranquility() -> Card {
        let tranquility = Card(name: "Tranquility", rarity: .Common, set: set, number: 220)
        tranquility.setManaCost("2G")
        tranquility.setType(.Sorcery)
        tranquility.addEffect {
            Game.shared.bothPlayers({ player in
                player.getEnchantments().forEach({ card in player.destroyPermanent(card) })
            })
        }
        return tranquility
    }
    static func Tsunami() -> Card {
        let tsunami = Card(name: "Tsunami", rarity: .Uncommon, set: set, number: 152)
        tsunami.setManaCost("3G")
        tsunami.setType(.Sorcery)
        tsunami.addEffect {
            Game.shared.bothPlayers({ player in
                player.getLands().filter({$0.isType(.Island)}).forEach({$0.destroy()})
            })
        }
        return tsunami
    }
    // 222 Verduran Enchantress
    // 223 Wall of Brambles
    static func WallOfIce() -> Card {
        let wallOfIce = Card(name: "Wall of Ice", rarity: .Uncommon, set: set, number: 224)
        wallOfIce.setManaCost("2G")
        wallOfIce.setType(.Creature, .Wall)
        wallOfIce.defender = true
        wallOfIce.setFlavorText("\"And through the drifts the snowy cliffs| Did send a dismal sheen:| Nor shapes of men nor beasts we ken--| The ice was all between.\"| --Samuel Coleridge, \"The Rime of the Ancient Mariner\"")
        wallOfIce.power = 0
        wallOfIce.toughness = 7
        return wallOfIce
    }
    static func WallOfWood() -> Card {
        let wallOfWood = Card(name: "Wall of Wood", rarity: .Common, set: set, number: 225)
        wallOfWood.setManaCost("G")
        wallOfWood.setType(.Creature, .Wall)
        wallOfWood.defender = true
        wallOfWood.setFlavorText("Everybody knows that to ward off trouble, you knock on wood. But usually it's better to make a wall out of wood and let trouble do the knocking.")
        wallOfWood.power = 0
        wallOfWood.toughness = 3
        return wallOfWood
    }
    // 226 Wanderlust
    // 227 War Mammoth
    // 228 Web
    // 229 Wild Growth
    // 230 Ankh of Mishra
    // 231 Basalt Monolith
    // 232 Black Lotus
    // 233 Black Vise
    // 234 Celestial Prism
    // 235 Chaos Orbb
    // 236 Clockwork Beast
    // 237 Conservator
    // 238 Copper Tablet
    // 239 Crystal Rod
    // 240 Cyclopean Tomb
    // 241 Dingus Egg
    // 242 Disrupting Scepter
    // 243 Forcefield
    // 244 Gauntlet of Might
    // 245 Glasses of Urza
    // 246 Helm of Chatzuk
    // 247 Howling Mine
    // 248 Icy Manipulator
    // 249 Illusionary Mask
    // 250 Iron Star
    // 251 Ivory Cup
    // 252 Jade Monolith
    // 253 Jade Statue
    // 254 Jayemdae Tome
    // 255 Juggernaut
    // 256 Kormus Bell
    // 257 Library of Leng
    // 258 Living Wall
    // 259 Mana Vault
    // 260 Meekstone
    // 261 Mox Emerald
    // 262 Mox Jet
    // 263 Mox Pearl
    // 264 Mox Ruby
    // 265 Mox Sapphire
    // 266 Nevinyrral's Disk
    static func ObsianusGolem() -> Card {
        let obsianusGolem = Card(name: "Obsianus Golem", rarity: .Uncommon, set: set, number: 267)
        obsianusGolem.setManaCost("6")
        obsianusGolem.setType(.Artifact, .Creature, .Golem)
        obsianusGolem.setFlavorText("\"The foot stone is connected to the ankle stone, the ankle stone is connected to the leg stone...\"\n--Song of the Artificer")
        obsianusGolem.power = 4
        obsianusGolem.toughness = 6
        return obsianusGolem
    }
    // 268 Rod of Ruin
    // 269 Sol Ring
    // 270 Soul Net
    // 271 Sunglasses of Urza
    // 272 The Hive
    // 273 Throne of Bone
    // 274 Time Vault
    // 275 Winter Orb
    // 276 Wooden Sphere
    // 277 Badlands
    // 278 Bayou
    // 279 Plateau
    // 280 Savannah
    // 281 Scrubland
    // 282 Taiga
    // 283 Tropical Island
    // 284 Tundra
    static func UndergroundSea() -> Card {
        let undergroundSea = Card(name: "Underground Sea", rarity: .Rare, set: set, number: 285)
        undergroundSea.setManaCost("")
        undergroundSea.setType(.Land, .Island, .Swamp)
        undergroundSea.addActivatedAbility(
            string: "{T}: Add {B}.",
            cost: Cost("", tap: true),
            effect: { undergroundSea.getController().addMana(color: .Black) },
            manaAbility: true )
        undergroundSea.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost("", tap: true),
            effect: { undergroundSea.getController().addMana(color: .Blue) },
            manaAbility: true )
        return undergroundSea
    }
    // 286 Plains
    // 287 Plains
    // 288 Island
    // 289 Island
    // 290 Swamp
    // 291 Swamp
    // 292 Mountain
    // 293 Mountain
    // 294 Forest
    // 295 Forest
}


