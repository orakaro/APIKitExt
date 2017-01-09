//
//  GithubAPIService.swift
//  APIKitExt
//
//  Created by DTVD on 12/23/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import APIKit
import APIKitExt
import RxSwift

protocol GithubApiService {
    func getRepoList(query: String) -> Observable<[Repo]>
}

protocol UsesGithubApiService {
    var githubApiService: GithubApiService { get }
}

class MixInGithubApiService: GithubApiService {
    let schedulers = SchedulerService.sharedInstance

    // Normal
    func getRepoList(query: String, successHandler: @escaping ([Repo]) -> Void) {
        let request = RepoRequest(query: query)
        Session.send(request) { result in
            switch result {
            case .success(let response):
                successHandler(response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // RxSwift
    func getRepoList(query: String) -> Observable<[Repo]>{
        let request = RepoRequest(query: query)
        return Session.send(request: request)
            .subscribeOn(schedulers.backgroundWorkScheduler)
            .observeOn(schedulers.mainScheduler)
    }
}

