import Foundation

extension Object {
    
    func adapt(_ amount: Int, _ cost: Cost) {
        addActivatedAbility(
            string: "Adapt " + String(amount),
            cost: cost,
            effect: {
                if self.getCounters(.PlusOnePlusOne) == 0 {
                    self.addCounters(.PlusOnePlusOne, amount)
                }
            }
        )
    }
    
    func afterlife(_ amount: Int) {
        addTriggeredAbility(
            trigger: .ThisDies,
            effect: { self.getController().createToken(RNA.Spirit()) }
        )
    }
}

enum RNA {
    static var set = "rna"
    static var count = 259
    
    static let cards = [
        
        Absorb,
        Aeromunculus,
        
        Bedevil,
        
        GrowthSpiral,
        
        ImperiousOligarch,
        JudithTheScourgeDiva,
        
        Mortify,
        
        RakdosFirewheeler,
        SphinxsInsight,
        
        ZeganaUtopianSpeaker,
        
        AzoriusLocket,
        
        AzoriusGuildgate243,
        AzoriusGuildgate244,
        
    ]
    
    static func RandomCard() -> Card {
        return cards[Int.random(in: 0 ..< cards.count)]()
    }
    
    // 27 Tithe Taker
    // 28
    // 29
    // 30
    // 31
    // 32
    // 33
    // 34
    // 35
    // 36
    // 37
    // 38
    // 39
    // 40
    // 41
    // 42 Mass Manipulation
    // 43
    // 44
    // 45
    // 46
    // 47
    // 48
    // 49
    // 50
    // 51
    // 52
    // 53
    // 54
    // 55 Sphinx of Foresight
    
    // 107 Light Up the Stage
    // 108
    // 109 Rix Maadi Reveler
    
