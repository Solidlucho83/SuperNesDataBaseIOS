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
    
    // Agrega propiedades para almacenar los datos del juego
    var gameTitle: String?
    var gameCoverURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Verifica si se proporcionó el título del juego
        if let title = gameTitle {
            titleMainLabel.text = title
        }
        
        // Verifica si se proporcionó la URL de la cubierta del juego y carga la imagen (puedes usar URLSession o una biblioteca de manejo de imágenes).
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
