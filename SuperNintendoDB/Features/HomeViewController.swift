//
//  HomeViewController.swift
//  SuperNintendoDB
//
//  Created by solidlucho on 17/09/2023.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var aboutBtn: UIButton!
    
    @IBOutlet weak var toGameListButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

         
    }
    
 
    @IBAction func AboutAction(_ sender: Any) {
        let alertController = UIAlertController(title: "About", message: "Create by SolidLucho", preferredStyle: .alert)

              // Agrega un botón "Aceptar" al popup
              let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
                  // Aquí puedes realizar alguna acción cuando se presiona "Aceptar"
                  print("Botón Aceptar presionado")
              }
              alertController.addAction(okAction)

              // Presenta el popup en la pantalla actual
              present(alertController, animated: true, completion: nil)
    }
    
}
