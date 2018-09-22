import Foundation

enum GRN {
    static var set = "grn"
    static var count = 259
    
    // 1 Blade Instructor
    // 2 Bounty Agent
    // 3 Candlelight Vigil
    static func CitywideBust() -> Card {
        let citywideBust = Card(name: "Citywide Bust", rarity: .Rare, set: set, number: 4)
        citywideBust.setManaCost("1WW")
        citywideBust.setType(.Sorcery)
        citywideBust.addEffect(UntargetedEffect({_ in
            Game.shared.bothPlayers({ player in
                player.getCreatures().forEach { creature in
                    if creature.getToughness() >= 4 {
                        player.destroyPermanent(creature)
                    }
                }
            })
        }))
        citywideBust.setFlavorText("\"Oh, you fellas are going to love the lockup. Excellent gruel. Very low ceilings.\"\n--Libuse, Boros sergeant")
        return citywideBust
    }
    static func CageTheCulprit() -> Card {
        let cageTheCulprit = Card(name: "Cage the Culprit", rarity: .Common, set: set, number: 5)
        cageTheCulprit.setManaCost("3W")
        cageTheCulprit.setType(.Instant)
        cageTheCulprit.addEffect(TargetedEffect(
            targetingRestriction: { potentialTarget in
                return potentialTarget.isType(.Creature) && potentialTarget.getToughness() >= 4
        }, { source, target in
                target.destroy()
        }))
        cageTheCulprit.setFlavorText("\"Reports of Gruul rioters in four districts. Start with the big ones and work your way up.\"\n--Libuse, Boros sergeant")
        return cageTheCulprit
    }
    // 6 Conclave Tribunal
    // 7 Crush Contraband
    // 8 Dawn of Hope
    // 9 Demotion
    // 10 Divine Visitation
    // 11 Flight of Equenauts
    // 12 Gird for Battle
    // 13 Haazda Marshal
    // 14 Healer's Hawk
    // 15 Hunted Witness
    // 16 Inspiring Unicorn
    // 17 Intrusive Packbeast
    // 18 Ledev Guardian
    // 19 Light of the Legion
    // 20 Loxodon Recruiter
    // 21 Luminous Bonds
    // 22 Parhelion Patrol
    // 23 Righteous Blow
    // 24 Roc Charger
    // 25 Skyline Scout
    // 26 Sunhome Stalwart
    // 27 Sworn Companions
    // 28 Take Heart
    // 29 Tenth District Guard
    // 30 Venerated Loxodon
    // 31 Capture Sphere
    // 32 Chemister's Insight
    // 33 Citywatch Sphinx
    // 34 Dazzling Lights
    // 35 Devious Cover-Up
    // 36 Dimir Informant
    // 37 Disdainful Stroke
    // 38 Dream Eater
    // 39 Drowned Secrets
    // 40 Enhanced Surveillance
    // 41 Guild Summit
    // 42 Leapfrog
    // 43 Maximize Altitude
    // 44 Mission Briefing
    // 45 Murmuring Mystic
    // 46 Muse Drake
    // 47 Narcomeba
    // 48 Nightveil Sprite
    // 49 Omnispell Adept
    // 50 Passwall Adept
    // 51 Quasiduplicate
    // 52 Radical Idea
    // 53 Selective Snare
    // 54 Sinister Sabotage
    // 55 Thoughtbound Phantasm
    // 56 Unexplained Disappearance
    // 57 Vedalken Mesmerist
    static func WallOfMist() -> Card {
        let wallOfMist = Card(name: "Wall of Mist", rarity: .Common, set: set, number: 58)
        wallOfMist.setManaCost("1U")
        wallOfMist.setType(.Creature, .Wall)
        wallOfMist.defender = true
        wallOfMist.setFlavorText("Fog haunts the streets, rendering the familiar otherworldly, changing neighbors into shadows, and muffling cries for help.")
        wallOfMist.power = 0
        wallOfMist.toughness = 5
        return wallOfMist
    }
    // 59 Watcher in the Mist
    static func WishcoinCrab() -> Card {
        let wishcoinCrab = Card(name: "Wishcoin Crab", rarity: .Common, set: set, number: 60)
        wishcoinCrab.setManaCost("3U")
        wishcoinCrab.setType(.Creature, .Crab)
        wishcoinCrab.setFlavorText("\"What wishes do they grant? Mostly pinching-related ones.\"\n--Omik, superintendant of waterworks")
        wishcoinCrab.power = 2
        wishcoinCrab.toughness = 5
        return wishcoinCrab
    }
    
}
