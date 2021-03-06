//
//  MountainTableViewController.swift
//  MountainChallenge
//
//  Created by Gustavo Miyamoto on 12/27/18.
//  Copyright © 2018 Gustavo Miyamoto. All rights reserved.
//

import UIKit
import RxSwift

class MountainListViewController: UITableViewController, BaseViewController {
    // MARK: - Properties
    private let viewModel: MountainListViewModelProtocol = MountainListViewModel()
    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register observable
        bindViewModel()
        
        // Load data
        self.showLoading(on: self.navigationController)
        viewModel.loadMountains()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItens()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MountainTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MountainTableViewCell else { return UITableViewCell() }
        
        // Fetches the appropriate mountain for the data source layout.
        let mountain = viewModel.getItem(index: indexPath.row)
        cell.bind(mountain: mountain)
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? MountainDetailViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedCell = sender as? MountainTableViewCell else {
            fatalError("Unexpected sender")
        }
        
        guard let indexPath = tableView.indexPath(for: selectedCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedMountain = viewModel.getItem(index: indexPath.row)
        let suggestions = viewModel.getSuggestion(index: indexPath.row)
        viewController.bind(mountain: selectedMountain, suggestions:  suggestions)
    }
    
    // MARK: - Class method
    
    func bindViewModel() {
        viewModel.listUpdated.asObservable()
            .subscribe(onNext: {
                self.tableView.reloadData()
                self.hideLoding(on: self.navigationController)
            })
            .disposed(by: disposeBag)
        viewModel.error.asObservable()
            .subscribe(onNext: { error in
                if error != nil {
                    self.hideLoding(on: self.navigationController)
                    self.showErrorMessage()
                }
            })
            .disposed(by: disposeBag)
    }
    
    fileprivate func showErrorMessage() {
        let alert = UIAlertController(title: "エラー", message: "山リストの読み込みに失敗しました :(", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in
            alert.dismiss(animated: true, completion: {
                
            })
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
