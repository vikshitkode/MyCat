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
            VStack {
                if let fact = catFact {
                    Text(fact.fact)
                        .font(.title3).foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.catColor)
                        
                } else {
                    ProgressView("Loading Cat Fact...")
                }
            }
            .task {
                do {
                    catFact = try await fetchCatFact()
                } catch {
                    print("Error fetching cat fact: \(error.localizedDescription)")
                }
            }.padding()
        
    }
}

#Preview {
    CatFactView()
}
