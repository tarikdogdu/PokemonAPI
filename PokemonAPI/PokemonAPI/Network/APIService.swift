//
//  APIService.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 5.03.2022.
//

import Foundation
import UIKit
import SwiftUI


struct APIService  {
    
    
    func getFavorites(name : String ){
        
        
//        let decoder = JSONDecoder()
//        do{
//            let sourcesURL = Bundle.main.url(forResource: "PokemonListData", withExtension: "json")
//            guard let jsonData = try? Data(contentsOf: sourcesURL!) else {
//                fatalError("could not convert")
//            }
//            let pokemons = try decoder.decode([Results].self, from : jsonData)
//            if let name1 = pokemons["name"] as? [[String : Any]]{
//                for user in pokemons{
//                    if let name2 = user["name"] as? String, name.range(of: name, options: .caseInsensitive) !={
//                        return true
//                    }
//                }
//            }
//        }
//        catch{
//
//        }
//
        
    }
    
    func showFavorites(){
        
    }
    
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> Void ) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if let response = response as? HTTPURLResponse,!(200...299).contains (response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()

                do{
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                                if let content = json["results"] as? Any {
                                    print(content)
                                }
                        }
//                    let results = try decoder.decode(APIResponse.self, from: data)
//                    DispatchQueue.main.async {
//                        self.pokemons = pokemons
//                    }
//                    print(results)
                }
                catch{
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
//                    print(error)
//                    print(error.localizedDescription)
                }
            }
            
            }
            
        
        task.resume()
    }
    
//    func fetchPokemonDetail (url: URL? , completion : @escaping (Result<DetailResponse , APIError>) -> Void){
//
//        guard let url = url else{
//            let error = APIError.badURL
//            completion(Result.failure(error))
//            return
//
//        }
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//
//            if let error = error as? URLError {
//                completion(Result.failure(APIError.url(error)))
//            }else if let response = response as? HTTPURLResponse,!(200...299).contains (response.statusCode) {
//                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
//            }else if let data = data {
//
//                do{
//                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any]{
//                        let result = json as? DetailResponse
//                        completion(Result.success(result!))
//                        print(json)
//                    }
//                }
//                catch{
//                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
//                    print(error)
//                    print(error.localizedDescription)
//                }
//            }
//        }
//        task.resume()
//    }
    
    
    func fetchPokemons(url: URL? , completion : @escaping( Result<[Results] , APIError >) -> Void ){
        
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if let response = response as? HTTPURLResponse,!(200...299).contains (response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do{
                    
                    let sourcesURL = Bundle.main.url(forResource: "PokemonListData", withExtension: "json")
                    guard let jsonData = try? Data(contentsOf: sourcesURL!) else {
                        fatalError("could not convert")
                    }
                    let pokemons = try decoder.decode([Results].self, from: jsonData)
                    completion(Result.success(pokemons))
                    
//                    let pokemon = try decoder.decode("PokemonListData.json", from: data)
//                    let pokemons = try decoder.decode([Results].self, from: data)
//                    completion(Result.success(pokemons))
//                    print(pokemons)
                    //
//                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
//                        if let content = json["results"] as? Any {
//                            print(content)
//                        }
//
//                    }
//                                if let content = json["results"] as? [[String:String]] {
//                                    for category in content {
//                                        let name = category["name"]
//                                        let url =  category["url"]
//                                        let jsonAPIResponse = json as? APIResponse
////                                        completion(Result.success(jsonAPIResponse!))
////                                        print(name, url)
//                                        print(jsonAPIResponse)
//                                    }
//                                }
//
////                         print(json)
//                        }
//                    let results = try decoder.decode(APIResponse.self, from: data)
//                    DispatchQueue.main.async {
//                        self.pokemons = pokemons
//                    }
//                    print(results)
                }
                catch{
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                    print(error)
                    print(error.localizedDescription)
                }
            }
            
            }
            
        
        task.resume()

    }

}
