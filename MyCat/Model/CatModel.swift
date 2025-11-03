//
//  CatModel.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 10/29/25.
//

import Foundation
import Observation

@Observable
class CatModel: Codable, Identifiable {
    let id: String
    let url: String
    let width: Int
    let height: Int
    
    init(id: String, url: String, width: Int, height: Int) {
            self.id = id
            self.url = url
            self.width = width
            self.height = height
        }
    
}
