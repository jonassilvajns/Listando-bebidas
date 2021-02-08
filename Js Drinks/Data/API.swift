//
//  API.swift
//  Js Drinks
//
//  Created by Jonas on 04/02/21.
//
import UIKit


enum drinksApiError: Error{
    case badURL
    case taskError
    case noResponse
    case invalidStatusCode (Int)
    case noData
    case decodeError
    
}

class API {
    private let basePath = "https://private-8f4dda-testeabi.apiary-mock.com/produtos"
    private let sessionConfiguration: URLSessionConfiguration = {
   
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = 60
        configuration.httpMaximumConnectionsPerHost = 4
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        return configuration

    }()
    public lazy var session = URLSession(configuration: sessionConfiguration)
    
   
    func loadDrinks(onComplete: @escaping (Result<[Drink], drinksApiError>) -> Void) {
        guard let url = URL(string: basePath) else {
            onComplete(.failure(.badURL))
            return
            
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                onComplete(.failure(.taskError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                onComplete(.failure(.noResponse))
                return
            }
            
            if !(200...299 ~= response.statusCode) {
                onComplete(.failure(.invalidStatusCode(response.statusCode)))
                return
            }
            
            guard let data = data else {
                onComplete(.failure(.noData))
                return
            }
            
            do {
                let drinks = try JSONDecoder().decode([Drink].self, from: data)
                onComplete(.success(drinks))
                print("total de bebidas:",drinks.count)
                print("foram encontrados dados na api\(data)")
            } catch {
                onComplete(.failure(.decodeError))
            }
        }
        task.resume()
        
    }
    
//    func loadImage(basePathImage: String,onComplete: @escaping (UIImage) -> Void) {
//            
//        guard let urlImage = URL(string: basePathImage) else {return}
//        
//        let task = session.dataTask(with: urlImage) { (data, response, error) in
//            
//            if let error = error {
//                print(error)
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse else {
//                print("Não teve resposta!!")
//                return
//            }
//            
//            if !(200...299 ~= response.statusCode) {
//                print("Status code inválido:", response.statusCode)
//                return
//            }
//            
//            guard let data = data else {
//                print("Não vieram dados!!")
//                return
//            }
//            
//
//            do {
//                guard  let myImage = UIImage(data: data) else { return}
//                onComplete(myImage)
//                print("foram encontrados dados na api\(data)")
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//        
//    }
    
    
    

}
