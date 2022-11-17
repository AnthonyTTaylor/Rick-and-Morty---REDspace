//
//  API.swift
//  RickAndMorty
//
//  Created by Anthony Taylor on 2022-11-16.
//

import Foundation


enum BaseURL: Equatable {
    private static let productionURL = "https://rickandmortyapi.com/api"
    private static let staginURL = "https://rickandmortyapi.com/api"
    
    case production
    case staging
    case custom(url: String)
    
    init(url: String) {
        if url == BaseURL.productionURL {
            self = .production
        } else if url == BaseURL.staginURL {
            self = .staging
        } else {
            self = .custom(url: url)
        }
    }
    
    func urlString() -> String {
        switch self {
        case .production:
            return BaseURL.productionURL
        case .staging:
            return BaseURL.staginURL
        case .custom(let url):
            return url
        }
    }
    
    static func == (lhs: BaseURL, rhs: BaseURL) -> Bool {
        switch (lhs, rhs) {
        case (.production, .production), (.staging, .staging):
            return true
        case (.custom(let lurl), .custom(let rurl)):
            return lurl == rurl
        default:
            return false
        }
        
    }
}
