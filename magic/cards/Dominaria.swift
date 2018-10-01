import Foundation

enum DOM {
    static var set = "dom"
    static var count = 269
    
    // 1 Karn, Scion of Urza
    // 2 Adamant Will
    // 3 Aven Sentry
    // 4 Baird, Steward of Argive
    // 5 Benalish Honor Guard
    // 6 Benalish Marshal
    // 7 Blessed Light
    // 8 Board the Weatherlight
    static func CallTheCavalry() -> Card {
        let callTheCavalry = Card(name: "Call the Cavalry", rarity: .Common, set: set, number: 9)
        callTheCavalry.setManaCost("3W")
        callTheCavalry.setType(.Sorcery)
        callTheCavalry.addEffect(UntargetedEffect({ source in
            source.getController().createToken(Knight())
            source.getController().createToken(Knight())
        }))
        callTheCavalry.setFlavorText("Benalish citizens born under the same constellation share a star-clan. Their loyalty to one another interlaces the Seven Houses.")
        return callTheCavalry
    }
    // 10 Charge
    // 11 D'Avenant Trapper
    // 12 Danitha Capashen, Pargaon
    // 13 Daring Archaeologist
    // 14 Dauntless Bodygyard
    // 15 Dub
    // 16 Evra, Halcyon Witness
    // 17 Excavation Elephant
    // 18 Fall of the Thran
    // 19 Gideon's Reproach
    // 20 Healing Grace
    // 21 History of Benalia
    static func InvokeTheDivine() -> Card {
        let invokeTheDivine = Card(name: "Invoke the Divine", rarity: .Common, set: set, number: 22)
        invokeTheDivine.setManaCost("2W")
        invokeTheDivine.setType(.Instant)
        invokeTheDivine.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Artifact) || potentialTarget.isType(.Enchantment)
        }, { source, target in
            target.destroy()
            source.getController().gainLife(4)
        }))
        invokeTheDivine.setFlavorText("\"Let go of all that harms you. Cast your burdens into the darkness, and build for the faithful a house of light.\"\n--<i>Song of All</i>, canto 1008")
        return invokeTheDivine
    }
    // 23 Knight of Grace
    static func KnightOfNewBenalia() -> Card {
        let knightOfNewBenalia = Card(name: "Knight of New Benalia", rarity: .Common, set: set, number: 24)
        knightOfNewBenalia.setManaCost("1W")
        knightOfNewBenalia.setType(.Creature, .Human, .Knight)
        knightOfNewBenalia.setFlavorText("The mage-smiths of New Benalia have perfected the art of blending fine steel and enchanted glass into weapons that are both beautiful and deadly. Only elite knights are entrusted with these martial works of art.")
        knightOfNewBenalia.power = 3
        knightOfNewBenalia.toughness = 1
        return knightOfNewBenalia
    }
    // 25 Kwende, Pride of Femeref
    // 26 Lyra Dawnbringer
    static func MesaUnicorn() -> Card {
        let mesaUnicorn = Card(name: "Mesa Unicorn", rarity: .Common, set: set, number: 27)
        mesaUnicorn.setManaCost("1W")
        mesaUnicorn.setType(.Creature, .Unicorn)
        mesaUnicorn.lifelink = true
        mesaUnicorn.setFlavorText("The unicorns of Sursi are a manifestation of Serra's joy and compassion. They frolic and dance like children, offering blessings to anyone they encounter.")
        mesaUnicorn.power = 2
        mesaUnicorn.toughness = 2
        return mesaUnicorn
    }
    // 28 On Serra's Wings
    // 29 Pegasus Courser
    // 30 Sanctum Spirit
    // 31 Seal Away
    // 32 Sergeant-at-Arms
    // 33 Serra Angel
    // 34 Serra Disciple
    // 35 Shalai, Voice of Plenty
    // 36 Teshar, Ancestor's Apostle
    // 37 Tragic Poet
    // 38 Triumph of Gerard
    // 39 Urza's Ruinous Blast
    // 40 Academy Drake
    // 41 Academy Journeymage
    // 42 The Antiquities War
    // 43 Arcane Flight
    // 44 Artificer's Assistant
    // 45 Befuddle
    // 46 Blink of an Eye
    // 47 Cloudreader Sphinx
    // 48 Cold-Water Snapper
    // 49 Curator's Ward
    // 50 Deep Freeze
    // 51 Diligent Excavator
    static func Divination() -> Card {
        let divination = Card(name: "Divination", rarity: .Common, set: set, number: 52)
        divination.setManaCost("2U")
        divination.setType(.Sorcery)
        divination.addEffect(UntargetedEffect{
            $0.getController().drawCards(2)
        })
        divination.setFlavorText("\"Half your studies will be learning the laws of magic. The other half will be bending them.\"\n--Naru Meha, master wizard.")
        return divination
    }
    // 53 Homarid Explorer
    // 54 In Bolas's Clutches
    // 55 Karn's Temporal Sundering
    // 56 Merfolk Trickster
    // 57 The Mirari Conjecture
    // 58 Naban, Dean of Iteration
    // 59 Naru Meha, Master Wizard
    // 60 Opt
    // 61 Precognition Field
    // 62 Relic Runner
    static func Rescue() -> Card {
        let rescue = Card(name: "Rescue", rarity: .Common, set: set, number: 63)
        rescue.setManaCost("U")
        rescue.setType(.Instant)
        rescue.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                potentialTarget.getController() == rescue.getController()
        }, { source, object in
                object.bounce()
        }))
        rescue.setFlavorText("With just a few seconds to escape, Deryan saved Hurkyl's editions on restoring physical objects from ash.")
        return rescue
    }
    // 64 Sage of Lat-Nam
    // 65 Sentinel of the Pearl Trident
    // 66 Slinn Voda, the Rising Deep
    // 67 Syncopate
    // 68 Tempest Djinn
    // 69 Tetsuko Umezawa, Fugitive
    // 70 Time of Ice
    static func TolarianScholar() -> Card {
        let tolarianScholar = Card(name: "Tolarian Scholar", rarity: .Common, set: set, number: 71)
        tolarianScholar.setManaCost("2U")
        tolarianScholar.setType(.Creature, .Human, .Wizard)
        tolarianScholar.setFlavorText("The Tolarian Academies embrace a tradition of study and research while discouraging the kinds of experiments that ruined the original island of Tolaria.")
        tolarianScholar.power = 2
        tolarianScholar.toughness = 3
        return tolarianScholar
    }
    // 72 Unwind
    // 73 Vodalian Arcanist
    // 74 Weight of Memory
    // 75 Wizard's Retort
    // 76 Zahid, Djinn of the Lamp
    // 77 Blessing of Belzenlok
    static func CabalEvangel() -> Card {
        let cabalEvangel = Card(name: "Cabal Evangel", rarity: .Common, set: set, number: 78)
        cabalEvangel.setManaCost("2B")
        cabalEvangel.setType(.Creature, .Human, .Cleric)
        cabalEvangel.setFlavorText("\"All hail the Demonlord Belzenlok, Evincar of the Stronghold, Scion of Darkness, Doom of Fools, Lord of the Wastes, Master of the Ebon Hand, Eternal Patriarch of the Cabal...\"")
        cabalEvangel.power = 2
        cabalEvangel.toughness = 2
        return cabalEvangel
    }
    // 79 Cabal Paladin
    // 80 Caligo Skin-Witch
    static func CastDown() -> Card {
        let castDown = Card(name: "Cast Down", rarity: .Uncommon, set: set, number: 81)
        castDown.setManaCost("1B")
        castDown.setType(.Instant)
        castDown.addEffect(TargetedEffect(targetingRestriction: { return $0.isType(.Creature) && !$0.isType(.Legendary) },
                                          { source, target in target.destroy() }
        ))
        castDown.setFlavorText("\"Your life is finished, your name lost, and your work forgotten. It is as though Mazeura never existed.\"\n--Chainer's Torment")
        return castDown
    }
    // 82 Chainer's Torment
    // 83 Dark Bargain
    static func DeathbloomThallid() -> Card {
        let deathbloomThallid = Card(name: "Deathbloom Thallid", rarity: .Common, set: set, number: 84)
        deathbloomThallid.setManaCost("2B")
        deathbloomThallid.setType(.Creature, .Fungus)
        deathbloomThallid.addTriggeredAbility(UntargetedTriggeredAbility(
            source: deathbloomThallid,
            trigger: .ThisDies,
            effect: { $0.getController().createToken(Saproling()) }
        ))
        deathbloomThallid.setFlavorText("\"Nature is not always gentle or kind, but all life begets life.\"\n--Marwyn of Llanowar")
        return deathbloomThallid
    }
    // 85 Demonic Vigor
    // 86 Demonlord Belzenlok
    // 87 Divest
    // 88 Dread Shade
    // 89 Drudge Sentinel
    // 90 The Eldest Reborn
    static func Eviscerate() -> Card {
        let eviscerate = Card(name: "Eviscerate", rarity: .Common, set: set, number: 91)
        eviscerate.setManaCost("3B")
        eviscerate.setType(.Sorcery)
        eviscerate.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature)
        }, { source,target in
            target.destroy()
        }))
        eviscerate.setFlavorText("\"Fear the dark if you must, but don't mistake sunlight for safety.\"\n--Josu Vess")
        return eviscerate
    }
    // 92 Feral Abomination
    // 93 Final Parting
    // 94 Fungal Infection
    // 95 Josu Vess, Lich Knight
    // 96 Kazarov, Sengir Pureblood
    // 97 Knight of Malice
    // 98 Lich's Mastery
    // 99 Lingering Phantom
    // 100 Phyrexian Scriptures
    // 101 Rat Colony
    // 102 Rite of Belzenlok
    // 103 Settle the Score
    // 104 Soul Salvage
    // 105 Stronghold Confessor
    // 106 Thallid Omnivore
    // 107 Thallid Soothsayer
    // 108 Torgaar, Famine Incarnate
    // 109 Urgoros, the Empty One
    // 110 Vicious Offering
    // 111 Whisper, Blood Liturgist
    // 112 Windgrace Acolyte
    // 113 Yargle, Glutton of Urborg
    // 114 Yawgmoth's Vile Offering
    
    
    
    static func Knight() -> Token {
        return (Int.random(in: 1 ... 2) == 1) ? Knight1() : Knight2()
    }
    static func Knight1() -> Token {
        let knight1 = Token(name: "Knight", set: set, number: 1)
        knight1.colors = [Color.White]
        knight1.setType(.Creature, .Knight)
        knight1.vigilance = true
        knight1.power = 2
        knight1.toughness = 2
        return knight1;
    }
    static func Knight2() -> Token {
        let knight2 = Token(name: "Knight", set: set, number: 2)
        knight2.colors = [Color.White]
        knight2.setType(.Creature, .Knight)
        knight2.vigilance = true
        knight2.power = 2
        knight2.toughness = 2
        return knight2;
    }
    // 3 Soldier
    // 4 Cleric
    // 5 Zombie Knight
    // 6 Nightmare Horror
    // 7 Demon
    // 8 Elemental
    // 9 Goblin
    // 10 Karox Bladewing
    
    static func Saproling() -> Token {
        let r = Int.random(in: 1 ... 3)
        return (r == 1) ? Saproling11() : ((r == 12) ? Saproling12() : Saproling13())
    }
    static func Saproling11() -> Token {
        let saproling11 = Token(name: "Saproling", set: set, number: 11)
        saproling11.colors = [.Green]
        saproling11.setType(.Creature, .Saproling)
        saproling11.power = 1
        saproling11.toughness = 1
        return saproling11
    }
    static func Saproling12() -> Token {
        let saproling12 = Token(name: "Saproling", set: set, number: 12)
        saproling12.colors = [.Green]
        saproling12.setType(.Creature, .Saproling)
        saproling12.power = 1
        saproling12.toughness = 1
        return saproling12
    }
    static func Saproling13() -> Token {
        let saproling13 = Token(name: "Saproling", set: set, number: 13)
        saproling13.colors = [.Green]
        saproling13.setType(.Creature, .Saproling)
        saproling13.power = 1
        saproling13.toughness = 1
        return saproling13
    }
    // 14 Construct
    // 15 Jaya Emblem
    // 16 Teferi Emlem
}
