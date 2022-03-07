//
//  ServerFetch.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 4.03.2022.
//

import Foundation

class ServerFetcher: ObservableObject {
    
    @Published var pokemons = [Results]()
    @Published var isLoading: Bool = false
    @Published var errorMessage : String? = nil
    
    init() {
        fetchPokemonInfo()
    }
    
    func fetchPokemonInfo(){
        isLoading = true
        let service = APIService()
        let url = URL (string: "https://pokeapi.co/api/v2/pokemon?offset=0&limit=40")
        service.fetchPokemons(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
            self.isLoading = false
            switch result {
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                print(error)
            case .success(let pokemons):
                self.pokemons = pokemons
            }
            }
}
    }
}
