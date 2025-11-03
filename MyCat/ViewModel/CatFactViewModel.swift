//
//  CatFactViewModel.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 11/2/25.
//

import Foundation

func fetchCatFact() async throws -> CatFactModel {
    let endpoint = "https://catfact.ninja/fact"
    
    guard let url = URL(string: endpoint) else {
        throw CatError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw CatError.statusCodeError
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(CatFactModel.self, from: data)
    } catch {
        throw CatError.invalidData
    }
}
