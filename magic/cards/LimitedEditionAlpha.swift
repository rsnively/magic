import Foundation

enum LEA {
    static var set = "lea"
    static var count = 295
    
    // 1 Animate Wall
    static func Armageddon() -> Card {
        let armageddon = Card(name: "Armageddon", rarity: .Rare, set: set, number: 2)
        armageddon.setManaCost("3W")
        armageddon.setType(.Sorcery)
        armageddon.addEffect(UntargetedEffect({ _ in
            Game.shared.bothPlayers({ player in
                player.getLands().forEach({ card in player.destroyPermanent(card) })
            })
        }))
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
        disenchant.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Artifact) || potentialTarget.isType(.Enchantment)
        }, { source, target in
            target.destroy()
        }))
        return disenchant
    }
    // 19 Farmstead
    // 20 Green Ward
    // 21 Guardian Angel
    // 22 Healing Salve
    // 23 Holy Armor
    // 24 Holy Strength
    // 25 Island Sanctuary
    // 26 Karma
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
    // 36 Righteousness
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
    // 39 Serra Angel
    // 40 Swords to Plowshares
    // 41 Veteran Bodyguard
    // 42 Wall of Swords
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
        unsummon.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature)
        }, { source, target in
            target.bounce()
        }))
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
        darkRitual.addEffect(UntargetedEffect(
            { source in
                source.getController().addMana(color: .Black)
                source.getController().addMana(color: .Black)
                source.getController().addMana(color: .Black)
        }))
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
        sinkhole.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Land)
        }, { source, target in
            target.destroy()
        }))
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
    // 149
    // 150
    // 151
    // 152
    // 153
    // 154
    // 155
    // 156
    // 157
    // 158
    // 159
    // 160
    // 161
    // 162
    // 163
    // 164
    // 165
    // 166
    // 167
    // 168
    // 169
    // 170
    // 171
    // 172
    // 173
    // 174
    // 175
    // 176
    // 177
    // 178
    // 179
    // 180
    // 181
    // 182
    // 183
    // 184
    // 185
    // 186
    // 187
    // 188
    // 189
    // 190
    // 191
    // 192
    // 193
    // 194
    // 195
    // 196
    // 197
    // 198
    // 199
    // 200
    // 201
    // 202
    // 203
    // 204
    // 205
    // 206
    // 207
    // 208
    // 209
    // 210
    // 211
    // 212
    // 213
    // 214
    // 215
    // 216
    // 217
    // 218
    // 219
    // 220
    // 221
    // 222
    // 223
    // 224
    // 225
    // 226
    // 227
    // 228
    // 229
    // 230
    // 231
    // 232
    // 233
    // 234
    // 235
    // 236
    // 237
    // 238
    // 239
    // 240
    // 241
    // 242
    // 243
    // 244
    // 245
    // 246
    // 247
    // 248
    // 249
    // 250
    // 251
    // 252
    // 253
    // 254
    // 255
    // 256
    // 257
    // 258
    // 259
    // 260
    // 261
    // 262
    // 263
    // 264
    // 265
    // 266
    // 267
    // 268
    // 269
    // 270
    // 271
    // 272
    // 273
    // 274
    // 275
    // 276
    // 277
    // 278
    // 279
    // 280
    // 281
    // 282
    // 283
    // 284
    // 285
    // 286
    // 287
    // 288
    // 289
    // 290
    // 291
    // 292
    // 293
    // 294
    // 295
    // 296
    // 297
    // 298
    // 299
    // 300
    // 301
    // 302
    // 303
    // 304
    // 305
}


