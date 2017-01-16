//
//  Repo.swift
//  APIKitExt
//
//  Created by DTVD on 12/23/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import SwiftyJSON
import APIKitExt

struct Repo {
    var id: Int
    var fullName: String
    var stargazersCount: Int
}

extension Repo: SwiftyJSONable {
    init?(data: JSON) {
        id = data["id"].intValue
        fullName = data["full_name"].stringValue
        stargazersCount = data["stargazers_count"].intValue
    }
}
