//
//  ListGamesViewModel.swift
//  SuperNintendoDB
//
//  Created by solidlucho on 21/09/2023.
//
 
import Foundation
import Firebase
import FirebaseFirestore

class ListGamesViewModel {
    
    var games: Observable<[(title: String, cover: String)]> = Observable([])
    
    
    private let db = Firestore.firestore()
    
   
    func fetchGames() {
        db.collection("snesgames").getDocuments { [weak self] (querySnapshot, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                var gameData: [(title: String, cover: String)] = []
                if let querySnapshot = querySnapshot {
                    for document in querySnapshot.documents {
                        let data = document.data()
                        print("Data from Firestore: \(data)")
                        if let title = data["title"] as? String,
                           let coverImageUrl = data["cover"] as? String {
                            gameData.append((title, coverImageUrl))
                        }
                    }
                }
             
                self.games.value = gameData
            }
        }
    }
}
