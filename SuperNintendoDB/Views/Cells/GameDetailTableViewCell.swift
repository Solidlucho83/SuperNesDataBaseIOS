//
//  GameDetailTableViewCell.swift
//  SuperNintendoDB
//
//  Created by solidlucho on 17/09/2023.
//

import UIKit

class GameDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var nameGameLabel: UILabel!
    
    @IBOutlet weak var coverGameImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         
    }

    func setupCell(nameGame: String, imageUrl: String?) {
        nameGameLabel.text = nameGame
        
        if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
                  URLSession.shared.dataTask(with: url) { (data, response, error) in
                      if let error = error {
                          print("Error al cargar la imagen: \(error.localizedDescription)")
                          return
                      }
                      
                      if let data = data, let image = UIImage(data: data) {
                          DispatchQueue.main.async {
                              self.coverGameImg.image = image
                          }
                      }
                  }.resume()
              }
          }
    }
 
     
