//
//  CatViewModel.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 10/29/25.
//

import Foundation

enum CatError: String, Error {
    case invalidURL = "Invalid URL"
    case statusCodeError = "Bad Response from API and status code is not 200"
    case invalidData = "Data is invalid"
}

func fetchCats() async throws -> [CatModel] {
    let endpoint = "https://api.thecatapi.com/v1/images/search?limit=10"
    
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
        return try decoder.decode([CatModel].self, from: data)
    } catch {
        throw CatError.invalidData
    }
}

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
