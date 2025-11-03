//
//  CatFactModel.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 11/2/25.
//

import Foundation
import Observation

@Observable
class CatFactModel: Codable, Identifiable {
    let fact: String
    let length: Int
    
    init(fact: String, length: Int) {
            self.fact = fact
            self.length = length
        }
}
