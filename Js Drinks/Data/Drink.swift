//
//  Model.swift
//  Js Drinks
//
//  Created by Jonas on 04/02/21.
//
import Foundation

// MARK: - Drink
class Drink: Codable {
    let produto, descricao: String
    let preco: Double
    let desconto: Bool
    let imagem: String

    init(produto: String, descricao: String, preco: Double, desconto: Bool, imagem: String) {
        self.produto = produto
        self.descricao = descricao
        self.preco = preco
        self.desconto = desconto
        self.imagem = imagem
    }
    
}

typealias Drinks = [Drink]
