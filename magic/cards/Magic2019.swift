import Foundation

enum M19 {
    // 1
    // 2
    // 3 Ajani, Adversary of Tyrants
    // 4
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
    // 24 Loxodon Line Breaker
    // 25 Luminous Bonds
    // 26
    // 27 Mentor of the Meek
    // 28 Mighty Leap
    // 29 Militia Bugler
    // 30
    static func OreskosSwiftclaw(owner: Player) -> Card {
        let oreskosSwiftclaw = Card(name: "Oreskos Swifclaw", owner: owner, rarity: Rarity.Common, number: 31)
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
    // 80 Tolarian Scholar
    // 81 Totally Lost
    // 82 Uncomfortable Chill
    // 83 Wall of Mist
    // 84
    // 85 Abnormal Endurance
    // 86 Blood Divination
    // 87 Bogstomper
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
    // 126 Walking Corpse
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
    // 141 Fire Elemental
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
    // 153 Onakke Ogre
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
    // 171 Centaur Courser
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
    static func Gigantosaurus(owner: Player) -> Card {
        let gigantosaurus = Card(name: "Gigantosaurus", owner: owner, rarity: Rarity.Rare, number: 185)
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
    // 204 Thornhide Wolves
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
    // 215
    // 216
    // 217
    // 218 Nicol Bolas, the Ravager // Nicol Bolas, the Arisen
    // 219 Palladia-Mors, the Ruiner
    // 220
    // 221
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
    // 234 Field Creeper
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
    static func Plains(owner: Player) -> Card {
        let plains = Card(name: "Plains", owner: owner, rarity:Rarity.Common, number: 280) // ?
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
