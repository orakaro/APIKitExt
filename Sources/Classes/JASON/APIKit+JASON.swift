//
//  APIKit+Argo.swift
//
//
//  Created by DTVD on 24/12/16.
//  Copyright © 2016 DTVD. All rights reserved.
//

import Foundation
import JASON

public protocol JASONable {
    init?(data: JSON)
}

public extension JASONable {
    public static func mapObject(_ object: Any) throws -> Self {
        guard let result = Self(data: JSON(object)) else {
            throw MapError.Unmatchable(object)
        }
        return result
    }
    public static func mapArray(_ object: Any) throws -> [Self] {
        return JSON(object).arrayValue.flatMap{Self(data: JSON($0))}
    }
}
