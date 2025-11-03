//
//  ContentView.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 10/29/25.
//

import SwiftUI
import TipKit

struct CatHomeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var cats: [CatModel] = []
    let aboutTip = AboutTip()
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(cats) { cat in
                        CatFlipCardView(cat: cat)
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                            .frame(maxWidth: .infinity, maxHeight: 320)
                            .containerRelativeFrame(.horizontal)
                            .cornerRadius(25)
                            .shadow(radius: 5)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .ignoresSafeArea(.container, edges: .horizontal)
            .task {
                do {
                    cats = try await fetchCats()
                } catch {
                    print("Something went wrong \(error.localizedDescription)")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        CatAboutView()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .popoverTip(aboutTip, arrowEdge: .top)
                }
            }
        }.tint(colorScheme == .dark ? .orange : .catColor)
    }
}

#Preview {
    CatHomeView()
}