    static func Absorb() -> Card {
        let absorb = Card(name: "Absorb", rarity: .Rare, set: set, number: 151)
        absorb.setManaCost("WUU")
        absorb.setType(.Instant)
        absorb.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.TargetSpell(),
            effect: { target in
                target.counter()
                absorb.getController().gainLife(3)
        }))
        absorb.setFlavorText("\"In your misguided attempt to subvery the law, you have eloquently explained why the law must exist.\"")
        return absorb
    }
    static func Aeromunculus() -> Card {
        let aeromunculus = Card(name: "Aeromunculus", rarity: .Common, set: set, number: 152)
        aeromunculus.setManaCost("1GW")
        aeromunculus.setType(.Creature, .Homunculus, .Mutant)
        aeromunculus.flying = true
        aeromunculus.adapt(1, Cost.Mana("2GU"))
        aeromunculus.setFlavorText("\"The absence of binocular vision imposes certain challenges for a flying creature, which are overcome via echolocation.\"\n--Simic research notes")
        aeromunculus.power = 2
        aeromunculus.toughness = 3
        return aeromunculus
    }
    // 153
    // 154
    // 155
    // 156
    static func Bedevil() -> Card {
        let bedevil = Card(name: "Bedevil", rarity: .Rare, set: set, number: 157)
        bedevil.setManaCost("BBR")
        bedevil.setType(.Instant)
        bedevil.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Artifact) || $0.isType(.Creature) || $0.isType(.Planeswalker) },
                zones: [.Battlefield]),
            effect: { let _ = $0.destroy() }))
        bedevil.setFlavorText("\"It's easy to get taken in by the spectacle, to enjoy a bit of naughty amusement. But make no mistake: the Cult of Rakdos is a danger.\"\n--Tajic")
        return bedevil
    }
    // 158
    // 159
    // 160
    // 161
    // 162
    // 163
    // 164
    // 165 Deputy of Detention
    // 166
    // 167 Dovin, Grand Arbiter
    // 168
    // 169 Emergency Powers
    // 170
    // 171
    // 172
    // 173 Frenzied Arynx
    // 174
    // 175
    // 176
    // 177
    static func GrowthSpiral() -> Card {
        let growthSpiral = Card(name: "Growth Spiral", rarity: .Rare, set: set, number: 178)
        growthSpiral.setManaCost("GU")
        growthSpiral.setType(.Instant)
        growthSpiral.addEffect({
            growthSpiral.getController().drawCard()
            growthSpiral.getController().chooseCard(
                from: growthSpiral.getController().getHand(),
                restriction: { $0.isType(.Land) },
                action: { chosen, rest in
                    chosen?.putOntoBattlefield()
            })
        })
        growthSpiral.setFlavorText("Cyclical and spiral patterns are the specialty of the Gyre Clade, which seeks to revitalize the cycles of nature.")
        return growthSpiral
    }
    // 179 Gruul Spellbreaker
    // 180
    // 181
    // 182
    // 183 Hydroid Krasis
    static func ImperiousOligarch() -> Card {
        let imperiousOligarch = Card(name: "Imperious Oligarch", rarity: .Common, set: set, number: 184)
        imperiousOligarch.setManaCost("WB")
        imperiousOligarch.setType(.Creature, .Human, .Cleric)
        imperiousOligarch.vigilance = true
        imperiousOligarch.afterlife(1)
        imperiousOligarch.setFlavorText("The rights of ghosts are strictly protected under Orzhov bylaws, and those who enforce them can count on the ghosts' assistance.")
        imperiousOligarch.power = 2
        imperiousOligarch.toughness = 1
        return imperiousOligarch
    }
    static func JudithTheScourgeDiva() -> Card {
        let judith = Card(name: "Judith, the Scourge Diva", rarity: .Rare, set: set, number: 185)
        judith.setManaCost("1BR")
        judith.setType(.Legendary, .Creature, .Human, .Shaman)
        judith.addStaticAbility({ object in
            if object != judith && object.isType(.Creature) && object.getController() === judith.getController() {
                object.power = object.getBasePower() + 1
            }
            return object
        })
        judith.addTriggeredAbility(
            trigger: .NontokenCreatureYouControlDies,
            effect: TargetedEffect(
                restriction: TargetingRestriction.AnyTarget(),
                effect: { judith.damage(to: $0, 1) }))
        judith.setFlavorText("At the end of the show, she stands alone on a stage brilliant with blood.")
        judith.power = 2
        judith.toughness = 2
        return judith
    }
    // 186 Kaya, Orzhov Usurper
    // 187
    // 188
    // 189 Lavinia, Azorius Renegade
    // 190
    // 191
    static func Mortify() -> Card {
        let mortify = Card(name: "Mortify", rarity: .Rare, set: set, number: 192)
        mortify.setManaCost("1WB")
        mortify.setType(.Instant)
        mortify.addEffect(TargetedEffect.SingleObject(
            restriction: TargetingRestriction.SingleObject(
                restriction: { $0.isType(.Creature) || $0.isType(.Enchantment) },
                zones: [.Battlefield]),
            effect: { let _ = $0.destroy() }
        ))
        mortify.setFlavorText("\"Your debt is erased.\"\n--Hilgar, Orzhov euthanist")
        return mortify
    }
    // 193
    // 194
    // 195
    // 196
    // 196 Rafter Demon
    static func RakdosFirewheeler() -> Card {
        let rakdosFirewheeler = Card(name: "Rakdos Firewheeler", rarity: .Uncommon, set: set, number: 197)
        rakdosFirewheeler.setManaCost("BBRR")
        rakdosFirewheeler.setType(.Creature, .Human, .Rogue)
        rakdosFirewheeler.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect(
                restrictions: [
                    TargetingRestriction.SinglePlayer(
                        restriction: { $0 !== rakdosFirewheeler.getController() }
                    ),
                    TargetingRestriction.SingleObject(
                        restriction: { $0.isType(.Creature) || $0.isType(.Planeswalker) },
                        zones: [.Battlefield],
                        optional: true
                    )
                ],
                effect: { targets in
                    for target in targets {
                        rakdosFirewheeler.damage(to: target, 2)
                    }
        }))
        rakdosFirewheeler.setFlavorText("Ever wonder why you don't see an old Rakdos cultist?")
        rakdosFirewheeler.power = 4
        rakdosFirewheeler.toughness = 3
        return rakdosFirewheeler
    }
    // 198
    // 199
    // 200
    // 201
    // 202
    // 203
    // 204
    // 205
    // 206
    // 207 Simic Ascendancy
    // 208
    static func SphinxsInsight() -> Card {
        let sphinxsInsight = Card(name: "Sphinx's Insight", rarity: .Common, set: set, number: 209)
        sphinxsInsight.setManaCost("2WU")
        sphinxsInsight.setType(.Instant)
        sphinxsInsight.addEffect({
            sphinxsInsight.getController().drawCards(2)
            if sphinxsInsight.getController().active && Game.shared.getCurrentPhase() == .FirstMain || Game.shared.getCurrentPhase() == .SecondMain {
                sphinxsInsight.getController().gainLife(2)
            }
        })
        sphinxsInsight.setFlavorText("\"Do not think me blind to your true mission... or your true master, Grand Arbiter.\"")
        return sphinxsInsight
    }
    // 210
    // 211
    // 212
    // 213
    static func ZeganaUtopianSpeaker() -> Card {
        let zegana = Card(name: "Zegana, Utopian Speaker", rarity: .Rare, set: set, number: 214)
        zegana.setManaCost("2GU")
        zegana.setType(.Legendary, .Creature, .Merfolk, .Wizard)
        zegana.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { zegana.getController().drawCard() },
            restriction: { !zegana.getController().getCreatures().filter({ $0 != zegana && $0.hasCounter(.PlusOnePlusOne) }).isEmpty })
        zegana.adapt(4, Cost.Mana("4GU"))
        zegana.addStaticAbility({ object in
            if object.isType(.Creature) && object.getController() === zegana.getController() && object.hasCounter(.PlusOnePlusOne) {
                object.trample = true
            }
            return object
        })
        zegana.power = 4
        zegana.toughness = 4
        return zegana
    }
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
    // 226 Incubation // Incongruity
    // 227
    // 228
    // 229
    // 230
    static func AzoriusLocket() -> Card {
        let azoriusLocket = Card(name: "Azorius Locket", rarity: .Uncommon, set: set, number: 231)
        azoriusLocket.setManaCost("3")
        azoriusLocket.setType(.Artifact)
        azoriusLocket.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { azoriusLocket.getController().addMana(color: .White) },
            manaAbility: true)
        azoriusLocket.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { azoriusLocket.getController().addMana(color: .Blue) },
            manaAbility: true)
        azoriusLocket.addActivatedAbility(
            string: "{U/W}{U/W}{U/W}{U/W}, {T}, Sacrifice ~: Draw two cards.",
            cost: Cost.Mana("{U/W}{U/W}{U/W}{U/W}").Tap().Sacrifice(),
            effect: { azoriusLocket.getController().drawCards(2) })
        azoriusLocket.setFlavorText("\"Mandatory lockets enable the tracking of all Senate personnel for improved security and efficiency.\"\n--Dovin Baan")
        return azoriusLocket
    }
    // 232 Gate Colossus
    // 233
    // 234 Gruul Locket
    // 235
    // 236 Orzhov Locket
    // 237 Rakdos Locket
    // 238
    // 239
    // 240 Simic Locket
    // 241
    // 242
    static func AzoriusGuildgate() -> Card {
        return (Int.random(in: 1 ... 2) == 1) ? AzoriusGuildgate243() : AzoriusGuildgate244()
    }
    static func AzoriusGuildgate243() -> Card {
        let azoriusGuildgate = Card(name: "Azorius Guildgate", rarity: .Common, set: set, number: 243)
        azoriusGuildgate.setManaCost("")
        azoriusGuildgate.setType(.Land, .Gate)
        azoriusGuildgate.entersTapped = true
        azoriusGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { azoriusGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        azoriusGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { azoriusGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        azoriusGuildgate.setFlavorText("\"If the populace fears our authority, then I'd say we have an appropriately sensible populace.\"\n--Dovin Baan")
        return azoriusGuildgate
    }
    static func AzoriusGuildgate244() -> Card {
        let azoriusGuildgate = Card(name: "Azorius Guildgate", rarity: .Common, set: set, number: 244)
        azoriusGuildgate.setManaCost("")
        azoriusGuildgate.setType(.Land, .Gate)
        azoriusGuildgate.entersTapped = true
        azoriusGuildgate.addActivatedAbility(
            string: "{T}: Add {W}.",
            cost: Cost.Tap(),
            effect: { azoriusGuildgate.getController().addMana(color: .White) },
            manaAbility: true)
        azoriusGuildgate.addActivatedAbility(
            string: "{T}: Add {U}.",
            cost: Cost.Tap(),
            effect: { azoriusGuildgate.getController().addMana(color: .Blue) },
            manaAbility: true)
        azoriusGuildgate.setFlavorText("\"If you want to know what's really going on in any building, you don't walk in the front door. You stake out the back.\"\n--Lavinia")
        return azoriusGuildgate
    }
    // 245 Blood Crypt
    // 246 Breeding Pool
    // 247
    // 248 Godless Shrine
    // 249 Gruul Guildgate
    // 250 Gruul Guildgate
    // 251 Hallowed Fountain
    // 252 Orzhov Guildgate
    // 253 Orzhov Guildgate
    // 254
    // 255 Rakdos Guildgate
    // 256 Rakdos Guildgate
    // 257 Simic Guildgate
    // 258 Simic Guildgate
    // 259 Stomping Ground
    
    
    static func Spirit() -> Token {
        let spirit = Token(name: "Spirit", set: set, number: 10)
        spirit.colors = [.White, .Black]
        spirit.setType(.Creature, .Spirit)
        spirit.flying = true
        spirit.power = 1
        spirit.toughness = 1
        return spirit
    }
}
