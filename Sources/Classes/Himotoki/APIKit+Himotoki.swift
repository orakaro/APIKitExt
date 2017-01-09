//
//  APIKit+Himotoki.swift
// 
//
//  Created by DTVD on 24/12/16.
//  Copyright © 2016 DTVD. All rights reserved.
//

import Foundation
import Himotoki

public extension Decodable {
    public static func mapObject(_ object: Any) throws -> Self {
        return try Self.decodeValue(object)
    }

    public static func mapArray(_ object: Any) throws -> [Self] {
        return try [Self].decode(object)
    }
}
