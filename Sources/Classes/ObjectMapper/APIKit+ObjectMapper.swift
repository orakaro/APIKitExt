//
//  APIKit+ObjectMapper.swift
//
//
//  Created by DTVD on 11/12/16.
//  Copyright © 2016 DTVD. All rights reserved.
//

import Foundation
import ObjectMapper

enum MapError: Error {
    case Unmatchable(Any)
}

public extension Mappable {

    public static func mapObject(_ object: Any) throws -> Self {
        guard let result = Mapper<Self>().map(JSONObject: object) else {
            throw MapError.Unmatchable(object)
        }
        return result
    }

    public static func mapArray(_ object: Any) throws -> [Self] {
        guard let dictionaryArray = object as? [[String: Any]],
            let objects = Mapper<Self>().mapArray(JSONArray: dictionaryArray)
            else {
                throw MapError.Unmatchable(object)
        }
        return objects
    }
}

public extension ImmutableMappable {

    public static func mapObject(_ object: Any) throws -> Self {
        return try Mapper<Self>().map(JSONObject: object)
    }

    public static func mapArray(_ object: Any) throws -> [Self] {
        guard let dictionaryArray = object as? [[String: Any]] else {
            return []
        }
        return try Mapper<Self>().mapArray(JSONArray: dictionaryArray)
    }
}
