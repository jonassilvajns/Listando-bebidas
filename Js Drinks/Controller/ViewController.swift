//
//  ViewController.swift
//  Js Drinks
//
//  Created by Jonas on 04/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var imageViewName: UIImageView!
    @IBOutlet weak var descriptionName: UILabel!
    
    var drinks = [Drink]()
   // var imageViewCell = [Drink]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataCell()
        
    }
    

    
    func dataCell(){
        productName?.text = drinks.description
    }
}

