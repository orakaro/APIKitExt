//
//  Repo.swift
//  APIKitExt
//
//  Created by DTVD on 12/23/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Mapper

struct Repo {
    var id: Int
    var fullName: String
    var stargazersCount: Int
}

extension Repo: Mappable {
    init(map: Mapper) throws {
        try id = map.from("id")
        try fullName = map.from("full_name")
        try stargazersCount = map.from("stargazers_count")
    }
}
