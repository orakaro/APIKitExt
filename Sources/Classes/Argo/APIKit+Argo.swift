//
//  APIKit+Argo.swift
//
//
//  Created by DTVD on 24/12/16.
//  Copyright © 2016 DTVD. All rights reserved.
//

import Foundation
import Argo

public extension Decodable where Self == Self.DecodedType {
    public static func mapObject(_ object: Any) throws -> Self {
        guard let result = Self.decode(JSON(object)).value else {
            throw MapError.Unmatchable(object)
        }
        return result
    }
    public static func mapArray(_ object: Any) throws -> [Self] {
        guard let result = Array<Self>.decode(JSON(object)).value else {
            throw MapError.Unmatchable(object)
        }
        return result
    }
}
