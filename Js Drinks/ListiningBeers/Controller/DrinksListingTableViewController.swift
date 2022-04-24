//
//  DrinksListingTableViewController.swift
//  Js Drinks
//
//  Created by Jonas on 04/02/21.
//
import Foundation
import UIKit
import Kingfisher


class DrinksListingTableViewController: UITableViewController {

    var drinks: [Drink] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productViewController = segue.destination as? ProductViewController,
           let row = tableView.indexPathForSelectedRow?.row {
            
            let drinke = drinks[row]
            productViewController.drinks = drinke
        }
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BeerTableViewCell else{
            return UITableViewCell()
        }
            let drink = drinks[indexPath.row]
        
        cell.configure(with: drink)
            return cell
   
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == segueIdentifier,
//           let destination = segue.destination as? ProductViewController,
//           let selectedIndex = tableView.indexPathForSelectedRow?.row
//        {
//            destination.address = self.addresses[selectedIndex].text
//            self.navigationController?.pushViewController(destination, animated: true) // For example
    //}
//        }

    
    
}

        
