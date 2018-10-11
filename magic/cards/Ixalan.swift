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
        brightReprisal.addEffect(TargetedEffect(
            targetingRestriction: { return $0.isType(.Creature) && $0.attacking },
            effect: { source, target in
                target.destroy()
                source.getController().drawCard()
            }
        ))
        brightReprisal.setFlavorText("Vampires know blood and the systems that carry it. And they know exactly where to strike to set it free.")
        return brightReprisal
    }
    static func Demystify() -> Card {
        let demystify = Card(name: "Demystify", rarity: .Common, set: set, number: 8)
        demystify.setManaCost("W")
        demystify.setType(.Instant)
        demystify.addEffect(TargetedEffect(
            targetingRestriction: { return $0.isType(.Enchantment) },
            effect: { _, target in target.destroy() }
        ))
        demystify.setFlavorText("\"The River Heralds carve spells into jade, hoping to steer us from our course. But what right do they have to keep us from that which once was ours?\"")
        return demystify
    }
    // 9 Duskborne Skymarcher
    // 10 Emissary of Sunrise
    // 11 Encampment Keeper
    // 12 Glorifier of Dusk
    // 13 Goring Ceratops
    // 14 Imperial Aerosaur
    // 15 Imperial Lancer
    static func InspiringCleric() -> Card {
        let inspiringCleric = Card(name: "Inspiring Cleric", rarity: .Uncommon, set: set, number: 16)
        inspiringCleric.setManaCost("2W")
        inspiringCleric.setType(.Creature, .Vampire, .Cleric)
        inspiringCleric.addTriggeredAbility(UntargetedTriggeredAbility(
            source: inspiringCleric,
            trigger: .ThisETB,
            effect: { $0.getController().gainLife(4) }
        ))
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
        legionsJudgment.addEffect(TargetedEffect(
            targetingRestriction: { return $0.isType(.Creature) && $0.getToughness() >= 4 },
            effect: { _, target in target.destroy() }
        ))
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
        paladinOfTheBloodstained.addTriggeredAbility(UntargetedTriggeredAbility(
            source: paladinOfTheBloodstained,
            trigger: .ThisETB,
            effect: { $0.getController().createToken(Vampire()) }
        ))
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
        queensCommission.addEffect(UntargetedEffect({ source in
            source.getController().createToken(Vampire())
            source.getController().createToken(Vampire())
        }))
        queensCommission.setFlavorText("\"Let the blood of the impure flow through you. Only the blessings of the golden city will purge its acrid taste from your mouth.\"\n--High Marshal Arguel")
        return queensCommission
    }
    static func RallyingRoar() -> Card {
        let rallyingRoar = Card(name: "Rallying Roar", rarity: .Uncommon, set: set, number: 30)
        rallyingRoar.setManaCost("2W")
        rallyingRoar.setType(.Instant)
        rallyingRoar.addEffect(UntargetedEffect({
            $0.getController().getCreatures().forEach({ creature in
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() + 1
                    object.toughness = object.getBaseToughness() + 1
                    return object
                }))
                creature.untap()
            })
        }))
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
        ritualOfRejuvenation.addEffect(UntargetedEffect{
            $0.getController().gainLife(4)
            $0.getController().drawCard()
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
        slashOfTalons.addEffect(TargetedEffect(
            targetingRestriction: { return $0.isType(.Creature) && ($0.attacking || $0.blocking) },
            effect: { _, target in target.dealDamage(2) }
        ))
        slashOfTalons.setFlavorText("\"The amber sun smokes with fury, gazing on foes that gather like ants invading our home. We are ready! Blade and claw strike as one.\"\n--Huatli")
        return slashOfTalons
    }
    // 39 Steadfast Armasaur
    // 40 Sunrise Seeker
    // 41 Territorial Hammerskull
    // 42 Tocatli Honor Guard
    // 43 Vampire's Zeal
    // 44 Wakening Sun's Avatar    
    
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
