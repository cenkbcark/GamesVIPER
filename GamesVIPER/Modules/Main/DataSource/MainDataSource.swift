//
//  MainDataSource.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 6.09.2023.
//

import UIKit

final class MainDataSource: NSObject {
    
    weak var tableView: UITableView?
    weak var presenter: MainModule.Presenter?
    
    
    init(_ tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.registerCells()
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
    private func registerCells() {

        let titleCellName = String(describing: TitleCell.self)
        let titleCellNib = UINib(nibName: titleCellName, bundle: .main)
        tableView?.register(titleCellNib, forCellReuseIdentifier: titleCellName)
        
        let containerCellName = String(describing: GameContainerCell.self)
        let containerCellNib = UINib(nibName: containerCellName, bundle: .main)
        tableView?.register(containerCellNib, forCellReuseIdentifier: containerCellName)
    }
}
extension MainDataSource: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let tabItem = presenter?.tableItems.count
        else { return 0}
        return tabItem
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableSection = presenter?.tableItems[section]
        else { return 0 }
        
        switch tableSection {
        case .title:
            return 1
        case .games:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableSection = presenter?.tableItems[indexPath.section]
        else { return UITableViewCell() }
        switch tableSection {
        case .title:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleCell.self), for: indexPath) as? TitleCell {
                return cell
            }
        case .games:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GameContainerCell.self), for: indexPath) as? GameContainerCell {
                cell.setupDataSource(presenter)
                return cell
            }
        }
        return UITableViewCell()
    }
}
