import Foundation

enum M19 {
    static var set = "m19"
    static var count = 280
    
    static func AegisOfTheHeavens() -> Card {
        let aegisOfTheHeavens = Card(name: "Aegis of the Heavens", rarity: .Uncommon, set: set, number: 1)
        aegisOfTheHeavens.setManaCost("1W")
        aegisOfTheHeavens.setType(.Instant)
        aegisOfTheHeavens.addTargetedEffect(
            restriction: { $0.isType(.Creature) },
            effect: { $0.pump(1, 7) })
        aegisOfTheHeavens.setFlavorText("Inner strength is never seen until it makes all the difference.")
        return aegisOfTheHeavens
    }
    // 2 Aethershield Artificer
    // 3 Ajani, Adversary of Tyrants
    // 4 Ajani's Last Stand
    // 5 Ajani's Pridemate
    // 6 Ajani's Welcome
    static func AngelOfTheDawn() -> Card {
        let angelOfTheDawn = Card(name: "Angel of the Dawn", rarity: .Common, set: set, number: 7)
        angelOfTheDawn.setManaCost("4W")
        angelOfTheDawn.setType(.Creature, .Angel)
        angelOfTheDawn.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { angelOfTheDawn.getController().getCreatures().forEach({
                $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() + 1
                    object.toughness = object.getBaseToughness() + 1
                    object.vigilance = true
                    return object
                }))
            })
        })
        angelOfTheDawn.setFlavorText("She sings for all those who have been silenced.")
        angelOfTheDawn.power = 3
        angelOfTheDawn.toughness = 3
        return angelOfTheDawn
    }
    // 8 Cavalry Drillmaster
    // 9 Cleansing Nova
    static func DaybreakChaplain() -> Card {
        let daybreakChaplain = Card(name: "Daybreak Chaplain", rarity: .Common, set: set, number: 10)
        daybreakChaplain.setManaCost("1W")
        daybreakChaplain.setType(.Creature, .Human, .Cleric)
        daybreakChaplain.lifelink = true
        daybreakChaplain.setFlavorText("\"May the light shine through me to guide the lost.\"")
        daybreakChaplain.power = 1
        daybreakChaplain.toughness = 3
        return daybreakChaplain
    }
    static func DwarvenPriest() -> Card {
        let dwarvenPriest = Card(name: "Dwarven Priest", rarity: .Common, set: set, number: 11)
        dwarvenPriest.setManaCost("3W")
        dwarvenPriest.setType(.Creature, .Dwarf, .Cleric)
        dwarvenPriest.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { dwarvenPriest.getController().gainLife(dwarvenPriest.getController().getCreatures().count) })
        dwarvenPriest.setFlavorText("\"These storied halls are under my protection.\"")
        dwarvenPriest.power = 2
        dwarvenPriest.toughness = 4
        return dwarvenPriest
    }
    static func GallantCavalry() -> Card {
        let gallantCavalry = Card(name: "Gallant Cavalry", rarity: .Common, set: set, number: 12)
        gallantCavalry.setManaCost("3W")
        gallantCavalry.setType(.Creature, .Human, .Knight)
        gallantCavalry.vigilance = true
        gallantCavalry.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { gallantCavalry.getController().createToken(Knight()) })
        gallantCavalry.setFlavorText("\"Our duty does not stop on our borders.\"")
        gallantCavalry.power = 2
        gallantCavalry.toughness = 2
        return gallantCavalry
    }
    static func HeraldOfFaith() -> Card {
        let heraldOfFaith = Card(name: "Herald of Faith", rarity: .Uncommon, set: set, number: 13)
        heraldOfFaith.setManaCost("3WW")
        heraldOfFaith.setType(.Creature, .Angel)
        heraldOfFaith.flying = true
        heraldOfFaith.addUntargetedTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { heraldOfFaith.getController().gainLife(2) })
        heraldOfFaith.setFlavorText("The clerics prayed for salvation. The soldiers prayed for victory. Both prayers were answered.")
        heraldOfFaith.power = 4
        heraldOfFaith.toughness = 3
        return heraldOfFaith
    }
    // 14 Hieromancer's Cage
    static func InspiredCharge() -> Card {
        let inspiredCharge = Card(name: "Inspired Charge", rarity: .Common, set: set, number: 15)
        inspiredCharge.setManaCost("2WW")
        inspiredCharge.setType(.Instant)
        inspiredCharge.addUntargetedEffect({
            inspiredCharge.getController().getCreatures().forEach({ creature in
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() + 2
                    object.toughness = object.getBaseToughness() + 1
                    return object
                }))
            })
        })
        inspiredCharge.setFlavorText("\"Impossible! How could they overwhelm us? We had barricades, war elephants, ... and they were barely a tenth of our number!\"\n--General Avitora")
        return inspiredCharge
    }
    static func InvokeTheDivine() -> Card {
        let invokeTheDivine = Card(name: "Invoke the Divine", rarity: .Common, set: set, number: 16)
        invokeTheDivine.setManaCost("2W")
        invokeTheDivine.setType(.Instant)
        invokeTheDivine.addTargetedEffect(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
            effect: { target in
                target.destroy()
                invokeTheDivine.getController().gainLife(4)
            })
        invokeTheDivine.setFlavorText("\"Let go of all that harms you. Cast your burdens into the darkness, and build for the faithful a house of light.\"\n--<i>Song of All</i>, canto 1008")
        return invokeTheDivine
    }
    // 17 Isolate
    static func KnightOfTheTusk() -> Card {
        let knightOfTheTusk = Card(name: "Knight of the Tusk", rarity: .Common, set: set, number: 18)
        knightOfTheTusk.setManaCost("4WW")
        knightOfTheTusk.setType(.Creature, .Human, .Knight)
        knightOfTheTusk.vigilance = true
        knightOfTheTusk.setFlavorText("\"Horse? Who needs a horse?\"")
        knightOfTheTusk.power = 3
        knightOfTheTusk.toughness = 7
        return knightOfTheTusk
    }
    // 19 Knight's Pledge
    // 20 Knightly Valor
    // 21 Lena, Selfless Champion
    // 22 Leonin Vanguard
    static func LeoninWarleader() -> Card {
        let leoninWarleader = Card(name: "Leonin Warleader", rarity: .Rare, set: set, number: 23)
        leoninWarleader.setManaCost("2WW")
        leoninWarleader.setType(.Creature, .Cat, .Soldier)
        leoninWarleader.addUntargetedTriggeredAbility(
            trigger: .ThisAttacks,
            effect: {
                let tokens: [Object] = [Cat(), Cat()]
                for token in tokens {
                    token.attacking = true
                    token.setTapped(true)
                    leoninWarleader.getController().createToken(token)
                }
        })
        leoninWarleader.setFlavorText("When one leonin hunts, many more are surely nearby.")
        leoninWarleader.power = 4
        leoninWarleader.toughness = 4
        return leoninWarleader
    }
    static func LoxodonLineBreaker() -> Card {
        let loxodonLineBreaker = Card(name: "Loxodon Line Breaker", rarity: .Common, set: set, number: 24)
        loxodonLineBreaker.setManaCost("2W")
        loxodonLineBreaker.setType(.Creature, .Elephant, .Soldier)
        loxodonLineBreaker.setFlavorText("Loxodons are firm in stature and spirit. No matter the odds, they are always first into battle.")
        loxodonLineBreaker.power = 3
        loxodonLineBreaker.toughness = 2
        return loxodonLineBreaker
    }
    // 25 Luminous Bonds
    // 26 Make a Stand
    // 27 Mentor of the Meek
    static func MightyLeap() -> Card {
        let mightyLeap = Card(name: "Mighty Leap", rarity: .Common, set: set, number: 28)
        mightyLeap.setManaCost("1W")
        mightyLeap.setType(.Instant)
        mightyLeap.addTargetedEffect(
            restriction: { $0.isType(.Creature) },
            effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                object.power = object.getBasePower() + 2
                object.toughness = object.getBaseToughness() + 2
                object.flying = true
                return object
            }))
        })
        mightyLeap.setFlavorText("\"I feel the presence of the God-Pharoah in the Second Sun, and I rise upon its rays.\"")
        return mightyLeap
    }
    // 29 Militia Bugler
    // 30 Novice Knight
    static func OreskosSwiftclaw() -> Card {
        let oreskosSwiftclaw = Card(name: "Oreskos Swifclaw", rarity: .Common, set: set, number: 31)
        oreskosSwiftclaw.setManaCost("1W")
        oreskosSwiftclaw.setType(.Creature, .Cat, .Warrior)
        oreskosSwiftclaw.setFlavorText("The leonin of Oreskos are quick to take offense -- not because they are thin-skinned, but because they are always ready for a fight.")
        oreskosSwiftclaw.power = 3
        oreskosSwiftclaw.toughness = 1
        return oreskosSwiftclaw
    }
    static func PegasusCourser() -> Card {
        let pegasusCourser = Card(name: "Pegasus Couser", rarity: .Common, set: set, number: 32)
        pegasusCourser.setManaCost("2W")
        pegasusCourser.setType(.Creature, .Pegasus)
        pegasusCourser.flying = true
        pegasusCourser.addTargetedTriggeredAbility(
            trigger: .ThisAttacks,
            restriction: { $0.attacking && $0.isType(.Creature) && $0 != pegasusCourser },
            effect: { $0.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                object.flying = true
                return object
            }))
        })
        pegasusCourser.setFlavorText("A pegasus chooses its rider, bearing the worthy into the clouds and tossing all others to the ground.")
        pegasusCourser.power = 1
        pegasusCourser.toughness = 3
        return pegasusCourser
    }
    // 33 Remorseful Cleric
    // 34 Resplendent Angel
    static func Revitalize() -> Card {
        let revitalize = Card(name: "Revitalize", rarity: .Common, set: set, number: 35)
        revitalize.setManaCost("1W")
        revitalize.setType(.Instant)
        revitalize.addUntargetedEffect({
            revitalize.getController().gainLife(3)
            revitalize.getController().drawCard()
        })
        revitalize.setFlavorText("\"A potion is no substitute for a skilled surgeon, but it will hold your bits in.\"\n--Torricks, battlefield medic")
        return revitalize
    }
    static func RustwingFalcon() -> Card {
        let rustwingFalcon = Card(name: "Rustwing Falcon", rarity: .Common, set: set, number: 36)
        rustwingFalcon.setManaCost("W")
        rustwingFalcon.setType(.Creature, .Bird)
        rustwingFalcon.flying = true
        rustwingFalcon.setFlavorText("Native to wide prairies and scrublands, falcons occasionally roost in dragon skeletons.")
        rustwingFalcon.power = 1
        rustwingFalcon.toughness = 2
        return rustwingFalcon
    }
    // 37 Shield Mare
    static func StarCrownedStag() -> Card {
        let starCrownedStag = Card(name: "Star-Crowned Stag", rarity: .Common, set: set, number: 38)
        starCrownedStag.setManaCost("3W")
        starCrownedStag.setType(.Creature, .Elk)
        starCrownedStag.addTargetedTriggeredAbility(
            trigger: .ThisAttacks,
            restriction: { $0.isType(.Creature) && $0.getController() != starCrownedStag.getController() },
            effect: { $0.tap() })
        starCrownedStag.setFlavorText("White as starlight on snow, it appears only on the eve of the winter solstice.")
        starCrownedStag.power = 3
        starCrownedStag.toughness = 3
        return starCrownedStag
    }
    // 39 Suncleanser
    static func TakeVengeance() -> Card {
        let takeVengeance = Card(name: "Take Vengeance", rarity: .Common, set: set, number: 40)
        takeVengeance.setManaCost("1W")
        takeVengeance.setType(.Sorcery)
        takeVengeance.addTargetedEffect(
            restriction: { return $0.isType(.Creature) && $0.isTapped },
            effect: { target in target.destroy() })
        takeVengeance.setFlavorText("\"Your death will be a balm, your passing a welcome revision, and all will sigh with peace to know your demise.\"")
        return takeVengeance
    }
    // 41 Trusty Packbeast
    // 42 Valiant Knight
    // 43 Aether Tunnel
    // 44 Anticipate
    // 45 Aven Wind Mage
    static func AviationPioneer() -> Card {
        let aviationPioneer = Card(name: "Aviation Pioneer", rarity: .Common, set: set, number: 46)
        aviationPioneer.setManaCost("2U")
        aviationPioneer.setType(.Creature, .Human, .Artificer)
        aviationPioneer.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { aviationPioneer.getController().createToken(Thopter()) })
        aviationPioneer.setFlavorText("\"They say perfection is unattainable, but they said that about flight too.\"")
        aviationPioneer.power = 1
        aviationPioneer.toughness = 2
        return aviationPioneer
    }
    // 47 Bone to Ash
    // 48 Cancel
    // 49 Departed Deckhand
    static func Disperse() -> Card {
        let disperse = Card(name: "Disperse", rarity: .Common, set: set, number: 50)
        disperse.setManaCost("1U")
        disperse.setType(.Instant)
        disperse.addTargetedEffect(
            restriction: { return !$0.isType(.Land) },
            effect: { target in target.bounce() })
        disperse.setFlavorText("It's pointless to hold on when you have nothing to hold on with.")
        return disperse
    }
    static func Divination() -> Card {
        let divination = Card(name: "Divination", rarity: .Common, set: set, number: 51)
        divination.setManaCost("2U")
        divination.setType(.Sorcery)
        divination.addUntargetedEffect({
            divination.getController().drawCards(2)
        })
        divination.setFlavorText("\"The stars mark your destiny. May you accept the fate thus divulged.\"")
        return divination
    }
    // 52 Djinn of Wishes
    // 53 Dwindle
    // 54 Essence Scatter
    // 55 Exclusion Mage
    // 56 Frilled Sea Serpent
    // 57 Gearsmith Prodigy
    // 58 Ghostform
    // 59 Horizon Scholar
    // 60 Metamorphic Alteration
    // 61 Mirror Image
    // 62 Mistcaller
    static func MysticArchaeologist() -> Card {
        let mysticArchaeologist = Card(name: "Mystic Archaeologist", rarity: .Rare, set: set, number: 63)
        mysticArchaeologist.setManaCost("1U")
        mysticArchaeologist.setType(.Creature, .Human, .Wizard)
        mysticArchaeologist.addUntargetedActivatedAbility(
            cost: Cost("3UU"),
            effect: { mysticArchaeologist.getController().drawCards(2) })
        mysticArchaeologist.setFlavorText("The delight of discovery drives the pursuit of knowledge.")
        mysticArchaeologist.power = 2
        mysticArchaeologist.toughness = 1
        return mysticArchaeologist
    }
    // 64 Omenspeaker
    // 65 Omniscience
    static func OneWithTheMachine() -> Card {
        let oneWithTheMachine = Card(name: "One with the Machine", rarity: .Rare, set: set, number: 66)
        oneWithTheMachine.setManaCost("3U")
        oneWithTheMachine.setType(.Sorcery)
        oneWithTheMachine.addUntargetedEffect({
            let artifacts = oneWithTheMachine.getController().getArtifacts()
            let maxArtifactCMC = artifacts.map({ return $0.getConvertedManaCost() }).max()
            oneWithTheMachine.getController().drawCards(maxArtifactCMC ?? 0)
        })
        oneWithTheMachine.setFlavorText("\"When I grafted the Planar Bridge into myself I felt my Planeswalker spark flare beyond my body. The multiverse was my plaything. It felt... incredible.\"\n--Tezzeret")
        return oneWithTheMachine
    }
    // 67 Patient Rebuilding
    // 68 Psychic Corrosion
    // 69 Sai, Master Thopterist
    // 70 Salvager of Secrets
    // 71 Scholar of Stars
    // 72 Sift
    // 73 Skilled Animator
    // 74 Sleep
    static func SnappingDrake() -> Card {
        let snappingDrake = Card(name: "Snapping Drake", rarity: .Common, set: set, number: 75)
        snappingDrake.setManaCost("3U")
        snappingDrake.setType(.Creature, .Drake)
        snappingDrake.flying = true
        snappingDrake.setFlavorText("Foul-tempered, poorly trained, and mule-stubborn, the drake is the perfect test of the master's will.")
        snappingDrake.power = 3
        snappingDrake.toughness = 2
        return snappingDrake
    }
    // 76 Supreme Phantom
    // 77 Surge Mare
    // 78 Switcheroo
    // 79 Tezzeret, Artifice Master
    static func TolarianScholar() -> Card {
        let tolarianScholar = Card(name: "Tolarian Scholar", rarity: .Common, set: set, number: 80)
        tolarianScholar.setManaCost("2U")
        tolarianScholar.setType(.Creature, .Human, .Wizard)
        tolarianScholar.setFlavorText("The Tolarian Academies embrace a tradition of study and research while discouraging the kinds of experiments that ruined the original island of Tolaria.")
        tolarianScholar.power = 2
        tolarianScholar.toughness = 3
        return tolarianScholar
    }
    // 81 Totally Lost
    static func UncomfortableChill() -> Card {
        let uncomfortableChill = Card(name: "Uncomfortable Chill", rarity: .Common, set: set, number: 82)
        uncomfortableChill.setManaCost("2U")
        uncomfortableChill.setType(.Instant)
        uncomfortableChill.addUntargetedEffect({
            uncomfortableChill.getController().getOpponent().getCreatures().forEach({ creature in
                creature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() - 2
                    return object
                }))
            })
            uncomfortableChill.getController().drawCard()
        })
        uncomfortableChill.setFlavorText("The cold slowed their movements until only their panicked eyeballs swiveled beneath the ice.")
        return uncomfortableChill
    }
    static func WallOfMist() -> Card {
        let wallOfMist = Card(name: "Wall of Mist", rarity: .Common, set: set, number: 83)
        wallOfMist.setManaCost("1U")
        wallOfMist.setType(.Creature, .Wall)
        wallOfMist.defender = true
        wallOfMist.setFlavorText("The seafloor is flecked with the bones of fools who dared to sail into the mist.")
        wallOfMist.power = 0
        wallOfMist.toughness = 5
        return wallOfMist
    }
    // 84 Windreader Sphinx
    // 85 Abnormal Endurance
    // 86 Blood Divination
    static func Bogstomper() -> Card {
        let bogstomper = Card(name: "Bogstomper", rarity: .Common, set: set, number: 87)
        bogstomper.setManaCost("4BB")
        bogstomper.setType(.Creature, .Beast)
        bogstomper.setFlavorText("\"They are gental herbivores, despite their size. Approach cautiously, and hum a tune to let them know you mean no harm.\"\n--Vivien Reid")
        bogstomper.power = 6
        bogstomper.toughness = 5
        return bogstomper
    }
    // 88 Bone Dragon
    static func ChildOfNight() -> Card {
        let childOfNight = Card(name: "Child of Night", rarity: .Common, set: set, number: 89)
        childOfNight.setManaCost("1B")
        childOfNight.setType(.Creature, .Vampire)
        childOfNight.lifelink = true
        childOfNight.setFlavorText("Sins that would be too gruesome in the light of day are made more pleasing in the dark of night.")
        childOfNight.power = 2
        childOfNight.toughness = 1
        return childOfNight
    }
    // 90 Death Baron
    // 91 Demon of Catastrophes
    // 92 Diregraf Ghoul
    static func DoomedDissenter() -> Card {
        let doomedDissenter = Card(name: "Doomed Dissenter", rarity: .Common, set: set, number: 93)
        doomedDissenter.setManaCost("1B")
        doomedDissenter.setType(.Creature, .Human)
        doomedDissenter.addUntargetedTriggeredAbility(
            trigger: .ThisDies,
            effect: { doomedDissenter.getController().createToken(Zombie()) })
        doomedDissenter.setFlavorText("There is only one fate left to those banished from the God-Pharoah's city.")
        doomedDissenter.power = 1
        doomedDissenter.toughness = 1
        return doomedDissenter
    }
    // 94 Duress
    // 95 Epicure of Blood
    // 96 Fell Specter
    // 97 Fraying Omnipotence
    // 98 Gravedigger
    // 99 Graveyard Marshal
    static func HiredBlade() -> Card {
        let hiredBlade = Card(name: "Hired Blade", rarity: .Common, set: set, number: 100)
        hiredBlade.setManaCost("2B")
        hiredBlade.setType(.Creature, .Human, .Assassin)
        hiredBlade.flash = true
        hiredBlade.setFlavorText("\"If you want them dead, buy some poison. If you want them to have the worst day of their life before dying, then let's talk price.\"")
        hiredBlade.power = 3
        hiredBlade.toughness = 2
        return hiredBlade
    }
    static func InfectiousHorror() -> Card {
        let infectiousHorror = Card(name: "Infectious Horror", rarity: .Common, set: set, number: 101)
        infectiousHorror.setManaCost("3B")
        infectiousHorror.setType(.Creature, .Zombie, .Horror)
        infectiousHorror.addUntargetedTriggeredAbility(
            trigger: .ThisAttacks,
            effect: { infectiousHorror.getController().getOpponent().loseLife(2) })
        infectiousHorror.setFlavorText("Not once in the history of Grixis has anyone died of old age.")
        infectiousHorror.power = 2
        infectiousHorror.toughness = 2
        return infectiousHorror
    }
    // 102 Infernal Reckoning
    // 103 Infernal Scarring
    // 104 Isareth the Awakener
    static func LichsCaress() -> Card {
        let lichsCaress = Card(name: "Lich's Caress", rarity: .Common, set: set, number: 105)
        lichsCaress.setManaCost("3BB")
        lichsCaress.setType(.Sorcery)
        lichsCaress.addTargetedEffect(
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.destroy()
                lichsCaress.getController().gainLife(3)
        })
        lichsCaress.setFlavorText("A lich must consume mortal souls to feed its eternal life.")
        return lichsCaress
    }
    // 106 Liliana, Untouched by Death
    // 107 Liliana's Contract
    // 108 Macabre Waltz
    // 109 Mind Rot
    static func Murder() -> Card {
        let murder = Card(name: "Murder", rarity: .Uncommon, set: set, number: 110)
        murder.setManaCost("1BB")
        murder.setType(.Instant)
        murder.addTargetedEffect(
            restriction: { return $0.isType(.Creature) },
            effect: { target in target.destroy() })
        murder.setFlavorText("\"It's not work if you enjoy it.\"")
        return murder
    }
    // 111 Nightmare's Thirst
    // 112 Open the Graves
    // 113 Phylactery Lich
    // 114 Plague Mare
    // 115 Ravenous Harpy
    // 116 Reassembling Skeleton
    // 117 Rise from the Grave
    // 118 Skeleton Archer
    // 119 Skymarch Bloodletter
    // 120 Sovereign's Bite
    static func StitchersSupplier() -> Card {
        let stitchersSupplier = Card(name: "Sticher's Supplier", rarity: .Uncommon, set: set, number: 121)
        stitchersSupplier.setManaCost("B")
        stitchersSupplier.setType(.Creature, .Zombie)
        stitchersSupplier.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { stitchersSupplier.getController().mill(3) })
        stitchersSupplier.addUntargetedTriggeredAbility(
            trigger: .ThisDies,
            effect: { stitchersSupplier.getController().mill(3) })
        stitchersSupplier.setFlavorText("No part goes to waste.")
        stitchersSupplier.power = 1
        stitchersSupplier.toughness = 1
        return stitchersSupplier
    }
    static func StranglingSpores() -> Card {
        let stranglingSpores = Card(name: "Strangling Spores", rarity: .Common, set: set, number: 122)
        stranglingSpores.setManaCost("3B")
        stranglingSpores.setType(.Instant)
        stranglingSpores.addTargetedEffect(
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() - 3
                    object.toughness = object.getBaseToughness() - 3
                    return object
                }))
        })
        stranglingSpores.setFlavorText("Imagine a thousand tiny mushrooms cropping up within your lungs.")
        return stranglingSpores
    }
    // 123 Two-Headed Zombie
    static func VampireNeonate() -> Card {
        let vampireNeonate = Card(name: "Vampire Neonate", rarity: .Common, set: set, number: 124)
        vampireNeonate.setManaCost("B")
        vampireNeonate.setType(.Creature, .Vampire)
        vampireNeonate.addUntargetedActivatedAbility(
            cost: Cost("2", tap: true),
            effect: {
                vampireNeonate.getController().getOpponent().loseLife(1)
                vampireNeonate.getController().gainLife(1)
        })
        vampireNeonate.setFlavorText("One day, they may be paragons of deadly elegance. For the moment, they possess nothing but thirst.")
        vampireNeonate.power = 0
        vampireNeonate.toughness = 3
        return vampireNeonate
    }
    // 125 Vampire Sovereign
    static func WalkingCorpse() -> Card {
        let walkingCorpse = Card(name: "Walking Corpse", rarity: .Common, set: set, number: 124)
        walkingCorpse.setManaCost("1B")
        walkingCorpse.setType(.Creature, .Zombie)
        walkingCorpse.setFlavorText("\"Feeding a normal army is a problem of logistics. With zombies, it is an asset. Feeding is why they fight. Feeding is why they are feared.\"\n--Jadar, ghoulcaller of Nephalia")
        walkingCorpse.power = 2
        walkingCorpse.toughness = 2
        return walkingCorpse
    }
    // 127 Act of Treason
    // 128 Alpine Moon
    // 129 Apex of Power
    // 130 Banefire
    // 131 Boggart Brute
    // 132 Catalyst Elemental
    // 133 Crash Through
    // 134 Dark-Dweller Oracle
    // 135 Demanding Dragon
    // 136 Dismissive Pyromancer
    // 137 Doublecast
    static func DragonEgg() -> Card {
        let dragonEgg = Card(name: "Dragon Egg", rarity: .Uncommon, set: set, number: 138)
        dragonEgg.setManaCost("2R")
        dragonEgg.setType(.Creature, .Dragon, .Egg)
        dragonEgg.defender = true
        dragonEgg.addUntargetedTriggeredAbility(
            trigger: .ThisDies,
            effect: { dragonEgg.getController().createToken(Dragon_Firebreathing()) })
        dragonEgg.setFlavorText("Dragon birth lairs are littered with treasure to entice the young from their eggs.")
        dragonEgg.power = 0
        dragonEgg.toughness = 2
        return dragonEgg
    }
    static func Electrify() -> Card {
        let electrify = Card(name: "Electrify", rarity: .Common, set: set, number: 139)
        electrify.setManaCost("3R")
        electrify.setType(.Instant)
        electrify.addTargetedEffect(
            restriction: { return $0.isType(.Creature) },
            effect: { target in electrify.damage(to: target, 4) })
        electrify.setFlavorText("\"Some hid from the storm. I embraced it and learned its name.\"")
        return electrify
    }
    static func FieryFinish() -> Card {
        let fieryFinish = Card(name: "Fiery Finish", rarity: .Uncommon, set: set, number: 140)
        fieryFinish.setManaCost("4RR")
        fieryFinish.setType(.Sorcery)
        fieryFinish.addTargetedEffect(
            restriction: { return $0.isType(.Creature) },
            effect: { target in fieryFinish.damage(to: target, 7) })
        fieryFinish.setFlavorText("Negotiations reached an abrupt conclusion.")
        return fieryFinish
    }
    static func FireElemental() -> Card {
        let fireElemental = Card(name: "Fire Elemental", rarity: .Common, set: set, number: 141)
        fireElemental.setManaCost("3RR")
        fireElemental.setType(.Creature, .Elemental)
        fireElemental.setFlavorText("It treads on feet of coals and strikes with the force of a volcano.")
        fireElemental.power = 5
        fireElemental.toughness = 4
        return fireElemental
    }
    static func GoblinInstigator() -> Card {
        let goblinInstigator = Card(name: "Goblin Instigator", rarity: .Common, set: set, number: 142)
        goblinInstigator.setManaCost("1R")
        goblinInstigator.setType(.Creature, .Goblin)
        goblinInstigator.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { goblinInstigator.getController().createToken(Goblin()) })
        goblinInstigator.setFlavorText("\"We can take 'em. You go first!\"")
        goblinInstigator.power = 1
        goblinInstigator.toughness = 1
        return goblinInstigator
    }
    static func GoblinMotivator() -> Card {
        let goblinMotivator = Card(name: "Goblin Motivator", rarity: .Common, set: set, number: 143)
        goblinMotivator.setManaCost("R")
        goblinMotivator.setType(.Creature, .Goblin, .Warrior)
        goblinMotivator.addTargetedActivatedAbility(
            cost: Cost("", tap: true),
            restriction: { return $0.isType(.Creature) },
            effect: { target in target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                object.haste = true
                return object
            }))
        })
        goblinMotivator.setFlavorText("Small words stoke large flames.")
        goblinMotivator.power = 1
        goblinMotivator.toughness = 1
        return goblinMotivator
    }
    // 144 Goblin Trashmaster
    // 145 Guttersnipe
    // 146 Havoc Devils
    static func HostileMinotaur() -> Card {
        let hostileMinotaur = Card(name: "Hostile Minotaur", rarity: .Common, set: set, number: 147)
        hostileMinotaur.setManaCost("3R")
        hostileMinotaur.setType(.Creature, .Minotaur)
        hostileMinotaur.haste = true
        hostileMinotaur.setFlavorText("The bellow of a minotaur always translates to \"charge.\"")
        hostileMinotaur.power = 3
        hostileMinotaur.toughness = 3
        return hostileMinotaur
    }
    // 148 Inferno Hellion
    // 149 Lathliss, Dragon Queen
    // 150 Lava Axe
    // 151 Lightning Mare
    // 152 Lightning Strike
    static func OnakkeOgre() -> Card {
        let onakkeOgre = Card(name: "Onakke Ogre", rarity: .Common, set: set, number: 153)
        onakkeOgre.setManaCost("2R")
        onakkeOgre.setType(.Creature, .Ogre, .Warrior)
        onakkeOgre.setFlavorText("The ogres you know are nothing like the Onakke. Possessing both intellect and industry, they had brute strength without being brutish.")
        onakkeOgre.power = 4
        onakkeOgre.toughness = 2
        return onakkeOgre
    }
    // 154 Sarkhan, Fireblood
    // 155 Sarkhan's Unsealing
    // 156 Shock
    // 157 Siegebreaker Giant
    static func Smelt() -> Card {
        let smelt = Card(name: "Smelt", rarity: .Common, set: set, number: 158)
        smelt.setManaCost("R")
        smelt.setType(.Instant)
        smelt.addTargetedEffect(
            restriction: { return $0.isType(.Artifact) },
            effect: { target in target.destroy() })
        smelt.setFlavorText("The creation of new weapons demands the destruction of others.")
        return smelt
    }
    // 159 Sparktongue Dragon
    // 160 Spit Flame
    // 161 Sure Strike
    // 162 Tectonic Rift
    // 163 Thud
    // 164 Tormenting Voice
    static func TrumpetBlast() -> Card {
        let trumpetBlast = Card(name: "Trumpet Blast", rarity: .Common, set: set, number: 165)
        trumpetBlast.setManaCost("2R")
        trumpetBlast.setType(.Instant)
        trumpetBlast.addUntargetedEffect({
            Game.shared.bothPlayers({ $0.getCreatures().filter({$0.attacking}).forEach({ attackingCreature in
                attackingCreature.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() + 2
                    return object
                }))
            })})
        })
        trumpetBlast.setFlavorText("The sound of the trumpets lights a fire in the hearts of the bold and snuffs the courage of the cowardly.")
        return trumpetBlast
    }
    // 166 Viashino Pyromancer
    static func VolcanicDragon() -> Card {
        let volcanicDragon = Card(name: "Volcanic Dragon", rarity: .Uncommon, set: set, number: 167)
        volcanicDragon.setManaCost("4RR")
        volcanicDragon.setType(.Creature, .Dragon)
        volcanicDragon.flying = true
        volcanicDragon.haste = true
        volcanicDragon.setFlavorText("Sometimes an eruption in Shiv produces something more dangerous than a mere river of molten rock.")
        volcanicDragon.power = 4
        volcanicDragon.toughness = 4
        return volcanicDragon
    }
    // 168 Volley Veteran
    // 169 Blanchwood Armor
    // 170 Bristling Boar
    static func CentaurCourser() -> Card {
        let centaurCourser = Card(name: "Centaur Courser", rarity: .Common, set: set, number: 171)
        centaurCourser.setManaCost("2G")
        centaurCourser.setType(.Creature, .Centaur, .Warrior)
        centaurCourser.setFlavorText("\"The centaurs are truly free. Never will they be tamed by temptation or controlled by fear. They live in total harmony, a feat not yet achieved by our kind.\"\n--Ramal, sage of Westgate")
        centaurCourser.power = 3
        centaurCourser.toughness = 3
        return centaurCourser
    }
    // 172 Colossal Dreadmaw
    // 173 Colossal Majesty
    // 174 Daggerback Basilisk
    // 175 Declare Dominance
    // 176 Druid of Horns
    static func DruidOfTheCowl() -> Card {
        let druidOfTheCowl = Card(name: "Druid of the Cowl", rarity: .Common, set: set, number: 177)
        druidOfTheCowl.setManaCost("1G")
        druidOfTheCowl.setType(.Creature, .Elf, .Druid)
        druidOfTheCowl.addUntargetedActivatedAbility(
            cost: Cost("", tap: true),
            effect: { druidOfTheCowl.getController().addMana(color: .Green) },
            manaAbility: true)
        druidOfTheCowl.setFlavorText("\"The wild tangle of the Cowl provides sanctuary to life that watched the first buildings rise.\"")
        druidOfTheCowl.power = 1
        druidOfTheCowl.toughness = 3
        return druidOfTheCowl
    }
    // 178 Dryad Greenseeker
    // 179 Elvish Clancaller
    // 180 Elvish Rejuvenator
    // 181 Ghastbark Twins
    // 182 Ghirapur Guide
    static func GiantSpider() -> Card {
        let giantSpider = Card(name: "Giant Spider", rarity: .Common, set: set, number: 183)
        giantSpider.setManaCost("3G")
        giantSpider.setType(.Creature, .Spider)
        giantSpider.reach = true
        giantSpider.setFlavorText("\"After everything I've survived, it's hard to be frightened by anything anymore.\"\n--Vivien Reid")
        giantSpider.power = 2
        giantSpider.toughness = 4
        return giantSpider
    }
    // 184 Gift of Paradise
    static func Gigantosaurus() -> Card {
        let gigantosaurus = Card(name: "Gigantosaurus", rarity: .Rare, set: set, number: 185)
        gigantosaurus.setManaCost("GGGGG")
        gigantosaurus.setType(.Creature, .Dinosaur)
        gigantosaurus.setFlavorText("\"Each tooth is the length of a horse, and new ones grow in every sixteen days. Let's get a closer look!\"\n--Vivien Reid");
        gigantosaurus.power = 10
        gigantosaurus.toughness = 10
        return gigantosaurus
    }
    // 186 Goreclaw, Terror of Qal Sisma
    static func GreenwoodSentinel() -> Card {
        let greenwoodSentinel = Card(name: "Greenwood Sentinel", rarity: .Common, set: set, number: 187)
        greenwoodSentinel.setManaCost("1G")
        greenwoodSentinel.setType(.Creature, .Elf, .Scout)
        greenwoodSentinel.vigilance = true
        greenwoodSentinel.setFlavorText("Within a mile of the woodland, you will feel her eyes upon you. Within its borders, you will feel her blade.")
        greenwoodSentinel.power = 2
        greenwoodSentinel.toughness = 2
        return greenwoodSentinel
    }
    static func HighlandGame() -> Card {
        let highlandGame = Card(name: "Highland Game", rarity: .Common, set: set, number: 188)
        highlandGame.setManaCost("1G")
        highlandGame.setType(.Creature, .Elk)
        highlandGame.addUntargetedTriggeredAbility(
            trigger: .ThisDies,
            effect: { highlandGame.getController().gainLife(2) })
        highlandGame.power = 2
        highlandGame.toughness = 1
        return highlandGame
    }
    // 189 Hungering Hydra
    static func Naturalize() -> Card {
        let naturalize = Card(name: "Naturalize", rarity: .Common, set: set, number: 190)
        naturalize.setManaCost("1G")
        naturalize.setType(.Instant)
        naturalize.addTargetedEffect(
            restriction: { return $0.isType(.Artifact) || $0.isType(.Enchantment) },
            effect: { target in target.destroy() })
        naturalize.setFlavorText("\"And if you threaten me again, your shiny steel trousers will be sprouting daggerthorn vines.\"\n--Iveta, rooftop runner")
        return naturalize
    }
    // 191 Oakenform
    // 192 Pelakka Wurm
    static func Plummet() -> Card {
        let plummet = Card(name: "Plummet", rarity: .Common, set: set, number: 193)
        plummet.setManaCost("1G")
        plummet.setType(.Instant)
        plummet.addTargetedEffect(
            restriction: { return $0.isType(.Creature) && $0.flying },
            effect: { target in target.destroy() })
        plummet.setFlavorText("\"Let nothing own the skies but the wind.\"\n--Dejara, Giltwood druid")
        return plummet
    }
    // 194 Prodigious Growth
    // 195 Rabid Bite
    // 196 Reclamation Sage
    // 197 Recollect
    static func RhoxOracle() -> Card {
        let rhoxOracle = Card(name: "Rhox Oracle", rarity: .Common, set: set, number: 198)
        rhoxOracle.setManaCost("4G")
        rhoxOracle.setType(.Creature, .Rhino, .Monk)
        rhoxOracle.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { rhoxOracle.getController().drawCard() })
        rhoxOracle.setFlavorText("\"The further into the future I look, the less certain my vision. Even now, the middle distance is obscured by fire.")
        rhoxOracle.power = 4
        rhoxOracle.toughness = 2
        return rhoxOracle
    }
    // 199 Root Snare
    // 200 Runic Armasaur
    // 201 Scapeshift
    // 202 Talons of Wildwood
    // 203 Thorn Lieutenant
    static func ThornhideWolves() -> Card {
        let thornhideWolves = Card(name: "Thornhide Wolves", rarity: .Common, set: set, number: 204)
        thornhideWolves.setManaCost("4G")
        thornhideWolves.setType(.Creature, .Wolf)
        thornhideWolves.setFlavorText("\"Halana grew brambles to create a barricade around our camp, hoping that it would keep the wolves out. That was a mistake for which we almost paid dearly.\"\nAlena, trapper of Kessig")
        thornhideWolves.power = 4
        thornhideWolves.toughness = 5
        return thornhideWolves
    }
    static func TitanicGrowth() -> Card {
        let titanicGrowth = Card(name: "Titanic Growth", rarity: .Common, set: set, number: 205)
        titanicGrowth.setManaCost("1G")
        titanicGrowth.setType(.Instant)
        titanicGrowth.addTargetedEffect(
            restriction: { return $0.isType(.Creature) },
            effect: { target in
                target.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                    object.power = object.getBasePower() + 4
                    object.toughness = object.getToughness() + 4
                    return object
                }))
        })
        titanicGrowth.setFlavorText("The massive dominate through might. The tiny survive with guile. Beware the tiny who become massive.")
        return titanicGrowth
    }
    static func VigilantBaloth() -> Card {
        let vigilantBaloth = Card(name: "Vigilant Baloth", rarity: .Uncommon, set: set, number: 206)
        vigilantBaloth.setManaCost("3GG")
        vigilantBaloth.setType(.Creature, .Beast)
        vigilantBaloth.vigilance = true
        vigilantBaloth.setFlavorText("Villagers employ watchdogs as guardians and companions. Druids prefer something a little bigger.")
        vigilantBaloth.power = 5
        vigilantBaloth.toughness = 5
        return vigilantBaloth
    }
    // 207 Vine Mare
    // 208 Vivien Reid
    // 209 Vivien's Invocation
    static func WallOfVines() -> Card {
        let wallOfVines = Card(name: "Wall of Vines", rarity: .Common, set: set, number: 210)
        wallOfVines.setManaCost("G")
        wallOfVines.setType(.Creature, .Plant, .Wall)
        wallOfVines.defender = true
        wallOfVines.reach = true
        wallOfVines.setFlavorText("Like all jungle plants, the vines must fight and claw for sunlight. Once their place is secured, they grow strong, sharp, and impenetrable.")
        wallOfVines.power = 0
        wallOfVines.toughness = 3
        return wallOfVines
    }
    // 211 Aerial Engineer
    // 212 Arcades, the Strategist
    // 213 Brawl-Bash Ogre
    // 214 Chromium, the Mutable
    // 215 Draconic Disciple
    // 216 Enigma Drake
    // 217 Heroic Reinforcements
    // 218 Nicol Bolas, the Ravager // Nicol Bolas, the Arisen
    // 219 Palladia-Mors, the Ruiner
    // 220 Poison-Tip Archer
    // 221 Psychic Symbiont
    // 222 Regal Bloodlord
    // 223 Satyr Enchanter
    // 224 Skyrider Patrol
    // 225 Vaevictis Asmadi, the Dire
    // 226 Amulet of Safekeeping
    static func ArcaneEncyclopedia() -> Card {
        let arcaneEncyclopedia = Card(name: "Arcane Encyclopedia", rarity: .Uncommon, set: set, number: 227)
        arcaneEncyclopedia.setManaCost("3")
        arcaneEncyclopedia.setType(.Artifact)
        arcaneEncyclopedia.addUntargetedActivatedAbility(
            cost: Cost("3", tap: true),
            effect: { arcaneEncyclopedia.getController().drawCard() })
        arcaneEncyclopedia.setFlavorText("Knowledge itself is neither good nor evil. Just as the wrong book in the wrong hands could doom all existence, the same book in the right hands could save it.")
        return arcaneEncyclopedia
    }
    // 228 Chaos Wand
    // 229 Crucible of Worlds
    // 230 Desecrated Tomb
    // 231 Diamond Mare
    // 232 Dragon's Hoard
    // 233 Explosive Apparatus
    static func FieldCreeper() -> Card {
        let fieldCreeper = Card(name: "Field Creeper", rarity: .Common, set: set, number: 234)
        fieldCreeper.setManaCost("2")
        fieldCreeper.setType(.Artifact, .Creature, .Scarecrow)
        fieldCreeper.setFlavorText("As it walks across the fallow field, its awkward, loping gait matches the rattling in its head to create a haunting rhythm that chills the bones.")
        fieldCreeper.power = 2
        fieldCreeper.toughness = 1
        return fieldCreeper
    }
    // 235 Fountain of Renewal
    // 236 Gargoyle Sentinel
    // 237 Gearsmith Guardian
    // 238 Magistrate's Scepter
    // 239 Manalith
    // 240 Marauder's Axe
    // 241 Meteor Golem
    // 242 Millstone
    // 243 Rogue's Gloves
    // 244 Sigiled Sword of Valeron
    static func Skyscanner() -> Card {
        let skyscanner = Card(name: "Skyscanner", rarity: .Common, set: set, number: 245)
        skyscanner.setManaCost("3")
        skyscanner.setType(.Artifact, .Creature, .Thopter)
        skyscanner.flying = true
        skyscanner.addUntargetedTriggeredAbility(
            trigger: .ThisETB,
            effect: { skyscanner.getController().drawCard() })
        skyscanner.power = 1
        skyscanner.toughness = 1
        return skyscanner
    }
    // 246 Suspicious Bookcase
    // 247 Transmogrifying Wand
    // 248 Cinder Barrens
    // 249 Detection Tower
    // 250 Forsaken Sanctuary
    // 251 Foul Orchard
    // 252 Highland Lake
    // 253 Meandering River
    // 254 Reliquary Tower
    // 255 Rupture Spire
    // 256 Stone Quarry
    // 257 Submerged Boneyard
    // 258 Timber Gorge
    // 259 Tranquil Expanse
    // 260 Woodland Stream
    static func Plains() -> Card {
        let plains = Card(name: "Plains", rarity: .Common, set: set, number: 261)
        plains.setManaCost("")
        plains.setType(.Basic, .Land, .Plains)
        plains.addUntargetedActivatedAbility(
            cost: Cost("", tap: true),
            effect: { plains.getController().addMana(color: .White) },
            manaAbility: true )
        return plains
    }
    // 262 Plains
    // 263 Plains
    // 264 Plains
    static func Island() -> Card {
        let island = Card(name: "Island", rarity: .Common, set: set, number: 265)
        island.setManaCost("")
        island.setType(.Basic, .Land, .Island)
        island.addUntargetedActivatedAbility(
            cost: Cost("", tap: true),
            effect: { island.getController().addMana(color: .Blue) },
            manaAbility: true )
        return island
    }
    // 266 Island
    // 267 Island
    // 268 Island
    static func Swamp() -> Card {
        let swamp = Card(name: "Swamp", rarity: .Common, set: set, number: 269)
        swamp.setManaCost("")
        swamp.setType(.Basic, .Land, .Swamp)
        swamp.addUntargetedActivatedAbility(
            cost: Cost("", tap: true),
            effect: { swamp.getController().addMana(color: .Black) },
            manaAbility: true )
        return swamp
    }
    // 270 Swamp
    // 271 Swamp
    // 272 Swamp
    static func Mountain() -> Card {
        let mountain = Card(name: "Mountain", rarity: .Common, set: set, number: 273)
        mountain.setManaCost("")
        mountain.setType(.Basic, .Land, .Mountain)
        mountain.addUntargetedActivatedAbility(
            cost: Cost("", tap: true),
            effect: { mountain.getController().addMana(color: .Red) },
            manaAbility: true )
        return mountain;
    }
    // 274 Mountain
    // 275 Mountain
    // 276 Mountain
    static func Forest() -> Card {
        let forest = Card(name: "Forest", rarity: .Common, set: set, number: 277)
        forest.setManaCost("")
        forest.setType(.Basic, .Land, .Forest)
        forest.addUntargetedActivatedAbility(
            cost: Cost("", tap: true),
            effect: { forest.getController().addMana(color: .Green) },
            manaAbility: true )
        return forest;
    }
    // 278 Forest
    // 279 Forest
    // 280 Forest
    
    // t1 Angel
    // t2 Avatar
    static func Cat() -> Token {
        let cat = Token(name: "Cat", set: set, number: 3)
        cat.colors = [.White]
        cat.setType(.Creature, .Cat)
        cat.lifelink = true
        cat.power = 1
        cat.toughness = 1
        return cat
    }
    static func Knight() -> Token {
        let knight = Token(name: "Knight", set: set, number: 4)
        knight.colors = [Color.White]
        knight.setType(.Creature, .Knight)
        knight.vigilance = true
        knight.power = 2
        knight.toughness = 2
        return knight;
    }
    // t5 Ox
    // t6 Soldier
    // t7 Bat
    static func Zombie() -> Token {
        let zombie = Token(name: "Zombie", set: set, number: 8)
        zombie.colors = [.Black]
        zombie.setType(.Creature, .Zombie)
        zombie.power = 2
        zombie.toughness = 2
        return zombie
    }
    static func Dragon_Firebreathing() -> Token {
        let dragon = Token(name: "Dragon", set: set, number: 9)
        dragon.colors = [.Red]
        dragon.setType(.Creature, .Dragon)
        dragon.flying = true
        dragon.addUntargetedActivatedAbility(
            cost: Cost("R"),
            effect: { dragon.addContinuousEffect(ContinuousEffectUntilEndOfTurn({ object in
                object.power = object.getBasePower() + 1
                return object
            }))
        })
        dragon.power = 2
        dragon.toughness = 2
        return dragon
    }
    // t10 Dragon
    static func Goblin() -> Token {
        let goblin = Token(name: "Goblin", set: set, number: 11)
        goblin.colors = [.Red]
        goblin.setType(.Creature, .Goblin)
        goblin.power = 1
        goblin.toughness = 1
        return goblin
    }
    // t12 Beast
    // t13 Elf Warrior
    static func Thopter() -> Token {
        let thopter = Token(name: "Thopter", set: set, number: 14)
        thopter.setType(.Artifact, .Creature, .Thopter)
        thopter.flying = true
        thopter.power = 1
        thopter.toughness = 1
        return thopter
    }
    // t15 Ajani Emblem
    // t16 Tezzeret Emblem
    // t17 Vivien Emblem
}
