//
//  StartMainView.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 6.03.2022.
//

import SwiftUI

struct StartMainView: View {
    @State var pokemons : [Results]
    @State var favPokemon : [String]
    @State private var selection = 2
    var body: some View {
        TabView(selection:$selection){
            Favorites(favPokemonNames: favPokemon)
                .tabItem{
                    Text("Favorites")
                    Image(systemName: "star.circle")}.tag(1)
            PokemonListView(pokemons: pokemons)
                .tabItem{
                    Text("List")
                    Image(systemName: "list.star")}.tag(2)
        }
    }
}

struct StartMainView_Previews: PreviewProvider {
    static var previews: some View {
        StartMainView(pokemons: [Results](), favPokemon: [String]())
    }
}
