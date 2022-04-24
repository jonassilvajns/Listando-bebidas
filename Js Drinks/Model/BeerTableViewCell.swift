//
//  BeerTableViewCell.swift
//  Js Drinks
//
//  Created by Jonas on 06/03/21.
//

import UIKit
import Kingfisher

final class BeerTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    
    @IBOutlet private weak var imageViewPoster: UIImageView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelValue: UILabel!
    @IBOutlet private weak var labelQtde: UILabel!
    
    
    func configure(with beer: Drink){
        labelTitle.text         = beer.produto
        labelValue.text         = beer.descricao
        labelQtde.text          = ("R$ \(beer.preco)")
        imageViewPoster.kf.setImage(with: URL(string: beer.imagem), placeholder: nil, options: [.transition(ImageTransition.fade(0.7))]);
        
        if  beer.desconto == true {
            labelQtde.textColor = .green
        } else {
            labelQtde.textColor = .black
        }
        
    }
    
}













//        let url = URL(string:beer.imagem)
//
//        let imagedata = NSData.init(contentsOf: url! as URL)
//    if imagedata != nil {
//        imageViewPoster.image = UIImage(data:imagedata! as Data)
//
//     }
//------------
//extension String {
//
//       func stringToImage(_ handler: @escaping ((UIImage?)->())) {
//           if let url = URL(string: self) {
//               URLSession.shared.dataTask(with: url) { (data, response, error) in
//                   if let data = data {
//                       let image = UIImage(data: data)
//                       handler(image)
//                   }
//               }.resume()
//           }
//       }
//   }
