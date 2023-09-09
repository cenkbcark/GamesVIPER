//
//  DetailViewController.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 7.09.2023.
//

import UIKit

protocol DetailViewProtocol {
    var presenter: DetailModule.Presenter? { get set }
    func updateTableView(with Model: [DetailModule.DetailTableItem])
}

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: DetailModule.Presenter?
    private var dataSource: DetailDataSource!
    private var tableItems: [DetailModule.DetailTableItem] = []

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

extension DetailViewController: DetailViewProtocol {

    func updateTableView(with Model: [DetailModule.DetailTableItem]) {
        tableItems = Model
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
