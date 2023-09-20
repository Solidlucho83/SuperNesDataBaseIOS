//
//  ListGamesViewController.swift
//  SuperNintendoDB
//
//  Created by solidlucho on 17/09/2023.
//

import UIKit
import Firebase
import FirebaseFirestore

class ListGamesViewController: UIViewController {

    @IBOutlet weak var listGameTableView: UITableView!

    private var dataSource = [(title: String, cover: String)]()
    private var db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()

        listGameTableView.rowHeight = 120
        listGameTableView.dataSource = self
        listGameTableView.register(UINib(nibName: "GameDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "GameDetailTableViewCell")
        listGameTableView.delegate = self
        loadDataFromFirestore()
    }

    private func loadDataFromFirestore() {
        db.collection("snesgames").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if let querySnapshot = querySnapshot {
                    for document in querySnapshot.documents {
                        let data = document.data()
                        print("Data from Firestore: \(data)")
                        if let title = data["title"] as? String,
                           let coverImageUrl = data["cover"] as? String {
                            self.dataSource.append((title, coverImageUrl))
                        }
                    }
                }
                self.listGameTableView.reloadData()
            }
        }
    }
}

extension ListGamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
    }
}

extension ListGamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameDetailTableViewCell", for: indexPath) as! GameDetailTableViewCell

        let game = dataSource[indexPath.row]
        cell.setupCell(nameGame: game.title, imageUrl: game.cover)

        return cell
    }
}


