//
//  CatFactView.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 10/29/25.
//

import SwiftUI

struct CatFactView: View {
    
    @State private var catFact: CatFactModel?
    
    var body: some View {
        Group {
            if let fact = catFact {
                DynamicFactContainer(text: fact.fact)
            } else {
                ProgressView("Loading Cat Fact...")
                    .foregroundColor(.white)
            }
        }
        .task {
            catFact = try? await fetchCatFact()
        }
    }
}

struct DynamicFactContainer: View {
    let text: String

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Text(text)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 12)

                    Spacer()
                }
                .frame(
                    maxWidth: .infinity,
                    minHeight: geo.size.height,
                    alignment: .top
                )
            }
        }
        .frame(height: 180)
    }
}


#Preview {
    CatFactView()
}
