import Foundation

enum RIX {
    static var set = "rix"
    static var count = 196
    
    // 1 Baffling End
    // 2 Bishop of Binding
    // 3 Blazing Hope
    // 4 Cleansing Ray
    static func DivineVerdict() -> Card {
        let divineVerdict = Card(name: "Divine Verdict", rarity: .Common, set: set, number: 5)
        divineVerdict.setManaCost("3W")
        divineVerdict.setType(.Instant)
        divineVerdict.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && ($0.attacking || $0.blocking)},
            effect: { let _ = $0.destroy() }))
        divineVerdict.setFlavorText("Cunning warriors and dim-witted beasts alike fall under the church's harsh judgment.")
        return divineVerdict
    }
    // 6 Everdawn Champion
    static func ExultantSkymarcher() -> Card {
        let exultantSkymarcher = Card(name: "Exultant Skymarcher", rarity: .Common, set: set, number: 7)
        exultantSkymarcher.setManaCost("1WW")
        exultantSkymarcher.setType(.Creature, .Vampire, .Soldier)
        exultantSkymarcher.flying = true
        exultantSkymarcher.setFlavorText("\"We have come at last to this holiest of holy places. What was stolen from us long ago is ours once again.\"")
        exultantSkymarcher.power = 2
        exultantSkymarcher.toughness = 3
        return exultantSkymarcher
    }
    // 8 Famished Paladin
    // 9 Forerunner of the Legion
    // 10 Imperial Ceratops
    // 11 Legion Conquistador
    // 12 Luminous Bonds
    static func MajesticHeliopterus() -> Card {
        let majesticHeliopterus = Card(name: "Majestic Heliopterus", rarity: .Uncommon, set: set, number: 13)
        majesticHeliopterus.setManaCost("3W")
        majesticHeliopterus.setType(.Creature, .Dinosaur)
        majesticHeliopterus.flying = true
        majesticHeliopterus.addTriggeredAbility(
            trigger: .ThisAttacks,
            effect: TargetedEffect.SingleObject(
                restriction: { return  $0.id != majesticHeliopterus.id && $0.isType(.Dinosaur) },
                effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.flying = true
                    return object
                }))
        }))
        majesticHeliopterus.setFlavorText("\"Its rise is like the sun's, a beautiful beginning. Its descent is like the sun's, a frightening ending.\"\n--Huatli")
        majesticHeliopterus.power = 2
        majesticHeliopterus.toughness = 2
        return majesticHeliopterus
    }
    static func MartyrOfDusk() -> Card {
        let martyrOfDusk = Card(name: "Martyr of Dusk", rarity: .Common, set: set, number: 14)
        martyrOfDusk.setManaCost("1W")
        martyrOfDusk.setType(.Creature, .Vampire, .Soldier)
        martyrOfDusk.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { martyrOfDusk.getController().createToken(XLN.Vampire()) })
        martyrOfDusk.setFlavorText("\"Should I fall, take up our standard and carry on. The Legion must alwasy prevail.\"")
        martyrOfDusk.power = 2
        martyrOfDusk.toughness = 1
        return martyrOfDusk
    }
    static func MomentOfTriumph() -> Card {
        let momentOfTriump = Card(name: "Moment of Triumph", rarity: .Common, set: set, number: 15)
        momentOfTriump.setManaCost("W")
        momentOfTriump.setType(.Instant)
        momentOfTriump.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                target.pump(2, 2)
                momentOfTriump.getController().gainLife(2)
            }))
        momentOfTriump.setFlavorText("\"The time of salvation is at hand. Dusk washes over the world, and the Legion will rise immortal!\"")
        return momentOfTriump
    }
    // 16 Paladin of Atonement
    // 17 Pride of Conquerors
    // 18 Radiant Destiny
    static func RaptorCompanion() -> Card {
        let raptorCompanion = Card(name: "Raptor Companion", rarity: .Common, set: set, number: 19)
        raptorCompanion.setManaCost("1W")
        raptorCompanion.setType(.Creature, .Dinosaur)
        raptorCompanion.setFlavorText("The abundance of foes in Orazca means the raptors no longer need any orders.")
        raptorCompanion.power = 3
        raptorCompanion.toughness = 1
        return raptorCompanion
    }
    // 20 Sanguine Glorifier
    // 21 Skymarcher Aspirant
    // 22 Slaughter the Strong
    // 23 Snubhorn Sentry
    // 24 Sphinx's Decree
    // 25 Squire's Devotion
    static func SunSentinel() -> Card {
        let sunSentinel = Card(name: "Sun Sentinel", rarity: .Common, set: set, number: 26)
        sunSentinel.setManaCost("1W")
        sunSentinel.setType(.Creature, .Human, .Soldier)
        sunSentinel.vigilance = true
        sunSentinel.setFlavorText("\"I will not sleep until Orazca is ours once more.\"")
        sunSentinel.power = 2
        sunSentinel.toughness = 2
        return sunSentinel
    }
    // 27 Sun-Crested Pterodon
    // 28 Temple Altisaur
    // 29 Trapjaw Tyrant
    // 30 Zetalpa, Primal Dawn
    // 31 Admiral's Order
    // 32 Acquatic Incursion
    // 33 Crafty Cutpurse
    // 34 Crashing Tide
    // 35 Curious Obsession
    // 36 Deadeye Rig-Hauler
    // 37 Expel from Orazca
    // 38 Flood of Recollection
    // 39 Hornswoggle
    // 40 Induced Amnesia
    // 41 Kitesail Corsair
    // 42 Kumena's Awakening
    static func MistCloakedHerald() -> Card {
        let mistCloakedHerald = Card(name: "Mist-Cloaked Herald", rarity: .Common, set: set, number: 43)
        mistCloakedHerald.setManaCost("U")
        mistCloakedHerald.setType(.Creature, .Merfolk, .Warrior)
        mistCloakedHerald.unblockable = true
        mistCloakedHerald.setFlavorText("With matchless speed, the River Heralds fought a running battle against the three enemy forces.")
        mistCloakedHerald.power = 1
        mistCloakedHerald.toughness = 1
        return mistCloakedHerald
    }
    // 44 Negate
    // 45 Nezahal, Primal Tide
    // 46 Release to the Wind
    // 47 River Darter
    // 48 Riverwise Augur
    static func SailorOfMeans() -> Card {
        let sailorOfMeans = Card(name: "Sailor of Means", rarity: .Common, set: set, number: 49)
        sailorOfMeans.setManaCost("2U")
        sailorOfMeans.setType(.Creature, .Human, .Pirate)
        sailorOfMeans.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { sailorOfMeans.getController().createToken(XLN.Treasure()) })
        sailorOfMeans.setFlavorText("The rising tide of Orazca's plunder lifted all ships.")
        sailorOfMeans.power = 1
        sailorOfMeans.toughness = 4
        return sailorOfMeans
    }
    // 50 Sea Legs
    // 51 Seafloor Oracle
    // 52 Secrets of the Golden City
    // 53 Silvergill Adept
    // 54 Siren Reaver
    // 55 Slippery Scoundrel
    // 56 Soul of the Rapids
    // 57 Spire Winder
    static func SwornGuardian() -> Card {
        let swornGuardian = Card(name: "Sworn Guardian", rarity: .Common, set: set, number: 58)
        swornGuardian.setManaCost("1U")
        swornGuardian.setType(.Creature, .Merfolk, .Warrior)
        swornGuardian.setFlavorText("For the River Heralds, the Immortal Sun is an object of terror and devastation. The idea that anyone would retrieve it for their own use is utterly abhorrent.")
        swornGuardian.power = 1
        swornGuardian.toughness = 3
        return swornGuardian
    }
    // 59 Timestream Navigator
    // 60 Warkite Marauder
    // 61 Waterknot
    static func ArterialFlow() -> Card {
        let arterialFlow = Card(name: "Arterial Flow", rarity: .Uncommon, set: set, number: 62)
        arterialFlow.setManaCost("1BB")
        arterialFlow.setType(.Sorcery)
        arterialFlow.addEffect({
            arterialFlow.getOpponent().discard(2)
            let controlVampire = !arterialFlow.getController().getPermanents().filter({ $0.isType(.Vampire) }).isEmpty
            if controlVampire {
                arterialFlow.getOpponent().loseLife(2)
                arterialFlow.getController().gainLife(2)
            }
        })
        arterialFlow.setFlavorText("\"It is impious to admit, but I do enjoy pirate blood. Something in the salty tang of it, the spice of rebellion.\"")
        return arterialFlow
    }
    static func CanalMonitor() -> Card {
        let canalMonitor = Card(name: "Canal Monitor", rarity: .Common, set: set, number: 63)
        canalMonitor.setManaCost("4B")
        canalMonitor.setType(.Creature, .Lizard)
        canalMonitor.setFlavorText("The first goblin tried to swim the canal. The second built a raft. The last and craftiest goblin launched herself from a firecannon and soared over the canal, trailing smoke. All were eaten, but only one was cooked.")
        canalMonitor.power = 5
        canalMonitor.toughness = 3
        return canalMonitor
    }
    static func ChampionOfDusk() -> Card {
        let championOfDusk = Card(name: "Champion of Dusk", rarity: .Rare, set: set, number: 64)
        championOfDusk.setManaCost("3BB")
        championOfDusk.setType(.Creature, .Vampire, .Knight)
        championOfDusk.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                let numVampires = championOfDusk.getController().getPermanents().filter({$0.isType(.Vampire)}).count
                championOfDusk.getController().drawCards(numVampires)
                championOfDusk.getController().loseLife(numVampires)
            })
        championOfDusk.setFlavorText("\"Drench these golden streets in the blood of our enemies.\"")
        championOfDusk.power = 4
        championOfDusk.toughness = 4
        return championOfDusk
    }
    // 65 Dark Inquiry
    // 66 Dead Man's Chest
    // 67 Dinosaur Hunter
    // 68 Dire Fleet Poisoner
    // 69 Dusk Charger
    static func DuskLegionZealot() -> Card {
        let duskLegionZealot = Card(name: "Dusk Legion Zealot", rarity: .Common, set: set, number: 70)
        duskLegionZealot.setManaCost("1B")
        duskLegionZealot.setType(.Creature, .Vampire, .Soldier)
        duskLegionZealot.addTriggeredAbility(
            trigger: .ThisETB,
            effect: {
                duskLegionZealot.getController().drawCard()
                duskLegionZealot.getController().loseLife(1)
            })
        duskLegionZealot.setFlavorText("Once they reached Orazca, the Legion's explorers ransacked tombs and temples, hunting for the Immortal Sun.")
        duskLegionZealot.power = 1
        duskLegionZealot.toughness = 1
        return duskLegionZealot
    }
    // 71 Fathom Fleet Boarder
    // 72 Forerunner of the Coalition
    // 73 Golden Demise
    // 74 Grasping Scoundrel
    static func GruesomeFate() -> Card {
        let gruesomeFate = Card(name: "Gruesome Fate", rarity: .Common, set: set, number: 75)
        gruesomeFate.setManaCost("2B")
        gruesomeFate.setType(.Sorcery)
        gruesomeFate.addEffect {
            let numCreatures = gruesomeFate.getController().getCreatures().count
            gruesomeFate.getOpponent().loseLife(numCreatures)
        }
        gruesomeFate.setFlavorText("\"You were keen enough to sink your fangs into us, vampire! And now you're afraid of a few little nibbles?\"\nUdvil \"Ratty\" Ratlock")
        return gruesomeFate
    }
    static func Impale() -> Card {
        let impale = Card(name: "Impale", rarity: .Common, set: set, number: 76)
        impale.setManaCost("2BB")
        impale.setType(.Sorcery)
        impale.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { target in let _ = target.destroy() }))
        impale.setFlavorText("Never let the glitter of gold distract you from the gleam of steel in the shadows.")
        return impale
    }
    // 77 Mastermind's Acquisition
    // 78 Mausoleum Harpy
    static func MomentOfCraving() -> Card {
        let momentOfCraving = Card(name: "Moment of Craving", rarity: .Common, set: set, number: 79)
        momentOfCraving.setManaCost("1B")
        momentOfCraving.setType(.Instant)
        momentOfCraving.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                target.pump(-2, -2)
                momentOfCraving.getController().gainLife(2)
        }))
        momentOfCraving.setFlavorText("\"The time of condemnation is at hand. Dusk washes over the world, and I consign you to eternal darkness!\"")
        return momentOfCraving
    }
    // 80 Oathsworn Vampire
    // 81 Pitiless Plunderer
    static func RavenousChupacabra() -> Card {
        let ravenousChupacabra = Card(name: "Ravenous Chupacabra", rarity: .Uncommon, set: set, number: 82)
        ravenousChupacabra.setManaCost("2BB")
        ravenousChupacabra.setType(.Creature, .Beast, .Horror)
        ravenousChupacabra.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: { return $0.isType(.Creature) && $0.getController() !== ravenousChupacabra.getController() },
                effect: { let _ = $0.destroy() }))
        ravenousChupacabra.setFlavorText("Opening Orazca released more horrors than just the Immortal Sun.")
        ravenousChupacabra.power = 2
        ravenousChupacabra.toughness = 2
        return ravenousChupacabra
    }
    // 83 Reaver Ambush
    // 84 Recover
    // 85 Sadistic Skymarcher
    // 86 Tetzimoc, Primal Death
    // 87 Tomb Robber
    // 88 Twilight Prophet
    static func VampireRevenant() -> Card {
        let vampireRevenant = Card(name: "Vampire Revenant", rarity: .Common, set: set, number: 89)
        vampireRevenant.setManaCost("3B")
        vampireRevenant.setType(.Creature, .Vampire, .Spirit)
        vampireRevenant.flying = true
        vampireRevenant.setFlavorText("\"A thick fog obscures the port of Leor, but it's not thick enough to muffle the screams.\"\n--Admiral Beckett Brass")
        vampireRevenant.power = 3
        vampireRevenant.toughness = 1
        return vampireRevenant
    }
    // 90 Vona's Hunger
    // 91 Voracious Vampire
    // 92 Blood Sun
    static func Bombard() -> Card {
        let bombard = Card(name: "Bombard", rarity: .Common, set: set, number: 93)
        bombard.setManaCost("2R")
        bombard.setType(.Instant)
        bombard.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) },
            effect: { bombard.damage(to: $0, 4) }))
        bombard.setFlavorText("\"Want to sink a ship? Blow a hole in the hull. Want to kill a regisaur? Same answer.\"\n--Captain Brandis Thorn")
        return bombard
    }
    static func BrasssBounty() -> Card {
        let brasssBounty = Card(name: "Brass's Bounty", rarity: .Rare, set: set, number: 94)
        brasssBounty.setManaCost("6R")
        brasssBounty.setType(.Sorcery)
        brasssBounty.addEffect({
            let numLands = brasssBounty.getController().getLands().count
            for _ in 1 ... numLands {
                brasssBounty.getController().createToken(XLN.Treasure())
            }
        })
        brasssBounty.setFlavorText("\"Why squabble for trinkets when we could be living large off all this gold?\"\n--Admiral Beckett Brass")
        return brasssBounty
    }
    static func BrazenFreebooter() -> Card {
        let brazenFreebooter = Card(name: "Brazen Freebooter", rarity: .Common, set: set, number: 95)
        brazenFreebooter.setManaCost("3R")
        brazenFreebooter.setType(.Creature, .Human, .Pirate)
        brazenFreebooter.addTriggeredAbility(
            trigger: .ThisETB,
            effect: { brazenFreebooter.getController().createToken(XLN.Treasure()) })
        brazenFreebooter.setFlavorText("Finders, keepers.")
        brazenFreebooter.power = 3
        brazenFreebooter.toughness = 3
        return brazenFreebooter
    }
    // 96 Buccaneer's Bravado
    // 97 Charging Tuskodon
    // 98 Daring Buccaneer
    // 99 Dire Fleet Daredevil
    // 100 Etali, Primal Storm
    static func FanaticalFirebrand() -> Card {
        let fanaticalFirebrand = Card(name: "Fanatical Firebrand", rarity: .Common, set: set, number: 101)
        fanaticalFirebrand.setManaCost("R")
        fanaticalFirebrand.setType(.Creature, .Goblin, .Pirate)
        fanaticalFirebrand.haste = true
        fanaticalFirebrand.addActivatedAbility(
            string: "{T}, Sacrifice ~: It deals 1 damage to any target.",
            cost: Cost("", tap: true, life: 0, sacrificeSelf: true),
            effect: TargetedEffect(
                restriction: { _ in return true },
                effect: { fanaticalFirebrand.damage(to: $0, 1) }))
        fanaticalFirebrand.setFlavorText("\"The Brazen Coalition is a firecannon pointed at our enemies. Goblins like him are the spark to its powder.\"\n--Admiral Beckett Brass")
        fanaticalFirebrand.power = 1
        fanaticalFirebrand.toughness = 1
        return fanaticalFirebrand
    }
    // 102 Forerunner of the Empire
    // 103 Form of the Dinosaur
    // 104 Frilled Deathspitter
    // 105 Goblin Trailblazer
    // 106 Mutiny
    // 107 Needletooth Raptor
    static func OrazcaRaptor() -> Card {
        let orazcaRaptor = Card(name: "Orazca Raptor", rarity: .Common, set: set, number: 108)
        orazcaRaptor.setManaCost("2RR")
        orazcaRaptor.setType(.Creature, .Dinosaur)
        orazcaRaptor.setFlavorText("\"If you come across a raptor in the city, stay perfectly still. At least then you'll be well rested when you die.\"\n--Captain Brandis Thorn")
        orazcaRaptor.power = 3
        orazcaRaptor.toughness = 4
        return orazcaRaptor
    }
    // 109 Pirate's Pillage
    // 110 Reckless Rage
    // 111 Rekindling Phoenix
    // 112 See Red
    static func ShakeTheFoundations() -> Card {
        let shakeTheFoundations = Card(name: "Shake the Foundations", rarity: .Uncommon, set: set, number: 113)
        shakeTheFoundations.setManaCost("2R")
        shakeTheFoundations.setType(.Instant)
        shakeTheFoundations.addEffect {
            Game.shared.bothPlayers({ player in
                player.getCreatures().filter({ return !$0.flying }).forEach({ shakeTheFoundations.damage(to: $0, 1) })
            })
            shakeTheFoundations.getController().drawCard()
        }
        shakeTheFoundations.setFlavorText("A threefold calamity with a single will.")
        return shakeTheFoundations
    }
    static func Shatter() -> Card {
        let shatter = Card(name: "Shatter", rarity: .Common, set: set, number: 114)
        shatter.setManaCost("1R")
        shatter.setType(.Instant)
        shatter.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) },
            effect: { target in let _ = target.destroy() }))
        shatter.setFlavorText("Today it's a miracle of architecture, a marvel of stained glass, a symbol of the Legion's power. Tomorrow, driftwood.")
        return shatter
    }
    // 115 Silverclad Ferocidons
    // 116 Stampeding Horncrest
    // 117 Storm Fleet Swashbuckler
    // 118 Sun-Collared Raptor
    // 119 Swaggering Corsair
    // 120 Tilonalli's Crown
    // 121 Tilonalli's Summoner
    static func AggressiveUrge() -> Card {
        let aggressiveUrge = Card(name: "Aggressive Urge", rarity: .Common, set: set, number: 122)
        aggressiveUrge.setManaCost("1G")
        aggressiveUrge.setType(.Instant)
        aggressiveUrge.addEffect(TargetedEffect.SingleObject(
            restriction: { $0.isType(.Creature) },
            effect: { target in
                target.pump(1, 1)
                aggressiveUrge.getController().drawCard()
        }))
        aggressiveUrge.setFlavorText("\"Our lives, our homes, and all our history are at risk. Do not speak to me of peace.\"")
        return aggressiveUrge
    }
    // 123 Cacophodon
    // 124 Cherished Hatchling
    // 125 Colossal Dreadmaw
    // 126 Crested Herdcaller
    // 127 Deeproot Elite
    // 128 Enter the Unknown
    // 129 Forerunner of the Heralds
    // 130 Ghalta, Primal Hunger
    // 131 Giltgrove Stalker
    // 132 Hardy Veteran
    // 133 Hunt the Weak
    // 134 Jade Bearer
    static func JadecraftArtisan() -> Card {
        let jadecraftArtisan = Card(name: "Jadecraft Artisan", rarity: .Common, set: set, number: 135)
        jadecraftArtisan.setManaCost("3G")
        jadecraftArtisan.setType(.Creature, .Merfolk, .Shaman)
        jadecraftArtisan.addTriggeredAbility(
            trigger: .ThisETB,
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Creature) },
                effect: { $0.pump(2, 2) }))
        jadecraftArtisan.setFlavorText("\"A blade is not fully forged until it is given.\"")
        jadecraftArtisan.power = 3
        jadecraftArtisan.toughness = 3
        return jadecraftArtisan
    }
    // 136 Jadelight Ranger
    // 137 Jungleborn Pioneer
    // 138 Knight of the Stampede
    static func Naturalize() -> Card {
        let naturalize = Card(name: "Naturalize", rarity: .Common, set: set, number: 139)
        naturalize.setManaCost("1G")
        naturalize.setType(.Instant)
        naturalize.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
            effect: { target in let _ = target.destroy() }))
        naturalize.setFlavorText("\"Better to let the sword go than to lose the arm with it.\"\n--Captain Lannery Storm")
        return naturalize
    }
    static func OrazcaFrillback() -> Card {
        let orazcaFrillback = Card(name: "Orazca Frillback", rarity: .Common, set: set, number: 140)
        orazcaFrillback.setManaCost("2G")
        orazcaFrillback.setType(.Creature, .Dinosaur)
        orazcaFrillback.setFlavorText("The frillbacks of Orazca soak up the sun on their tall spinal fins. They look slow and sleepy--until they catch the scent of prey.")
        orazcaFrillback.power = 4
        orazcaFrillback.toughness = 2
        return orazcaFrillback
    }
    // 141 Overgrown Armasaur
    // 142 Path of Discovery
    static func Plummet() -> Card {
        let plummet = Card(name: "Plummet", rarity: .Common, set: set, number: 143)
        plummet.setManaCost("1G")
        plummet.setType(.Instant)
        plummet.addEffect(TargetedEffect.SingleObject(
            restriction: { return $0.isType(.Creature) && $0.flying },
            effect: { target in let _ = target.destroy() }))
        plummet.setFlavorText("\"Still, the pterodon chasing the clouds from its skies must bow to the great forest below.\"\n--Mahuiz, Sun Empire archer")
        return plummet
    }
    // 144 Polyraptor
    // 145 Strength of the Pack
    // 146 Swift Warden
    // 147 Tendershoot Dryad
    static func ThrashingBrontodon() -> Card {
        let thrashingBrontodon = Card(name: "Thrashing Brontodon", rarity: .Uncommon, set: set, number: 148)
        thrashingBrontodon.setManaCost("1GG")
        thrashingBrontodon.setType(.Creature, .Dinosaur)
        thrashingBrontodon.addActivatedAbility(
            string: "{1}, Sacrifice ~: Destroy target artifact or enchantment.",
            cost: Cost("1", tap: false, life: 0, sacrificeSelf: true),
            effect: TargetedEffect.SingleObject(
                restriction: { $0.isType(.Artifact) || $0.isType(.Enchantment) },
                effect: { let _ = $0.destroy() }))
        thrashingBrontodon.setFlavorText("It cares more about preserving the herd's territory than about preserving itself.")
        thrashingBrontodon.power = 3
        thrashingBrontodon.toughness = 4
        return thrashingBrontodon
    }
    // 149 Thunderherd Migration
    // 150 Wayward Swordtooth
    // 151 World Shaper
    // 152 Angrath, the Flame-Chained
    // 153 Atzocan Seer
    // 154 Azor, the Lawbringer
    // 155 Deadeye Brawler
    // 156 Dire Fleet Neckbreaker
    // 157 Elenda, the Dusk Rose
    // 158 Hadana's Climb // Winged Temple of Orazca
    // 159 Huatli, Radiant Champion
    // 160 Journey to Eternity // Atzal, Cave of Eternity
    // 161 Jungle Creeper
    // 162 Kumena, Tyrant of Orazca
    // 163 Legion Lieutenant
    // 164 Merfolk Mistbinder
    // 165 Path of Mettle // Metzali, Tower of Triumph
    // 166 Profane Procession // Tomb of the Dusk Rose
    // 167 Protean Raider
    // 168 Raging Regisaur
    // 169 Relentless Raptor
    // 170 Resplendent Griffin
    // 171 Siegehorn Ceratops
    static func StormFleetSprinter() -> Card {
        let stormFleetSprinter = Card(name: "Storm Fleet Sprinter", rarity: .Uncommon, set: set, number: 172)
        stormFleetSprinter.setManaCost("1UR")
        stormFleetSprinter.setType(.Creature, .Human, .Pirate)
        stormFleetSprinter.haste = true
        stormFleetSprinter.unblockable = true
        stormFleetSprinter.setFlavorText("\"Charge like a red-hot cannonball straight to your target. You slow down, you sink.\"\n--Captain Lannery Storm")
        stormFleetSprinter.power = 2
        stormFleetSprinter.toughness = 2
        return stormFleetSprinter
    }
    // 173 Storm the Vault // Vault of Catlacan
    // 174 Zacama, Primal Calamity
    // 175 Awakened Amalgam
    // 176 Azor's Gateway // Sanctum of the Sun
    // 177 Captain's Hook
    static func GleamingBarrier() -> Card {
        let gleamingBarrier = Card(name: "Gleaming Barrier", rarity: .Common, set: set, number: 178)
        gleamingBarrier.setManaCost("2")
        gleamingBarrier.setType(.Artifact, .Creature, .Wall)
        gleamingBarrier.defender = true
        gleamingBarrier.addTriggeredAbility(
            trigger: .ThisDies,
            effect: { gleamingBarrier.getController().createToken(XLN.Treasure()) })
        gleamingBarrier.setFlavorText("\"Gold without freedom might as well be lead.\"\n--Angrath")
        gleamingBarrier.power = 0
        gleamingBarrier.toughness = 4
        return gleamingBarrier
    }
    // 179 Golden Guardian // Gold-Forge Garrison
    // 180 The Immortal Sun
    // 181 Orazca Relic
    // 182 Silent Gravestone
    // 183 Strider Harness
    // 184 Traveler's Amulet
    // 185 Arch of Orazca
    // 186 Evolving Wilds
    // 187 Forsaken Sanctuary
    // 188 Foul Orchard
    // 189 Highland Lake
    // 190 Stone Quarry
    // 191 Woodland Stream
    // 192 Plains
    // 193 Island
    // 194 Swamp
    // 195 Forest
    // 196 Mountain
}

