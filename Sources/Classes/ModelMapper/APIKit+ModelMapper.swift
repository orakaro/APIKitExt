//
//  APIKit+ModelMapper.swift
//
//
//  Created by DTVD on 22/1/17.
//  Copyright © 2017 DTVD. All rights reserved.
//

import Foundation
import Mapper

public extension Mappable {

    public static func mapObject(_ object: Any) throws -> Self {
        guard let jsonDictionary = object as? NSDictionary,
              let result = Self.from(jsonDictionary) else {
            throw MapError.Unmatchable(object)
        }
        return result
    }

    public static func mapArray(_ object: Any) throws -> [Self] {
        guard let jsonDictionaryArray = object as? NSArray,
              let objects = Self.from(jsonDictionaryArray) else {
            throw MapError.Unmatchable(object)
        }
        return objects
    }
}
