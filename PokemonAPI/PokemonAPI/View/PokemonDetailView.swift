//
//  PokemonDetailView.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 6.03.2022.
//

import SwiftUI

var pokefav = FavoritesFetcher()
let userdefaults = UserDefaults.standard

struct PokemonDetailView: View {
    @State var isFavorite = ""
    @State var pokemon : Results
    var body: some View {
        List {
            HStack(spacing: 100){
                AsyncImage(url: URL(string: pokemon.sprites))
                    .padding()
                    
                   
                Image(systemName: isFavorite)
                    .onAppear {
                        if userdefaults.object(forKey: "mykey") != nil {
                        pokefav.favoriteName = userdefaults.object(forKey: "mykey") as! [String]
                        }
                        for items in pokefav.favoriteName{
                     if pokemon.name == items{
                   isFavorite = "star.fill"
                              }
                }
                    }
//                Button {
//                    for items in pokefav.favoriteName{
//                        if pokemon.name == items{
//                            isFavorite = "star.fill"
//                        }
//                    }
//
//                } label: {
//                    Image(systemName: isFavorite).
//                }

            }
            
            Text("Name : \(pokemon.name)")
            if pokemon.types[1] != "" {
                Text("Type : \(pokemon.types[0]) , \(pokemon.types[1])")
            }else {
                Text("Type : \(pokemon.types[0])")
            }
            if pokemon.abilities[2] != "" {
                Text("Abilities : \(pokemon.abilities[0]) , \(pokemon.abilities[1]) or \(pokemon.abilities[2])")
            }else if pokemon.abilities[1] != "" {
                Text("Abilities : \(pokemon.abilities[0]) or \(pokemon.abilities[1])")
            }else{
                Text("Abilities : \(pokemon.abilities[0])")
            }
            Text("Stats ->    \(pokemon.stats[0][1]) : \(pokemon.stats[0][0])\n                  \(pokemon.stats[1][1]) : \(pokemon.stats[1][0])\n                  \(pokemon.stats[2][1]) : \(pokemon.stats[2][0])")
            Text("Weight : \(pokemon.weight) Kg.")
            Text("Height : \(pokemon.height) Mt.")
              
        }
           
        
        
        Button("Add to Favorites") {
            isFavorite = "star.fill"
            var count = 0
            for items in pokefav.favoriteName {
                if pokemon.name == items{
                    count = 1
                }
            }
            if count == 0 {
                pokefav.favoriteName.append(pokemon.name)
            }else{
                count = 0
            }
            
            for items in pokefav.favoriteName{
                print(items)
            }
            userdefaults.set(pokefav.favoriteName, forKey: "mykey")
            }
        }
    }


struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Results.example())
    }
}
