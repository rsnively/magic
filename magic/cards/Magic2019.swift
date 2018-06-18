import Foundation

enum M19 {
    // 1
    // 2
    // 3 Ajani, Adversary of Tyrants
    // 4 Ajani's Last Stand
    // 5 Ajani's Pridemate
    // 6
    // 7
    // 8 Cavalry Drillmaster
    // 9
    // 10 Daybreak Chaplain
    // 11 Dwarven Priest
    // 12
    // 13 Herald of Faith
    // 14
    // 15 Inspired Charge
    // 16
    // 17
    // 18 Knight of the Tusk
    // 19 Knight's Pledge
    // 20
    // 21
    // 22
    // 23
    static func LoxodonLineBreaker() -> Card {
        let loxodonLineBreaker = Card(name: "Loxodon Line Breaker", rarity: Rarity.Common, number: 24)
        loxodonLineBreaker.setManaCost("2W")
        loxodonLineBreaker.addType(Type.Creature)
        loxodonLineBreaker.addType(Subtype.Elephant)
        loxodonLineBreaker.addType(Subtype.Soldier)
        loxodonLineBreaker.setFlavorText("Loxodons are firm in stature and spirit. No matter the odds, they are always first into battle.")
        loxodonLineBreaker.power = 3
        loxodonLineBreaker.toughness = 2
        return loxodonLineBreaker
    }
    // 25 Luminous Bonds
    // 26
    // 27 Mentor of the Meek
    // 28 Mighty Leap
    // 29 Militia Bugler
    // 30
    static func OreskosSwiftclaw() -> Card {
        let oreskosSwiftclaw = Card(name: "Oreskos Swifclaw", rarity: Rarity.Common, number: 31)
        oreskosSwiftclaw.setManaCost("1W")
        oreskosSwiftclaw.addType(Type.Creature)
        oreskosSwiftclaw.addType(Subtype.Cat)
        oreskosSwiftclaw.addType(Subtype.Warrior)
        oreskosSwiftclaw.setFlavorText("The leonin of Oreskos are quick to take offense -- not because they are thin-skinned, but because they are always ready for a fight.")
        oreskosSwiftclaw.power = 3
        oreskosSwiftclaw.toughness = 1
        return oreskosSwiftclaw
    }
    // 32 Pegasus Courser
    // 33
    // 34 Resplendent Angel
    // 35 Revitalize
    // 36 Rustwing Falcon
    // 37
    // 38 Star-Crowned Stag
    // 39
    // 40 Take Vengeance
    // 41 Trusty Packbeast
    // 42
    // 43
    // 44
    // 45 Aven Wind Mage
    // 46
    // 47
    // 48
    // 49
    // 50
    // 51 Divination
    // 52
    // 53 Dwindle
    // 54
    // 55 Exclusion Mage
    // 56 Frilled Sea Serpent
    // 57 Gearsmith Prodigy
    // 58 Ghostform
    // 59 Horizon Scholar
    // 60
    // 61 Mirror Image
    // 62
    // 63
    // 64
    // 65
    // 66
    // 67 Patient Rebuilding
    // 68
    // 69
    // 70 Salvager of Secrets
    // 71 Scholar of Stars
    // 72
    // 73 Skilled Animator
    // 74 Sleep
    // 75 Snapping Drake
    // 76
    // 77
    // 78
    // 79
    static func TolarianScholar() -> Card {
        let tolarianScholar = Card(name: "Tolarian Scholar", rarity: Rarity.Common, number: 80)
        tolarianScholar.setManaCost("2U")
        tolarianScholar.addType(Type.Creature)
        tolarianScholar.addType(Subtype.Human)
        tolarianScholar.addType(Subtype.Wizard)
        tolarianScholar.setFlavorText("The Tolarian Academies embrace a tradition of study and research while discouraging the kinds of experiments that ruined the original island of Tolaria.")
        tolarianScholar.power = 2
        tolarianScholar.toughness = 3
        return tolarianScholar
    }
    // 81 Totally Lost
    // 82 Uncomfortable Chill
    // 83 Wall of Mist
    // 84
    // 85 Abnormal Endurance
    // 86 Blood Divination
    static func Bogstomper() -> Card {
        let bogstomper = Card(name: "Bogstomper", rarity: Rarity.Common, number: 87)
        bogstomper.setManaCost("4BB")
        bogstomper.addType(Type.Creature)
        bogstomper.addType(Subtype.Beast)
        bogstomper.setFlavorText("\"They are gental herbivores, despite their size. Approach cautiously, and hum a tune to let them know you mean no harm.\"\n--Vivien Reid")
        bogstomper.power = 6
        bogstomper.toughness = 5
        return bogstomper
    }
    // 88
    // 89
    // 90 Death Baron
    // 91 Demon of Catastrophes
    // 92 Diregraf Ghoul
    // 93
    // 94
    // 95
    // 96
    // 97
    // 98 Gravedigger
    // 99
    // 100
    // 101
    // 102 Infernal Reckoning
    // 103 Infernal Scarring
    // 104
    // 105 Lich's Caress
    // 106
    // 107
    // 108
    // 109
    // 110 Murder
    // 111
    // 112
    // 113
    // 114
    // 115
    // 116 Reassembling Skeleton
    // 117
    // 118 Skeleton Archer
    // 119 Skymarch Bloodletter
    // 120 Sovereign's Bite
    // 121
    // 122 Strangling Spores
    // 123 Two-Headed Zombie
    // 124
    // 125 Vampire Sovereign
    static func WalkingCorpse() -> Card {
        let walkingCorpse = Card(name: "Walking Corpse", rarity: Rarity.Common, number: 124)
        walkingCorpse.setManaCost("1B")
        walkingCorpse.addType(Type.Creature)
        walkingCorpse.addType(Subtype.Zombie)
        walkingCorpse.setFlavorText("\"Feeding a normal army is a problem of logistics. With zombies, it is an asset. Feeding is why they fight. Feeding is why they are feared.\"\n--Jadar, ghoulcaller of Nephalia")
        walkingCorpse.power = 2
        walkingCorpse.toughness = 2
        return walkingCorpse
    }
    // 127 Act of Treason
    // 128
    // 129 Apex of Power
    // 130
    // 131
    // 132 Catalyst Elemental
    // 133
    // 134 Dark-Dweller Oracle
    // 135
    // 136
    // 137
    // 138
    // 139 Electrify
    // 140 Fiery Finish
    static func FireElemental() -> Card {
        let fireElemental = Card(name: "Fire Elemental", rarity: Rarity.Common, number: 141)
        fireElemental.setManaCost("3RR")
        fireElemental.addType(Type.Creature)
        fireElemental.addType(Subtype.Elemental)
        fireElemental.setFlavorText("It treads on feet of coals and strikes with the force of a volcano.")
        fireElemental.power = 5
        fireElemental.toughness = 4
        return fireElemental
    }
    // 142 Goblin Instigator
    // 143 Goblin Motivator
    // 144
    // 145 Guttersnipe
    // 146
    // 147 Hostile Minotaur
    // 148
    // 149 Lathliss, Dragon Queen
    // 150 Lava Axe
    // 151
    // 152 Lightning Strike
    static func OnakkeOgre() -> Card {
        let onakkeOgre = Card(name: "Onakke Ogre", rarity: Rarity.Common, number: 153)
        onakkeOgre.setManaCost("2R")
        onakkeOgre.addType(Type.Creature)
        onakkeOgre.addType(Subtype.Ogre)
        onakkeOgre.addType(Subtype.Warrior)
        onakkeOgre.setFlavorText("The ogres you know are nothing like the Onakke. Possessing both intellect and industry, they had brute strength without being brutish.")
        onakkeOgre.power = 4
        onakkeOgre.toughness = 2
        return onakkeOgre
    }
    // 154
    // 155
    // 156 Shock
    // 157
    // 158 Smelt
    // 159 Sparktongue Dragon
    // 160
    // 161
    // 162
    // 163 Thud
    // 164
    // 165 Trumpet Blast
    // 166 Viashino Pyromancer
    // 167 Volcanic Dragon
    // 168 Volley Veteran
    // 169
    // 170 Bristling Boar
    static func CentaurCourser() -> Card {
        let centaurCourser = Card(name: "Centaur Courser", rarity: Rarity.Common, number: 171)
        centaurCourser.setManaCost("2G")
        centaurCourser.addType(Type.Creature)
        centaurCourser.addType(Subtype.Centaur)
        centaurCourser.addType(Subtype.Warrior)
        centaurCourser.setFlavorText("\"The centaurs are truly free. Never will they be tamed by temptation or controlled by fear. They live in total harmony, a feat not yet achieved by our kind.\"\n--Ramal, sage of Westgate")
        centaurCourser.power = 3
        centaurCourser.toughness = 3
        return centaurCourser
    }
    // 172 Colossal Dreadmaw
    // 173 Colossal Majesty
    // 174
    // 175 Declare Dominance
    // 176
    // 177 Druid of the Cowl
    // 178
    // 179 Elvish Clancaller
    // 180 Elvish Rejuvenator
    // 181 Ghastbark Twins
    // 182
    // 183 Giant Spider
    // 184
    static func Gigantosaurus() -> Card {
        let gigantosaurus = Card(name: "Gigantosaurus", rarity: Rarity.Rare, number: 185)
        gigantosaurus.setManaCost("GGGGG")
        gigantosaurus.addType(Type.Creature)
        gigantosaurus.addType(Subtype.Dinosaur)
        gigantosaurus.setFlavorText("\"Each tooth is the length of a horse, and new ones grow in every sixteen days. Let's get a closer look!\"\n--Vivien Reid");
        gigantosaurus.power = 10
        gigantosaurus.toughness = 10
        return gigantosaurus
    }
    // 186
    // 187
    // 188 Highland Game
    // 189
    // 190
    // 191 Oakenform
    // 192
    // 193 Plummet
    // 194 Prodigious Growth
    // 195 Rabid Bite
    // 196 Reclamation Sage
    // 197 Recollect
    // 198
    // 199
    // 200
    // 201 Scapeshift
    // 202
    // 203
    static func ThornhideWolves() -> Card {
        let thornhideWolves = Card(name: "Thornhide Wolves", rarity: Rarity.Common, number: 204)
        thornhideWolves.setManaCost("4G")
        thornhideWolves.addType(Type.Creature)
        thornhideWolves.addType(Subtype.Wolf)
        thornhideWolves.setFlavorText("\"Halana grew brambles to create a barricade around our camp, hoping that it would keep the wolves out. That was a mistake for which we almost paid dearly.\"\nAlena, trapper of Kessig")
        thornhideWolves.power = 4
        thornhideWolves.toughness = 5
        return thornhideWolves
    }
    // 205 Titanic Growth
    // 206
    // 207
    // 208 Vivien Reid
    // 209 Vivien's Invocation
    // 210 Wall of Vines
    // 211 Aerial Engineer
    // 212
    // 213 Brawl-Bash Ogre
    // 214
    // 215 Draconic Disciple
    // 216
    // 217
    // 218 Nicol Bolas, the Ravager // Nicol Bolas, the Arisen
    // 219 Palladia-Mors, the Ruiner
    // 220
    // 221 Psychic Symbiont
    // 222
    // 223 Satyr Enchanter
    // 224
    // 225 Vaevictis Asmadi, the Dire
    // 226
    // 227
    // 228
    // 229 Crucible of Worlds
    // 230 Desecrated Tomb
    // 231
    // 232
    // 233
    static func FieldCreeper() -> Card {
        let fieldCreeper = Card(name: "Field Creeper", rarity: Rarity.Common, number: 234)
        fieldCreeper.setManaCost("2")
        fieldCreeper.addType(Type.Artifact)
        fieldCreeper.addType(Type.Creature)
        fieldCreeper.addType(Subtype.Scarecrow)
        fieldCreeper.setFlavorText("As it walks across the fallow field, its awkward, loping gait matches the rattling in its head to create a haunting rhythm that chills the bones.")
        fieldCreeper.power = 2
        fieldCreeper.toughness = 1
        return fieldCreeper
    }
    // 235 Fountain of Renewal
    // 236
    // 237 Gearsmith Guardian
    // 238 Magistrate's Scepter
    // 239 Manalith
    // 240 Marauder's Axe
    // 241 Meteor Golem
    // 242
    // 243 Rogue's Gloves
    // 244 Sigiled Sword of Valeron
    // 245 Skyscanner
    // 246
    // 247
    // 248
    // 249
    // 250
    // 251
    // 252
    // 253
    // 254 Reliquary Tower
    // 255
    // 256
    // 257
    // 258 Timber Gorge
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
    static func Plains() -> Card {
        let plains = Card(name: "Plains", rarity:Rarity.Common, number: 280) // ?
        plains.setManaCost("")
        plains.addType(Supertype.Basic)
        plains.addType(Type.Land)
        plains.addType(Subtype.Plains)
        return plains
    }
    
    static func count() -> Int { return 280 }
    
    // 281 Ajani, Wise Counselor
    // 282
    // 283 Court Cleric
    // 284 Serra's Guardian
    // 285 Silverbeak Griffin
    // 286 Tezzeret, Cruel Machinist
    // 287 Riddlemaster Sphinx
    // 288
    // 289
    // 290
    // 291 Liliana, the Necromancer
    // 292
    // 293 Gravewalker
    // 294 Liliana's Spoils
    // 295 Tattered Mummy
    // 296 Sarkhan, Dragonsoul
    // 297 Kargan Dragonrider
    // 298
    // 299 Sarkhan's Whelp
    // 300 Shivan Dragon
    // 301 Vivien of the Arkbow
    // 302 Aggressive Mammoth
    // 303
    // 304 Ursine Champion
    // 305 Vivien's Jaguar
    // 306 Nexus of Fate
    // 307 Sun Sentinel
    // 308 Air Elemental
    // 309 Befuddle
    // 310 Mist-Cloaked Herald
    // 311 Waterknot
    // 312 Grasping Scoundrel
    // 313 Radiating Lightning
    // 314 Llanowar Elves
}
