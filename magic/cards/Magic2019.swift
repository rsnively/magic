import Foundation

enum M19 {
    static var set = "m19"
    static var count = 280
    
    // 1 Aegis of the Heavens
    // 2 Aethershield Artificer
    // 3 Ajani, Adversary of Tyrants
    // 4 Ajani's Last Stand
    // 5 Ajani's Pridemate
    // 6 Ajani's Welcome
    // 7 Angel of the Dawn
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
        dwarvenPriest.addTriggeredAbility(UntargetedTriggeredAbility(
            source: dwarvenPriest,
            trigger: .ThisETB,
            effect: { $0.getController().gainLife($0.getController().getCreatures().count) }
        ))
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
        gallantCavalry.addTriggeredAbility(UntargetedTriggeredAbility(
            source: gallantCavalry,
            trigger: .ThisETB,
            effect: { $0.getController().createToken(Knight()) }
        ))
        gallantCavalry.setFlavorText("\"Our duty does not stop on our borders.\"")
        gallantCavalry.power = 2
        gallantCavalry.toughness = 2
        return gallantCavalry
    }
    // 13 Herald of Faith
    // 14 Hieromancer's Cage
    // 15 Inspired Charge
    static func InvokeTheDivine() -> Card {
        let invokeTheDivine = Card(name: "Invoke the Divine", rarity: .Common, set: set, number: 16)
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
    // 23 Leonin Warleader
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
    // 28 Mighty Leap
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
    // 32 Pegasus Courser
    // 33 Remorseful Cleric
    // 34 Resplendent Angel
    static func Revitalize() -> Card {
        let revitalize = Card(name: "Revitalize", rarity: .Common, set: set, number: 35)
        revitalize.setManaCost("1W")
        revitalize.setType(.Instant)
        revitalize.addEffect(UntargetedEffect{
            $0.getController().gainLife(3)
            $0.getController().drawCard()
        })
        revitalize.setFlavorText("\"A potion is no substitute for a skilled surgeon, but it will hold your bits in.\"\n--Torricks, battlefield medic")
        return revitalize
    }
    // 36 Rustwing Falcon
    // 37 Shield Mare
    // 38 Star-Crowned Stag
    // 39 Suncleanser
    static func TakeVengeance() -> Card {
        let takeVengeance = Card(name: "Take Vengeance", rarity: .Common, set: set, number: 40)
        takeVengeance.setManaCost("1W")
        takeVengeance.setType(.Sorcery)
        takeVengeance.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature) && potentialTarget.isTapped
            }, { source, target in
                target.destroy()
        }))
        takeVengeance.setFlavorText("\"Your death will be a balm, your passing a welcome revision, and all will sigh with peace to know your demise.\"")
        return takeVengeance
    }
    // 41 Trusty Packbeast
    // 42 Valiant Knight
    // 43 Aether Tunnel
    // 44 Anticipate
    // 45 Aven Wind Mage
    // 46 Aviation Pioneer
    // 47 Bone to Ash
    // 48 Cancel
    // 49 Departed Deckhand
    static func Disperse() -> Card {
        let disperse = Card(name: "Disperse", rarity: .Common, set: set, number: 50)
        disperse.setManaCost("1U")
        disperse.setType(.Instant)
        disperse.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return !potentialTarget.isType(.Land)
            }, { source, target in
                target.bounce()
        }))
        disperse.setFlavorText("It's pointless to hold on when you have nothing to hold on with.")
        return disperse
    }
    static func Divination() -> Card {
        let divination = Card(name: "Divination", rarity: .Common, set: set, number: 51)
        divination.setManaCost("2U")
        divination.setType(.Sorcery)
        divination.addEffect(UntargetedEffect{
            $0.getController().drawCards(2)
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
    // 63 Mystic Archaeologist
    // 64 Omenspeaker
    // 65 Omniscience
    static func OneWithTheMachine() -> Card {
        let oneWithTheMachine = Card(name: "One with the Machine", rarity: .Rare, set: set, number: 66)
        oneWithTheMachine.setManaCost("3U")
        oneWithTheMachine.setType(.Sorcery)
        oneWithTheMachine.addEffect(UntargetedEffect{
            let artifacts = $0.getController().getArtifacts()
            let maxArtifactCMC = artifacts.map({ return $0.getConvertedManaCost() }).max()
            $0.getController().drawCards(maxArtifactCMC ?? 0)
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
    // 75 Snapping Drake
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
    // 82 Uncomfortable Chill
    // 83 Wall of Mist
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
        doomedDissenter.addTriggeredAbility(UntargetedTriggeredAbility(
            source: doomedDissenter,
            trigger: .ThisDies,
            effect: { $0.getController().createToken(Zombie()) }
        ))
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
    // 101 Infectious Horror
    // 102 Infernal Reckoning
    // 103 Infernal Scarring
    // 104 Isareth the Awakener
    static func LichsCaress() -> Card {
        let lichsCaress = Card(name: "Lich's Caress", rarity: .Common, set: set, number: 105)
        lichsCaress.setManaCost("3BB")
        lichsCaress.setType(.Sorcery)
        lichsCaress.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature)
            }, { source, target in
                target.destroy()
                source.getController().gainLife(3)
        }))
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
        murder.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature)
        }, { source,target in
                target.destroy()
        }))
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
    // 121 Stitcher's Supplier
    // 122 Strangling Spores
    // 123 Two-Headed Zombie
    // 124 Vampire Neonate
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
    // 138 Dragon Egg
    static func Electrify() -> Card {
        let electrify = Card(name: "Electrify", rarity: .Common, set: set, number: 139)
        electrify.setManaCost("3R")
        electrify.setType(.Instant)
        electrify.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature)
        }, { source, target in
            target.dealDamage(4)
        }))
        electrify.setFlavorText("\"Some hid from the storm. I embraced it and learned its name.\"")
        return electrify
    }
    static func FieryFinish() -> Card {
        let fieryFinish = Card(name: "Fiery Finish", rarity: .Uncommon, set: set, number: 140)
        fieryFinish.setManaCost("4RR")
        fieryFinish.setType(.Sorcery)
        fieryFinish.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature)
        }, { source, target in
            target.dealDamage(7)
        }))
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
        goblinInstigator.addTriggeredAbility(UntargetedTriggeredAbility(
            source: goblinInstigator,
            trigger: .ThisETB,
            effect: { $0.getController().createToken(Goblin()) }
        ))
        goblinInstigator.setFlavorText("\"We can take 'em. You go first!\"")
        goblinInstigator.power = 1
        goblinInstigator.toughness = 1
        return goblinInstigator
    }
    // 143 Goblin Motivator
    // 144 Goblin Trashmaster
    // 145 Guttersnipe
    // 146 Havoc Devils
    // 147 Hostile Minotaur
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
        smelt.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Artifact)
            }, { source, target in
                target.destroy()
        }))
        smelt.setFlavorText("The creation of new weapons demands the destruction of others.")
        return smelt
    }
    // 159 Sparktongue Dragon
    // 160 Spit Flame
    // 161 Sure Strike
    // 162 Tectonic Rift
    // 163 Thud
    // 164 Tormenting Voice
    // 165 Trumpet Blast
    // 166 Viashino Pyromancer
    // 167 Volcanic Dragon
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
    // 177 Druid of the Cowl
    // 178 Dryad Greenseeker
    // 179 Elvish Clancaller
    // 180 Elvish Rejuvenator
    // 181 Ghastbark Twins
    // 182 Ghirapur Guide
    // 183 Giant Spider
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
        highlandGame.addTriggeredAbility(UntargetedTriggeredAbility(
            source: highlandGame,
            trigger: .ThisDies,
            effect: { $0.getController().gainLife(2) }
        ))
        highlandGame.power = 2
        highlandGame.toughness = 1
        return highlandGame
    }
    // 189 Hungering Hydra
    static func Naturalize() -> Card {
        let naturalize = Card(name: "Naturalize", rarity: .Common, set: set, number: 190)
        naturalize.setManaCost("1G")
        naturalize.setType(.Instant)
        naturalize.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Artifact) || potentialTarget.isType(.Enchantment)
        }, { source, target in
            target.destroy()
        }))
        naturalize.setFlavorText("\"And if you threaten me again, your shiny steel trousers will be sprouting daggerthorn vines.\"\n--Iveta, rooftop runner")
        return naturalize
    }
    // 191 Oakenform
    // 192 Pelakka Wurm
    // 193 Plummet
    // 194 Prodigious Growth
    // 195 Rabid Bite
    // 196 Reclamation Sage
    // 197 Recollect
    static func RhoxOracle() -> Card {
        let rhoxOracle = Card(name: "Rhox Oracle", rarity: .Common, set: set, number: 198)
        rhoxOracle.setManaCost("4G")
        rhoxOracle.setType(.Creature, .Rhino, .Monk)
        rhoxOracle.addTriggeredAbility(UntargetedTriggeredAbility(
            source: rhoxOracle,
            trigger: .ThisETB,
            effect: { $0.getController().drawCard() }
        ))
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
    // 205 Titanic Growth
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
    // 210 Wall of Vines
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
    // 227 Arcane Encyclopedia
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
    // 245 Skyscanner
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
        plains.addActivatedAbility(UntargetedActivatedAbility(
            source: plains,
            cost: Cost("", tap: true),
            effect: { $0.getController().addMana(color: .White) },
            manaAbility: true
        ))
        return plains
    }
    // 262 Plains
    // 263 Plains
    // 264 Plains
    static func Island() -> Card {
        let island = Card(name: "Island", rarity: .Common, set: set, number: 265)
        island.setManaCost("")
        island.setType(.Basic, .Land, .Island)
        island.addActivatedAbility(UntargetedActivatedAbility(
            source: island,
            cost: Cost("", tap: true),
            effect: { $0.getController().addMana(color: .Blue) },
            manaAbility: true
        ))
        return island
    }
    // 266 Island
    // 267 Island
    // 268 Island
    static func Swamp() -> Card {
        let swamp = Card(name: "Swamp", rarity: .Common, set: set, number: 269)
        swamp.setManaCost("")
        swamp.setType(.Basic, .Land, .Swamp)
        swamp.addActivatedAbility(UntargetedActivatedAbility(
            source: swamp,
            cost: Cost("", tap: true),
            effect: { $0.getController().addMana(color: .Black) },
            manaAbility: true
        ))
        return swamp
    }
    // 270 Swamp
    // 271 Swamp
    // 272 Swamp
    static func Mountain() -> Card {
        let mountain = Card(name: "Mountain", rarity: .Common, set: set, number: 273)
        mountain.setManaCost("")
        mountain.setType(.Basic, .Land, .Mountain)
        mountain.addActivatedAbility(UntargetedActivatedAbility(
            source: mountain,
            cost: Cost("", tap: true),
            effect: { $0.getController().addMana(color: .Red) },
            manaAbility: true
        ))
        return mountain;
    }
    // 274 Mountain
    // 275 Mountain
    // 276 Mountain
    static func Forest() -> Card {
        let forest = Card(name: "Forest", rarity: .Common, set: set, number: 277)
        forest.setManaCost("")
        forest.setType(.Basic, .Land, .Forest)
        forest.addActivatedAbility(UntargetedActivatedAbility(
            source: forest,
            cost: Cost("", tap: true),
            effect: { $0.getController().addMana(color: .Green) },
            manaAbility: true
        ))
        return forest;
    }
    // 278 Forest
    // 279 Forest
    // 280 Forest
    
    // t1 Angel
    // t2 Avatar
    // t3 Cat
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
    // t9 Dragon (firebreathing)
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
    // t14 Thopter
    // t15 Ajani Emblem
    // t16 Tezzeret Emblem
    // t17 Vivien Emblem
}
