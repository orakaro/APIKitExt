//
//  Repo.swift
//  APIKitExt
//
//  Created by DTVD on 12/23/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import JASON
import APIKitExt

private extension JSONKeys {
    static let id = JSONKey<Int>("id")
    static let fullName = JSONKey<String>("full_name")
    static let stargazersCount = JSONKey<Int>("stargazers_count")
}

struct Repo {
    var id: Int
    var fullName: String
    var stargazersCount: Int
}

extension Repo: JASONable {
    init?(data: JSON) {
        id = data[.id]
        fullName = data[.fullName]
        stargazersCount = data[.stargazersCount]
    }
}
