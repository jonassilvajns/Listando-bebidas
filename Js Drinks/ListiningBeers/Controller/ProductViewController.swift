//
//  ViewController.swift
//  Js Drinks
//
//  Created by Jonas on 04/02/21.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet  weak var productName: UILabel!
    @IBOutlet  weak var imageViewName: UIImageView!
    @IBOutlet  weak var descriptionName: UILabel!
 
    var drinks: Drink?
    var image = UIImage()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let drinks = drinks{
            productName?.text = drinks.produto
            descriptionName?.text = drinks.descricao
            imageViewName?.image = UIImage(named: drinks.imagem)


    }
    }

    
}
