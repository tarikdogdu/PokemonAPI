//
//  APIError.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 5.03.2022.
//

import Foundation

enum APIError : Error , CustomStringConvertible {
    
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
     
    var localisedDescription : String {
        
        switch self {
        case .badURL , .parsing , .unknown :
            return "Something went wrong."
        case .badResponse(_):
            return "Connetion failed to server."
        case .url(let error):
            return error?.localizedDescription ?? "Sorry something went wrong"
        }
        
    }
    
    var description: String {
        
        switch self {
            
        case .badURL:
            return "invaild url / url problem "
        case .badResponse(statusCode: let statusCode):
            return " bad response -> code \(statusCode)"
        case .url(let error):
            return error?.localizedDescription ?? "Session errror."
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? " ")"
        case .unknown:
            return "unknoıwn error"
        }
    }
    
}
 
