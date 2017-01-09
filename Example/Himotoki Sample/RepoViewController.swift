//
//  RepoViewController.swift
//  Himotoki Sample
//
//  Created by DTVD on 12/24/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RepoViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var searchBar = UISearchBar()
    fileprivate let reuseIdentifier = "RepoCell"
    fileprivate var viewModel = RepoViewModel()
    fileprivate let diposeBag = DisposeBag()
    fileprivate let veryLightGray = UIColor(
        red:200/255,
        green:200/255,
        blue:206/255,
        alpha:1
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        tableView.register( UINib(nibName: "Repo", bundle: nil) , forCellReuseIdentifier: reuseIdentifier)
        rxBinding()
    }

    func rxBinding() {
        let query = searchBar.rx.text
            .orEmpty
            .throttle(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()

        viewModel.receive(query)

        viewModel.repos
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(cellIdentifier: reuseIdentifier, cellType: RepoTableViewCell.self)) { _, repo, cell in
                cell.name.text = repo.fullName
                let stars = repo.stargazersCount
                cell.stargazersCount.text = String(describing: stars) + " stars"
                let url = repo.avatar
                cell.avatar.downloadFrom(url: url)
            }
            .addDisposableTo(diposeBag)
    }
}

extension RepoViewController: UISearchBarDelegate {

    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.navigationController?.navigationBar.barTintColor = veryLightGray
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        self.navigationController?.navigationBar.barTintColor = nil
    }
}
