//
//  MyCatApp.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 10/29/25.
//

import SwiftUI

@main
struct MyCatApp: App {
    var body: some Scene {
        WindowGroup {
            CatHomeView().tint(Color.catColor)
        }
    }
}
