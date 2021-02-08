//
//  DrinksListingTableViewController.swift
//  Js Drinks
//
//  Created by Jonas on 04/02/21.
//
import Foundation
import UIKit

class DrinksListingTableViewController: UITableViewController {

    var drinks: [Drink] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadDrinks()
        
        
    }
    
    
    // MARK: - Methods
    private func loadDrinks() {
        API().loadDrinks {[weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let drinks):
                self.drinks = drinks
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let drinksApiError):
                
                switch drinksApiError {
                case .badURL:
                    print("URL Invalida.")    
                case .invalidStatusCode(let statuscode):
                    print("o servidor retornou um status code invalido.",statuscode)
                case .decodeError:
                    print("O decodificador não funcionou.")
                case .noResponse:
                    print("O servidor não recebeu uma resposta.")
                case .noData:
                    print("O servidor não encontrou Dados na API.")
                default:
                    print("erro desconhecido.")
                }
                
            }
        }
    }
    
    
     
//    private func loadImage(url: String) {
//        API().loadImage(basePathImage: url) { (myImage) in
//            self.loadImage(url: myImage as! String)
//
//        }
//    }
    
   
    


    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let drink = drinks[indexPath.row]
            let url = NSURL(string:drink.imagem)
            let imagedata = NSData.init(contentsOf: url! as URL)

        
        //cell.textLabel?.text      = drink.produto
            cell.textLabel?.text        =     drink.produto
//        if drink.desconto is === true  {
//            print("é verdadeiro")
//        }
        cell.detailTextLabel?.text  = (" R$ \(drink.preco)")
      
        if imagedata != nil {
            
            cell.imageView?.image = UIImage(data:imagedata! as Data)
        }

        
            return cell
 
   
    }
}
//        cell.imageView.image = loadImage(url:drink.imagem)

//extension UIImageView {
//   private func loadImage(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}


