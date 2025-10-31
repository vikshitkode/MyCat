//
//  CatAboutView.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 10/29/25.
//

import SwiftUI
import Foundation

struct CatAboutView: View {
    var body: some View {
        VStack(spacing: 10) {
                VStack(spacing: 10){
                    Image(.catimg)
                        .resizable().aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .frame(width: 100, height: 100)
                    
                    Text("MyCat")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Version \(Bundle.main.appVersion)")
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                                    .padding(.bottom)
                }
            
            Text(
                "MyCat lets you explore random cat images from the Cat API. Enjoy scrolling through adorable cat photos and learn more about your favorite pets!"
            )
            .font(.system(size: 16, weight: .regular, design: .default))
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
}

extension Bundle {
    var appVersion: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    }
}

#Preview {
    CatAboutView()
}
