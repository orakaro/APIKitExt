//
//  APIKit+Unbox.swift
//
//
//  Created by DTVD on 24/12/16.
//  Copyright © 2016 DTVD. All rights reserved.
//

import Foundation
import Unbox

public extension Unboxable {
    public static func mapObject(_ object: Any) throws -> Self {
        guard let json = object as? UnboxableDictionary else {
            throw MapError.Unmatchable(object)
        }
        return try Unbox.unbox(dictionary: json)
    }
    public static func mapArray(_ object: Any) throws -> [Self] {
        guard let jsonArray = object as? [UnboxableDictionary] else {
            throw MapError.Unmatchable(object)
        }
        return try Unbox.unbox(dictionaries: jsonArray)
    }
}
