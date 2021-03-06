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
    var id: Int!
    var fullName: String!
    var stargazersCount: Int!

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id              <- map["id"]
        fullName        <- map["full_name"]
        stargazersCount <- map["stargazers_count"]
    }
}
