//
//  ErrorView.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 4.03.2022.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var serverFetcher : ServerFetcher
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(serverFetcher: ServerFetcher())
    }
}
