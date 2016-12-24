//
//  Repo.swift
//  APIKitExt
//
//  Created by DTVD on 12/23/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Himotoki

struct Repo {
    var id: Int
    var fullName: String
    var stargazersCount: Int
}

extension Repo: Decodable {
    static func decode(_ e: Extractor) throws -> Repo {
        return try Repo(
            id: e <| "id",
            fullName: e <| "full_name",
            stargazersCount: e <| "stargazers_count"
        )
    }
}
