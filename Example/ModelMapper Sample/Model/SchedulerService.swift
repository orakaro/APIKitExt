//
//  SchedulerService.swift
//  APIKitExt
//
//  Created by DTVD on 12/23/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift

class SchedulerService {
    static let sharedInstance = SchedulerService()

    let backgroundWorkScheduler: ImmediateSchedulerType
    let mainScheduler: SerialDispatchQueueScheduler

    private init() {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 10
        backgroundWorkScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        mainScheduler = MainScheduler.instance
    }
}
