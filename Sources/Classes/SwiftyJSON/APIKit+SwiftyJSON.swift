//
//  APIKit+SwiftyJSON.swift
//
//
//  Created by DTVD on 17/01/17.
//  Copyright © 2017 DTVD. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol SwiftyJSONable {
    init?(data: JSON)
}

public extension SwiftyJSONable {
    public static func mapObject(_ object: Any) throws -> Self {
        guard let result = Self(data: JSON(object)) else {
            throw MapError.Unmatchable(object)
        }
        return result
    }
    public static func mapArray(_ object: Any) throws -> [Self] {
        return JSON(object).arrayValue.flatMap{ Self(data: $0)}
    }
}
