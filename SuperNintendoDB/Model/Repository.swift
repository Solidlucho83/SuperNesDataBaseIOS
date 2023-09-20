//
//  Repository.swift
//  SuperNintendoDB
//
//  Created by solidlucho on 15/09/2023.
//

import Foundation

class Repository {
    
    private let linkGithub = "https://github.com/Constuelo/snes_games_api/blob/master/media/"
    private let wikipedia = "https://en.wikipedia.org/wiki/"
    
    var superNesGames: [GameStruct] {
        return [
            GameStruct(name: "90 Minutes European Prime Goal", releaseYear: "1995", imageURL: "\(linkGithub)90_Minutes_European_Prime_Goal_PAL.png?raw=true", wikipediaURL: "\(wikipedia)90_Minutes_European_Prime_Goal"),
            GameStruct(name: "ACME Animation Factory", releaseYear: "1995", imageURL: "\(linkGithub)ACME_Animation_Factory_PAL.png?raw=true", wikipediaURL: "\(wikipedia)ACME_Animation_Factory"),
            GameStruct(name: "Aaahh Real Monsters", releaseYear: "1996", imageURL: "\(linkGithub)Aaahh_Real_Monsters_PAL.png?raw=true", wikipediaURL: "\(wikipedia)Aaahh_Real_Monsters"),
            GameStruct(name: "ActRaiser 2", releaseYear: "1995", imageURL: "\(linkGithub)ActRaiser_2_PAL.png?raw=true", wikipediaURL: "\(wikipedia)ActRaiser_2"),
            GameStruct(name: "ActRaiser", releaseYear: "1993", imageURL: "\(linkGithub)ActRaiser_PAL.png?raw=true", wikipediaURL: "\(wikipedia)ActRaiser"),
            GameStruct(name: "Zombies Ate My Neighbors", releaseYear: "1994", imageURL: "\(linkGithub)Zombies_Ate_My_Neighbors_PAL.png?raw=true", wikipediaURL: "\(wikipedia)Zombies_Ate_My_Neighbors"),
            GameStruct(name: "Zool - Ninja of the Nth Dimension", releaseYear: "1994", imageURL: "\(linkGithub)Zool_-_Ninja_of_the_Nth_Dimension_PAL.png?raw=true", wikipediaURL: "\(wikipedia)Zool_Ninja_of_the_Nth_Dimension"),
            GameStruct(name: "Zoop", releaseYear: "1993", imageURL: "\(linkGithub)Zoop_PAL.png?raw=true", wikipediaURL: "\(wikipedia)Zoop")
        ]
    }
    
    var customersList: [GameStruct] {
        return []
    }
}
