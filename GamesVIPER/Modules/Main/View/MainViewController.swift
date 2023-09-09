//
//  MainViewController.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import UIKit

protocol MainViewProtocol {
    var presenter: MainModule.Presenter? { get set }
    func updateTableView(with Model: [MainModule.MainTableItem])
}

final class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var dataSource: MainDataSource!
    private var tableItems: [MainModule.MainTableItem] = []
    
    var presenter: MainModule.Presenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupDataSource()
    }
    
    private func setupDataSource() {
        dataSource = .init(tableView)
        dataSource.presenter = presenter
    }
}
extension MainViewController: MainViewProtocol {
    func updateTableView(with Model: [MainModule.MainTableItem]) {
        tableItems = Model
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
