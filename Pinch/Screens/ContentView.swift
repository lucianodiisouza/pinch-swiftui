//
//  ContentView.swift
//  Pinch
//
//  Created by Luciano dii Souza on 22/04/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    func resetImageState() {
        return withAnimation (.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                // MARK: PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                    // MARK: TAP GESTURE
                    /*
                        the count: 2 means double tap or
                        the amount of taps needed to trigger it
                    */
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })
                // MARK: DRAG GESTURE
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.linear(duration: 1)) {
                                imageOffset = value.translation
                            }
                        }
                        .onEnded {
                            _ in
                            if imageScale <= 1 {
                                resetImageState()
                            }
                        }
                )
            }
            // MARK: PAGE TITLE PROPERTIES
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
