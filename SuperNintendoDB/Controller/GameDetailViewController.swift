//
//  GameDetailViewController.swift
//  SuperNintendoDB
//
//  Created by solidlucho on 21/09/2023.
//
import UIKit

class GameDetailViewController: UIViewController {
    
  
    @IBOutlet weak var gameMainImg: UIImageView!
    
    @IBOutlet weak var titleMainLabel: UILabel!
    
    
    var gameTitle: String?
    var gameCoverURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        if let title = gameTitle {
            titleMainLabel.text = title
        }
        
        
        if let coverURL = gameCoverURL, let url = URL(string: coverURL) {
            URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
                if let error = error {
                    print("Error al cargar la imagen: \(error.localizedDescription)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.gameMainImg.image = image
                    }
                }
            }.resume()
        }
    }
}
