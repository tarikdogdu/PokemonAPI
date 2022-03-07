//
//  StructsofPokemon.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 4.03.2022.
//

import Foundation

struct APIResponse : Codable {
    
    let count    : Int
    let next     : String?
    let previous : String?
    let results  : [Results]
    
}

struct FavoritePokemons : Codable {
    
    let name : String
    let image : String
}

struct Results : Codable , Hashable {
   
    var name :String
    let sprites : String
    let types : [String]
    let abilities : [String]
    let stats : [[String]]
    let weight : Double
    let height : Double
    
    init(name: String, sprites: String, types: [String], abilities: [String], stats: [[String]], weight: Double, height: Double){
        self.name = name
        self.sprites = sprites
        self.types = types
        self.abilities = abilities
        self.stats = stats
        self.weight = weight
        self.height = height
    }
    
    static func example() -> Results{
        return Results(name: "Bulbasaur", sprites: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", types: ["Grass","Poison"], abilities: ["Overgrow" , "Chlorophile"], stats: [["45","HP"] , ["49","Attack"] , ["65","Defence"]], weight: 69, height: 7)
    }
    
}

//struct Stat : Codable , Hashable {
//    let base_stat : String
//    let stat : String
//}
//
//struct Stats : Codable , Hashable {
//    let stat : [Stat]
//}



//struct DetailResponse : Codable {
//
//    let sprites : Sprites
//    let forms : [Forms]
//    let types : [Types]
//    let abilities : [Abilities]
//    let stats : [Stats]
//    let weight : Int
//    let hight : Int
//
//}

//struct Sprites : Codable {
//    let front_default : String
//}

//struct Forms : Codable {
//    let name : String
//}

