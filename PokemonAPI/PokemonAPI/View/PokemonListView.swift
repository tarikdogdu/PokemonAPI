//
//  PokemonListView.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 4.03.2022.
//

import SwiftUI

struct PokemonListView: View {
    @State var pokemons: [Results]
    var body: some View {
        NavigationView{
        List{
            ForEach(pokemons , id: \.self ) {pokemon in
                NavigationLink{
                    PokemonDetailView(pokemon: pokemon)
                }label: {
                    Text(pokemon.name).frame(width: 100, height: 35)
                }
            }
        }.listStyle(PlainListStyle())
                .navigationTitle("Pokemon List")
        }}
    }


struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(pokemons: [Results]())
    }
}
