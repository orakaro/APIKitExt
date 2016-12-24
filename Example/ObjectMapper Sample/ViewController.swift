//
//  ViewController.swift
//  APIKitExt
//
//  Created by Orakaro on 12/23/2016.
//  Copyright (c) 2016 Orakaro. All rights reserved.
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

