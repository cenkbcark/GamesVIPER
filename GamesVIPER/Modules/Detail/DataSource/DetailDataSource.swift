//
//  DetailDataSource.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 7.09.2023.
//

import UIKit

final class DetailDataSource: NSObject {
    
    weak var tableView: UITableView?
    weak var presenter: DetailModule.Presenter?
    
    init(_ tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.registerCells()
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
    
    private func registerCells() {
        let titleCellName = String(describing: DetailTitleCell.self)
        let titleCellNib = UINib(nibName: titleCellName, bundle: .main)
        tableView?.register(titleCellNib, forCellReuseIdentifier: titleCellName)
        
        let descCellName = String(describing: DetailDescriptionCell.self)
        let descCellNib = UINib(nibName: descCellName, bundle: .main)
        tableView?.register(descCellNib, forCellReuseIdentifier: descCellName)
    }
}
extension DetailDataSource: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let tabItem = presenter?.tableItems.count
        else { return 0 }
        return tabItem
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tabItem = presenter?.tableItems[section] else { return 0 }
        switch tabItem {
        case .title(_):
            return 1
        case .desc(_):
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableSection = presenter?.tableItems[indexPath.section]
        else { return UITableViewCell() }
        switch tableSection {
        case .title(model: let model):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailTitleCell.self)) as? DetailTitleCell {
                cell.setModel(with: model)
                return cell
            }
        case .desc(model: let model):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailDescriptionCell.self)) as? DetailDescriptionCell {
                cell.setModel(with: model)
                return cell
            }
        }
        return UITableViewCell()
    }
}
