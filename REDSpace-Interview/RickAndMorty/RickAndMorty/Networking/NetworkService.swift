//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Anthony Taylor on 2022-11-16.
//

import Foundation

protocol NetworkServicing
{
    func getCharacters(completionHandler: @escaping ([CharacterModel], Error?) -> ())
}


public class NetworkService : NetworkServicing
{
    func getCharacters(completionHandler: @escaping ([CharacterModel], Error?) -> ()) {
        let pathString = "/character"
        let baseURL = BaseURL.production
        
        guard let url = URL(string: baseURL.urlString() + pathString ) else { fatalError() }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print("error is \(error.localizedDescription)")
                completionHandler([], error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            //let characterOutput = try? JSONDecoder().decode(Results.self, from: data)
            let characterOutput : Results = CodableHelper.decode(data)
            completionHandler(characterOutput.results, nil)
            
        }.resume()
    }
}
