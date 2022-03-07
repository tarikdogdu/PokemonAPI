//
//  LoadingView.swift
//  PokemonAPI
//
//  Created by Burhan Tarık Doğdu on 4.03.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
        Text("Loading..").font(.system(size: 20))
        ProgressView()
        }}
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
