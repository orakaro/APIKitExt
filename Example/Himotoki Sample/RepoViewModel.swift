//
//  RepoViewModel.swift
//  APIKitExt
//
//  Created by DTVD on 1/9/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

class RepoViewModel {

    var githubApiService: GithubApiService { return MixInGithubApiService() }
    var repos: Observable<[Repo]> = Observable.empty()
    var schedulers = SchedulerService.sharedInstance

    func receive(_ query: Observable<String>) {
        let result = query
            .filter{!$0.isEmpty}
            .flatMapLatest{ [unowned self] query -> Observable<[Repo]> in
                return self.githubApiService.getRepoList(query: query)
            }
            .shareReplay(1)
        repos = result
    }
}
