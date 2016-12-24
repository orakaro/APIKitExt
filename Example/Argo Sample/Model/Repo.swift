//
//  Repo.swift
//  APIKitExt
//
//  Created by DTVD on 12/23/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

struct Repo {
    var id: Int
    var fullName: String
    var stargazersCount: Int
}

extension Repo: Decodable {
    static func decode(_ j: JSON) -> Decoded<Repo> {
        return curry(Repo.init)
            <^> j <| "id"
            <*> j <| "full_name"
            <*> j <| "stargazers_count"
    }
}
