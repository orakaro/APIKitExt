//
//  APIKit+Observable.swift
//
//
//  Created by DTVD on 11/12/16.
//  Copyright © 2016 DTVD. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

public extension Session {
    public static func send<T: Request>(request: T) -> Observable<T.Response> {
        return Observable.create { observer in
            let cancellableToken = send(request) { result in
                switch result {
                case .success(let response):
                    observer.onNext(response)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }

            return Disposables.create {
                cancellableToken?.cancel()
            }
        }
    }
}
