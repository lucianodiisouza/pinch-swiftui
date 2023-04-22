//
//  ContentView.swift
//  Pinch
//
//  Created by Luciano dii Souza on 22/04/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    var body: some View {
        NavigationView{
            ZStack {
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
