//
//  Repo.swift
//  APIKitExt
//
//  Created by DTVD on 12/23/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Unbox
import APIKitExt

struct Repo {
    var id: Int
    var fullName: String
    var stargazersCount: Int
}

extension Repo: Unboxable {
    init(unboxer: Unboxer) throws {
        id = try unboxer.unbox(key: "id")
        fullName = try unboxer.unbox(key: "full_name")
        stargazersCount = try unboxer.unbox(key: "stargazers_count")
    }
}
