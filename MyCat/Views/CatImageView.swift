//
//  CatImageView.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 10/30/25.
//

import SwiftUI

struct CatImageView: View {
    
    let cat: CatModel

    var body: some View {
        AsyncImage(url: URL(string: cat.url)) { image in
            image
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal)
        } placeholder: {
            ProgressView()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    CatImageView(
        cat: CatModel(
            id: "1",
            url: "https://cdn2.thecatapi.com/images/MTY3ODIyMQ.jpg",
            width: 400,
            height: 400
        )
    )
}
