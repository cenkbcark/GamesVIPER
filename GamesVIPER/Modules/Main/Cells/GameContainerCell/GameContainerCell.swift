//
//  GameContainerCell.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 6.09.2023.
//

import UIKit

final class GameContainerCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var tableItems: [MainModule.MainCollectionItem] = []
    private var dataSource: MainCollectionDataSource!
    var presenter: MainModule.Presenter?
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setupDataSource(_ presenter: MainModule.Presenter?) {
        guard let presenter = presenter else { return }
        dataSource = .init(collectionView)
        dataSource.presenter = presenter
    }
}
