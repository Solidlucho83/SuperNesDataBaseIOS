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
    // Propiedad observable para mantener los datos actualizados en la vista
    var games: Observable<[(title: String, cover: String)]> = Observable([])
    
    // Referencia a Firestore
    private let db = Firestore.firestore()
    
    // Función para cargar los datos desde Firestore
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
                // Actualizar los datos en la propiedad observable
                self.games.value = gameData
            }
        }
    }
}
