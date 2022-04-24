//
//  ViewController.swift
//  Js Drinks
//
//  Created by Jonas on 04/02/21.
//

import UIKit
import Kingfisher

class ProductViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet  weak var imageViewName: UIImageView!
    @IBOutlet  weak var productName: UILabel!
    @IBOutlet  weak var descriptionName: UILabel!
    @IBOutlet weak var tfPrice: UILabel!
    
    
    // MARK: - Properties
    var drinks: Drink?
    
   
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let drink = drinks {
            productName.text        = drink.produto
            descriptionName.text    = "Qt: \(drink.descricao)"
            tfPrice.text            = ("R$ \(drink.preco)")
            if  drink.desconto == true {
                tfPrice.textColor = .green
            } else {
                tfPrice.textColor = .black
            }
            
            imageViewName.kf.setImage(with: URL(string: drink.imagem), placeholder: nil, options: [.transition(ImageTransition.fade(0.7))]);
            
        }
        
        
        
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
    // MARK: - Methods
    // MARK: - IBActions
    
}

  


//if let drinks = drinks {
//
   
//
//}








