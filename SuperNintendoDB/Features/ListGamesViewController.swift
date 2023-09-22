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

    private var viewModel = ListGamesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        listGameTableView.rowHeight = 120
        listGameTableView.dataSource = self
        listGameTableView.register(UINib(nibName: "GameDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "GameDetailTableViewCell")
        listGameTableView.delegate = self

        
        viewModel.fetchGames()

        
        viewModel.games.bind { [weak self] _ in
            self?.listGameTableView.reloadData()
        }
    }
}

extension ListGamesViewController: UITableViewDelegate {
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          performSegue(withIdentifier: "enviar", sender: self)
      }
      
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "enviar" {
              if let indexPath = listGameTableView.indexPathForSelectedRow {
                  let selectedGame = viewModel.games.value?[indexPath.row]
                  
                
                  if let objDestiny = segue.destination as? GameDetailViewController {
                      objDestiny.gameTitle = selectedGame?.title
                      objDestiny.gameCoverURL = selectedGame?.cover
                  }
              }
          }
      }
  }

extension ListGamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         viewModel.games.value?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameDetailTableViewCell", for: indexPath) as! GameDetailTableViewCell

        let game = viewModel.games.value?[indexPath.row]
        cell.setupCell(nameGame: game!.title, imageUrl: game?.cover)

        return cell
    }
}
