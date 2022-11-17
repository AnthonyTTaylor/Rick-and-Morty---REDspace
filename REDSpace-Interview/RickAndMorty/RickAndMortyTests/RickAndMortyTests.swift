//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Anthony Taylor on 2022-11-16.
//

import XCTest
@testable import RickAndMorty

final class RickAndMortyTests: XCTestCase {
    
    enum TestError: Error {
        case fileNotFound
      }

    
    func testNetworkService() throws {
        let networkService = NetworkService()
        networkService.getCharacters { characters in
                XCTAssert(characters.count > 0)
        }

    }
    
    func testDecoding() throws {
        /// When the Data initializer is throwing an error, the test will fail.
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "characters", withExtension: "json") else {
          XCTFail("Missing File: characters.json")
            throw TestError.fileNotFound
        }
        //let url = Bundle.main.url(forResource: "characters", withExtension: ".json")
        let jsonData = try Data(contentsOf: url)

        /// The `XCTAssertNoThrow` can be used to get extra context about the throw
        XCTAssertNoThrow(try JSONDecoder().decode(Results.self, from: jsonData))
    }
    

}
