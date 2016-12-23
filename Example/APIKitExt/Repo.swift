//
//  Repo.swift
//  APIKitExt
//
//  Created by DTVD on 12/23/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import ObjectMapper

struct Repo: Mappable {
    var id: Int?
    var fullName: String?
    var avatar: String?
    var stargazersCount: Int?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id              <- map["id"]
        fullName        <- map["full_name"]
        avatar          <- map["owner.avatar_url"]
        stargazersCount <- map["stargazers_count"]
    }
}

extension Repo: Equatable {
    static public func ==(lhs: Repo, rhs: Repo) -> Bool {
        return lhs.id == rhs.id &&
            lhs.fullName == rhs.fullName
    }
}
