//
//  CatAboutView.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 10/29/25.
//

import SwiftUI
import Foundation

struct CatAboutView: View {
    
    let rainbowColors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.indigo, Color.purple]
    
    func shiftedColors(_ colors: [Color], by phase: Int) -> [Color] {
        let index = phase % colors.count
        return Array(colors[index...] + colors[..<index])
    }
    
    var body: some View {
        VStack(spacing: 10) {
            VStack(spacing: 10){
                Image(.catimg)
                    .resizable().aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 100, height: 100)
                
                Text("My Cat").phaseAnimator(0...rainbowColors.count) { view, phase in
                    view.foregroundStyle(
                        LinearGradient(
                            colors: shiftedColors(rainbowColors, by: phase),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                }
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Version \(Bundle.main.appVersion)")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.bottom)
            }
            
            Text("""
                    MyCat lets you explore random cat images from the Cat API. Enjoy scrolling through adorable cat photos and learn more about your favorite pets!
                    """)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .frame(maxWidth: 450)
                    .padding(.horizontal)
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
