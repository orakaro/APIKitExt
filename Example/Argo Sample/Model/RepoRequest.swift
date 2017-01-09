//
//  RepoRequest.swift
//  APIKitExt
//
//  Created by DTVD on 12/23/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import APIKit
import APIKitExt
import Argo

struct RepoRequest: Request {
    typealias Response = [Repo]
    var query: String

    init(query: String) {
        self.query = query
    }

    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    var method: HTTPMethod {
        return .get
    }

    var queryParameters: [String : Any]? {
        return [
            "q": query
        ]
    }

    var path: String {
        return "/search/repositories"
    }
}

extension RepoRequest {

    func response(from object: Any, urlResponse: HTTPURLResponse) -> [Repo] {
        guard
            let tree = object as? [String: Any],
            let items = tree["items"],
            let repos = try? Repo.mapArray(items)
        else {
            return []
        }
        return repos
    }
    
}
