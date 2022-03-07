//
//  Favorites.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 6.03.2022.
//

import SwiftUI



struct Favorites: View {
    @State var favPokemonNames = [String]()
    var body: some View {
        Text("tt")
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites(favPokemonNames: [String]())
    }
}
