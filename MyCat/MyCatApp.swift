//
//  MyCatApp.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 10/29/25.
//

import SwiftUI
import TipKit

@main
struct MyCatApp: App {
    var body: some Scene {
        WindowGroup {
            CatHomeView().tint(Color.catColor)
        }
    }
    init () {
        try? Tips.resetDatastore()
        try? Tips.configure()
    }
}
