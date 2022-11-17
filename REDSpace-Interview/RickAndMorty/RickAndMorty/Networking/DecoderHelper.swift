//
//  DecoderHelper.swift
//  RickAndMorty
//
//  Created by Anthony Taylor on 2022-11-16.
//

import Foundation


final class CodableHelper {
    private static let encoder = JSONEncoder()
    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        //decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        return decoder
    }()
    
    static func encode<T: Encodable>(_ value: T) -> Data {
        do {
            return try encoder.encode(value)
        } catch {
            fatalError()
        }
    }
    
    static func decode<T: Decodable>(_ data: Data) -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        fatalError()
    }
}
