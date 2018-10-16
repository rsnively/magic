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
        callTheCavalry.addEffect(UntargetedEffect({
            callTheCavalry.getController().createToken(Knight())
            callTheCavalry.getController().createToken(Knight())
        }))
        callTheCavalry.setFlavorText("Benalish citizens born under the same constellation share a star-clan. Their loyalty to one another interlaces the Seven Houses.")
        return callTheCavalry
    }
    static func Charge() -> Card {
        let charge = Card(name: "Charge", rarity: .Common, set: set, number: 10)
        charge.setManaCost("W")
        charge.setType(.Instant)
        charge.addEffect(UntargetedEffect({
            charge.getController().getCreatures().forEach({
                $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() + 1
                    object.toughness = object.getBaseToughness() + 1
                    return object
                }))
            })
        }))
        charge.setFlavorText("\"Honor rides before us. All we have to do is catch up\"\n--Danitha Capashen")
        return charge
    }
    // 11 D'Avenant Trapper
    // 12 Danitha Capashen, Pargaon
    // 13 Daring Archaeologist
    // 14 Dauntless Bodygyard
    // 15 Dub
    // 16 Evra, Halcyon Witness
    // 17 Excavation Elephant
    // 18 Fall of the Thran
    static func GideonsReproach() -> Card {
        let gideonsReproach = Card(name: "Gideon's Reproach", rarity: .Common, set: set, number: 19)
        gideonsReproach.setManaCost("1W")
        gideonsReproach.setType(.Instant)
        gideonsReproach.addEffect(TargetedEffect(
            restriction: { return $0.isType(.Creature) && ($0.attacking || $0.blocking) },
            effect: { target in target.dealDamage(4) }
        ))
        gideonsReproach.setFlavorText("On Amonkhet, Gideon lost both his sural and his faith in himself. But he can still throw a punch, and he still knows a bad guy when he sees one.")
        return gideonsReproach
    }
    // 20 Healing Grace
    // 21 History of Benalia
    static func InvokeTheDivine() -> Card {
        let invokeTheDivine = Card(name: "Invoke the Divine", rarity: .Common, set: set, number: 22)
        invokeTheDivine.setManaCost("2W")
        invokeTheDivine.setType(.Instant)
        invokeTheDivine.addEffect(TargetedEffect(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
            effect: { target in
                target.destroy()
                invokeTheDivine.getController().gainLife(4)
            }
        ))
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
    static func SerraAngel() -> Card {
        let serraAngel = Card(name: "Serra Angel", rarity: .Uncommon, set: set, number: 33)
        serraAngel.setManaCost("3WW")
        serraAngel.setType(.Creature, .Angel)
        serraAngel.flying = true
        serraAngel.vigilance = true
        serraAngel.setFlavorText("The angel remembers her past lives like dreams. Her song held up meadows. Her blade drove back darkness. Her wings carried her across the ages.")
        serraAngel.power = 4
        serraAngel.toughness = 4
        return serraAngel
    }
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
    static func Befuddle() -> Card {
        let befuddle = Card(name: "Befuddle", rarity: .Common, set: set, number: 45)
        befuddle.setManaCost("2U")
        befuddle.setType(.Instant)
        befuddle.addEffect(TargetedEffect(
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() - 4
                    return object
                }))
                befuddle.getController().drawCard()
        }))
        befuddle.setFlavorText("\"The trick to talking sense into Keldons is getting them to hold still. I learned that from Radha.\"\n--Jhoira")
        return befuddle
    }
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
            divination.getController().drawCards(2)
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
            restriction: { return $0.getController() == rescue.getController() },
            effect: { target in target.bounce() }
        ))
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
        castDown.addEffect(TargetedEffect(
            restriction: { return $0.isType(.Creature) && !$0.isType(.Legendary) },
            effect: { target in target.destroy() }
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
        deathbloomThallid.addUntargetedTriggeredAbility(
            trigger: .ThisDies,
            effect: { deathbloomThallid.getController().createToken(Saproling()) })
        deathbloomThallid.setFlavorText("\"Nature is not always gentle or kind, but all life begets life.\"\n--Marwyn of Llanowar")
        return deathbloomThallid
    }
    // 85 Demonic Vigor
    // 86 Demonlord Belzenlok
    // 87 Divest
    static func DreadShade() -> Card {
        let dreadShade = Card(name: "Dread Shade", rarity: .Rare, set: set, number: 88)
        dreadShade.setManaCost("BBB")
        dreadShade.setType(.Creature, .Shade)
        dreadShade.addActivatedAbility(UntargetedActivatedAbility(
            source: dreadShade,
            cost: Cost("B"),
            effect: { dreadShade.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                object.power = object.getBasePower() + 1
                object.toughness = object.getBaseToughness() + 1
                return object
            }))
        }))
        dreadShade.setFlavorText("\"The forest surrounding the Vess estate became the Caligo Morass, a vast bog stalked by horrors too terrible to name.\"\n--\"The Fall of the House of Vess\"")
        dreadShade.power = 3
        dreadShade.toughness = 3
        return dreadShade
    }
    // 89 Drudge Sentinel
    // 90 The Eldest Reborn
    static func Eviscerate() -> Card {
        let eviscerate = Card(name: "Eviscerate", rarity: .Common, set: set, number: 91)
        eviscerate.setManaCost("3B")
        eviscerate.setType(.Sorcery)
        eviscerate.addEffect(TargetedEffect(
            restriction: { return $0.isType(.Creature) },
            effect: { target in target.destroy() }
        ))
        eviscerate.setFlavorText("\"Fear the dark if you must, but don't mistake sunlight for safety.\"\n--Josu Vess")
        return eviscerate
    }
    // 92 Feral Abomination
    // 93 Final Parting
    static func FungalInfection() -> Card {
        let fungalInfection = Card(name: "Fungal Infection", rarity: .Common, set: set, number: 94)
        fungalInfection.setManaCost("B")
        fungalInfection.setType(.Instant)
        fungalInfection.addEffect(TargetedEffect(
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() - 1
                    object.toughness = object.getBaseToughness() - 1
                    return object
                }))
                fungalInfection.getController().createToken(Saproling())
        }))
        fungalInfection.setFlavorText("To thallids, the whole world is just a pile of mulch to grow saprolings in.")
        return fungalInfection
    }
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
    static func WindgraceAcolyte() -> Card {
        let windgraceAcolyte = Card(name: "Windgrace Acolyte", rarity: .Common, set: set, number: 112)
        windgraceAcolyte.setManaCost("4B")
        windgraceAcolyte.setType(.Creature, .Cat, .Warrior)
        windgraceAcolyte.flying = true
        windgraceAcolyte.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                windgraceAcolyte.getController().mill(3)
                windgraceAcolyte.getController().gainLife(3)
        })
        windgraceAcolyte.setFlavorText("Acolytes of the lost Lord Windgrace fight to keep Urborg relics out of Cabal hands.")
        windgraceAcolyte.power = 3
        windgraceAcolyte.toughness = 2
        return windgraceAcolyte
    }
    // 113 Yargle, Glutton of Urborg
    // 114 Yawgmoth's Vile Offering
    // 115 Bloodstone Goblin
    // 116 Champion of the Flame
    // 117 Fervent Strike
    // 118 Fiery Intervention
    // 119 Fight with Fire
    static func FireElemental() -> Card {
        let fireElemental = Card(name: "Fire Elemental", rarity: .Common, set: set, number: 120)
        fireElemental.setManaCost("3RR")
        fireElemental.setType(.Creature, .Elemental)
        fireElemental.setFlavorText("\"The best way to learn from a book on pyromancy is to burn it.\"\n--Jaya Ballard")
        fireElemental.power = 5
        fireElemental.toughness = 4
        return fireElemental
    }
    static func FirefistAdept() -> Card {
        let firefistAdept = Card(name: "Firefist Adept", rarity: .Uncommon, set: set, number: 121)
        firefistAdept.setManaCost("4R")
        firefistAdept.setType(.Creature, .Human, .Wizard)
        firefistAdept.addTargetedTriggeredAbility(
            trigger: .ThisETB,
            restriction: { return $0.isType(.Creature) && $0.getController() != firefistAdept.getController() },
            effect: { target in
                let numWizards = firefistAdept.getController().getCreatures().filter({ return $0.isType(.Wizard) }).count
                firefistAdept.dealsDamage(numWizards)
                target.dealDamage(numWizards)
        })
        firefistAdept.setFlavorText("The versatile \"fiery gauntlet\" is among the first spells young Ghitu mages learn.")
        firefistAdept.power = 3
        firefistAdept.toughness = 2
        return firefistAdept
    }
    // 122 The First Eruption
    // 123 The Flame of Keld
    // 124 Frenzied Rage
    // 125 Ghitu Chronicler
    // 126 Ghitu Journeymage
    // 127 Ghitu Lavarunner
    // 128 Goblin Barrage
    // 129 Goblin Chainwhirler
    // 130 Goblin Warchief
    // 131 Haphazard Bombardment
    // 132 Jaya Ballard
    // 133 Jaya's Immolating Inferno
    // 134 Keldon Overseer
    // 135 Keldon Raider
    // 136 Keldon Warcaller
    // 137 Orcish Vandal
    // 138 Radiating Lightning
    // 139 Rampaging Cyclops
    // 140 Run Amok
    // 141 Seismic Shift
    // 142 Shivan Fire
    // 143 Siege-Gang Commander
    // 144 Skirk Prospector
    // 145 Skizzik
    // 146 Squee the Immortal
    // 147 Two-Headed Giant
    // 148 Valduk, Keeper of the Flame
    // 149 Verix Bladewing
    // 150 Warcry Phoenix
    // 151 Warlord's Fury
    // 152 Wizard's Lightning
    // 153 Adventurous Impulse
    // 154 Ancient Animus
    // 155 Arbor Armament
    // 156 Baloth Gorger
    // 157 Broken Bond
    // 158 Corrosive Ooze
    // 159 Elfhame Druid
    // 160 Fungal Plots
    // 161 Gaea's Blessing
    // 162 Gaea's Protector
    // 163 Gift of Growth
    // 164 Grow from the Ashes
    // 165 Grunn, the Lonely King
    // 166 Kamahl's Druidic Vow
    // 167 Krosan Druid
    static func LlanowarElves() -> Card {
        let llanowarElves = Card(name: "Llanowar Elves", rarity: .Common, set: set, number: 168)
        llanowarElves.setManaCost("G")
        llanowarElves.setType(.Creature, .Elf)
        llanowarElves.addActivatedAbility(UntargetedActivatedAbility(
            source: llanowarElves,
            cost: Cost("", tap: true),
            effect: { llanowarElves.getController().addMana(color: .Green) },
            manaAbility: true
        ))
        llanowarElves.setFlavorText("As patient and generous as life, as harsh and merciless as nature.")
        llanowarElves.power = 1
        llanowarElves.toughness = 1
        return llanowarElves
    }
    // 169 Llanowar Envoy
    // 170 Llanowar Scout
    // 171 Mammoth Spider
    // 172 Marwyn, the Nurturer
    // 173 The Mending of Dominaria
    // 174 Multani, Yavimaya's Avatar
    // 175 Nature's Spiral
    // 176 Pierce the Sky
    static func PrimordialWurm() -> Card {
        let primordialWurm = Card(name: "Primordial Wurm", rarity: .Common, set: set, number: 177)
        primordialWurm.setManaCost("4GG")
        primordialWurm.setType(.Creature, .Wurm)
        primordialWurm.setFlavorText("\"You can hear its tail thrashing from a mile away. Keep in mind that its jaws may already be half a mile closer.\"\nJenson Carthalion, Yavimaya exile")
        primordialWurm.power = 7
        primordialWurm.toughness = 6
        return primordialWurm
    }
    // 178 Saproling Migration
    // 179 Song of Freyalise
    static func SporeSwarm() -> Card {
        let sporeSwarm = Card(name: "Spore Swarm", rarity: .Uncommon, set: set, number: 180)
        sporeSwarm.setManaCost("3G")
        sporeSwarm.setType(.Instant)
        sporeSwarm.addEffect(UntargetedEffect({
            sporeSwarm.getController().createToken(Saproling())
            sporeSwarm.getController().createToken(Saproling())
            sporeSwarm.getController().createToken(Saproling())
        }))
        sporeSwarm.setFlavorText("As the irrepressible power of a dormant Multani courses through Yavimaya, the forest passes judgment on travelers and natives alike. Only the fungus prospers.")
        return sporeSwarm
    }
    // 181 Sporecrown Thallid
    // 182 Steel Leaf Champion
    // 183 Sylvan Awakening
    // 184 Territorial Allosaurus
    // 185 Thorn Elemental
    // 186 Untamed Kavu
    static func VerdantForce() -> Card {
        let verdantForce = Card(name: "Verdant Force", rarity: .Rare, set: set, number: 187)
        verdantForce.setManaCost("5GGG")
        verdantForce.setType(.Creature, .Elemental)
        verdantForce.addUntargetedTriggeredAbility(
            trigger: .EachUpkeep,
            effect: { verdantForce.getController().createToken(Saproling()) })
        verdantForce.setFlavorText("The bower shuddered. The stillness broke. The scurf shifted, and a being emerged from the flowers and ferns.")
        verdantForce.power = 7
        verdantForce.toughness = 7
        return verdantForce
    }
    // 188 Wild Onslaught
    static func YavimayaSapherd() -> Card {
        let yavimayaSapherd = Card(name: "Yavimaya Sapherd", rarity: .Common, set: set, number: 189)
        yavimayaSapherd.setManaCost("2G")
        yavimayaSapherd.setType(.Creature, .Fungus)
        yavimayaSapherd.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { yavimayaSapherd.getController().createToken(Saproling()) })
        yavimayaSapherd.setFlavorText("\"When their community grows cluttered, thallids begin a traditional bobbing dance, then trek out in all directions.\"\n--Sarpadian Empires, vol. III")
        return yavimayaSapherd
    }
    // 190 Adeliz, the Cinder Wind
    // 191 Arvad, the Cursed
    // 192 Aryel, Knight of Windgrace
    // 193 Darigaaz Reincarnated
    // 194 Garna, the Bloodflame
    // 195 Grand Warlord Radha
    // 196 Hallar, the Firefletcher
    // 197 Jhoira, Weatherlight Captain
    // 198 Jodah, Archmage Eternal
    // 199 Muldrotha, the Gravetide
    // 200 Oath of Teferi
    // 201 Primevals' Glorious Rebirth
    // 202 Raff Capashen, Ship's Mage
    // 203 Rona, Disciple of Ghix
    // 204 Shanna, Sisay's Legacy
    // 205 Slimefoot, the Stowaway
    // 206 Tatyova, Benthic Druid
    // 207 Teferi, Hero of Dominaria
    // 208 Tiana, Ship's Caretaker
    // 209 Aesthir Glider
    // 210 Amaranthine Wall
    // 211 Blackblade Reforged
    // 212 Bloodtallow Candle
    // 213 Damping Sphere
    // 214 Forebear's Blade
    // 215 Gilded Lotus
    // 216 Guardians of Koilos
    // 217 Helm of the Host
    // 218 Howling Golem
    static func IcyManipulator() -> Card {
        let icyManipulator = Card(name: "Icy Manipulator", rarity: .Uncommon, set: set, number: 219)
        icyManipulator.setManaCost("4")
        icyManipulator.setType(.Artifact)
        icyManipulator.addActivatedAbility(TargetedActivatedAbility(
            source: icyManipulator,
            cost: Cost("1", tap: true),
            restriction: { return $0.isType(.Artifact) || $0.isType(.Creature) || $0.isType(.Land) },
            effect: { target in target.tap() }
        ))
        icyManipulator.setFlavorText("Ice may thaw, but malice never does.")
        return icyManipulator
    }
    // 220 Jhoira's Familiar
    // 221 Jousting Lance
    // 222 Juggernaut
    // 223 Mishra's Self Replicator
    // 224 Mox Ambber
    // 225 Naviagor's Compass
    // 226 Pardic Wanderer
    static func PowerstoneShard() -> Card {
        let powerstoneShard = Card(name: "Powerstone Shard", rarity: .Common, set: set, number: 227)
        powerstoneShard.setManaCost("3")
        powerstoneShard.setType(.Artifact)
        powerstoneShard.addActivatedAbility(UntargetedActivatedAbility(
            source: powerstoneShard,
            cost: Cost("", tap: true),
            effect: {
                let count = powerstoneShard.getController().getArtifacts().filter({ return $0.getName() == "Powerstone Shard" }).count
                for _ in 1...count { powerstoneShard.getController().addMana(color: nil) }
            },
            manaAbility: true
        ))
        powerstoneShard.setFlavorText("\"Light passing through a powerstone is refracted by eternity and colored by planar energy. I wonder how the world appeared through Urza's eyes?\"\n--Teferi")
        return powerstoneShard
    }
    // 228 Shield of the Realm
    // 229 Short Sword
    // 230 Skittering Surveyor
    // 231 Sorcerer's Wand
    // 232 Sparring Construct
    // 233 Thran Temporal Gateway
    // 234 Traxos, Scourge of Kroog
    // 235 Urza's Tome
    // 236 Voltaic Servant
    // 237 Weatherlight
    // 238 Cabal Stronghold
    // 239 Clifftop Retreat
    // 240 Hinterland Harbor
    // 241 Isolated Chapel
    // 242 Memorial to Folly
    // 243 Memorial to Genius
    // 244 Memorial to Glory
    // 245 Memorial to Unity
    // 246 Memorial to War
    // 247 Sulfur Falls
    // 248 Woodland Cemetary
    // 249 Zhalfirin Void
    // Basics



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
