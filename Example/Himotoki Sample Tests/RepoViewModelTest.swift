//
//  Himotoki_Sample_Tests.swift
//  Himotoki Sample Tests
//
//  Created by DTVD on 1/9/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import RxSwift
import RxTest

@testable import Himotoki_Sample

class RepoViewModelTests: XCTestCase {
    let scheduler = TestScheduler(initialClock: 0)
    let diposeBag = DisposeBag()
    var viewModel: RepoViewModel!

    override func setUp() {
        class MockGithubApiService: GithubApiService {
            func getRepoList(query: String) -> Observable<[Repo]> {
                return Observable.of([])
            }
        }
        class ViewModelForTest: RepoViewModel {
            override var githubApiService: GithubApiService {
                return MockGithubApiService()
            }
        }
        viewModel = ViewModelForTest()
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRepoViewModel() {
        let query = scheduler.createHotObservable([
            next(10, "111"),
            next(30, "333"),
            next(40, "")
            ])
        viewModel.receive(query.asObservable())

        let repoCount = scheduler.createObserver(Int.self)
        let diposable = viewModel.repos
            .map{$0.count}
            .asObservable()
            .bindTo(repoCount)
        scheduler.scheduleAt(100000, action: {diposable.dispose()})
        scheduler.start()

        let correctMessages: [Recorded<Event<Int>>] = [
            next(10, 0),
            next(30, 0)
        ]

        XCTAssertEqual(repoCount.events, correctMessages)
        
    }
    
}
