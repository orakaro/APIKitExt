//
//  ViewController.swift
//  Himotoki Sample
//
//  Created by DTVD on 12/24/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let service = GithubApiService()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.getRepoList(query: "Swift"){ result in
            print(result.debugDescription)
        }
    }
    
}

