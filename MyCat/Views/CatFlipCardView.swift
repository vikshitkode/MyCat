//
//  CatFlipCardView.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 10/30/25.
//

import SwiftUI

struct CatFlipCardView: View {
    let cat: CatModel
    @State private var flipped = false
    @State private var rotation = 0.0
    @State private var catFact: CatFactModel?
    
    var body: some View {
        ZStack {
            if rotation <= 90 {
                CatImageView(cat: cat)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.catColor)
                    .overlay(
                        VStack(spacing: 10) {
                            Text("Did you know?")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            CatFactView()
                        }
                    )
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
        }.frame(width: 300, height: 300)
            .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
            .onTapGesture {
                flipCard()
            }
            .padding()
    }
    
    private func flipCard() {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.3)) {
            rotation += 180
        }
        
        flipped.toggle()
        
        if flipped && catFact == nil {
            Task {
                catFact = try? await fetchCatFact()
            }
        }
        
        if rotation >= 360 {
            rotation -= 360
        }
    }
    
}

#Preview {
    CatFlipCardView(
        cat: CatModel(
            id: "1",
            url: "https://cdn2.thecatapi.com/images/MTY3ODIyMQ.jpg",
            width: 400,
            height: 400
        )
    )
}

