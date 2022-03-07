//
//  ContentView.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 4.03.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var serverFetcher = ServerFetcher()
    @StateObject var favoritesFetcher = FavoritesFetcher()
    var body: some View {
        
        if serverFetcher.isLoading{
            LoadingView()
        }else if serverFetcher.errorMessage != nil{
            ErrorView(serverFetcher: serverFetcher)
        }else{
            StartMainView(pokemons: serverFetcher.pokemons, favPokemon: favoritesFetcher.favoriteName)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
