//
//  MainCollectionDataSource.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 6.09.2023.
//

import UIKit

final class MainCollectionDataSource: NSObject {
    
    weak var collectionView: UICollectionView?
    weak var presenter: MainModule.Presenter?
    
    private var customLayout = CustomLayout()
        
    init(_ collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.collectionViewLayout = customLayout
        customLayout.minimumLineSpacing = 0
        customLayout.minimumInteritemSpacing = 0
        customLayout.scrollDirection = .horizontal
        customLayout.itemSize.width = 250
        customLayout.itemSize.height = 400
        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 25.0, bottom: 0.0, right: 0.0)
        self.registerCells()
    }
    
    private func registerCells() {
        let gameCellName = String(describing: GameCell.self)
        let gameCellNib = UINib(nibName: gameCellName, bundle: .main)
        collectionView?.register(gameCellNib, forCellWithReuseIdentifier: gameCellName)
    }
}
extension MainCollectionDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let tabItem = presenter?.collectionItems.count
        else { return 0}
        return tabItem
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let tableSection = presenter?.collectionItems[section]
        else { return 0 }
        switch tableSection {
        case .games(model: let games):
            return games.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let tableSection = presenter?.collectionItems[indexPath.section]
        else { return UICollectionViewCell() }
        switch tableSection {
        case .games(model: let games):
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GameCell.self), for: indexPath) as? GameCell {
                cell.setModels(games[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let tableItems = presenter?.collectionItems[indexPath.section] else { return }
        switch tableItems {
        case .games(model: let games):
            presenter?.didSelectedGame(with: games[indexPath.row].id)
        }
    }
}

extension MainCollectionDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 400)
    }
}

extension MainCollectionDataSource {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            setupCell()
        }
    }
    private func setupCell() {
        guard let collectionView = collectionView else { return }
        let indexPath = IndexPath(item: customLayout.currentPage, section: 0)
        if let cell = collectionView.cellForItem(at: indexPath) {
            transformCell(cell)
        }
    }
    private func transformCell(_ cell: UICollectionViewCell, isEffect: Bool = true) {
        guard let collectionView = collectionView else { return }
        if !isEffect {
            cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            return
        }
        UIView.animate(withDuration: 0.2) {
            cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
        
        for otherCell in collectionView.visibleCells {
            if let indexPath = collectionView.indexPath(for: otherCell) {
                if otherCell != cell {
                    UIView.animate(withDuration: 0.2) {
                        otherCell.transform = .identity
                    }
                }
            }

        }
    }
}

final class CustomLayout: UICollectionViewFlowLayout {
    
    var previousOffSet: CGFloat = 0.0
    var currentPage = 0

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let cv = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let itemCount = cv.numberOfItems(inSection: 0)
        
        if previousOffSet > cv.contentOffset.x && velocity.x < 0.0 {
            currentPage = max(currentPage-1, 0)
        } else if previousOffSet < cv.contentOffset.x && velocity.x > 0.0 {
            currentPage = min(currentPage+1, itemCount-1)
        }
        
        let w = cv.frame.width
        let itemW = itemSize.width
        let sp = minimumLineSpacing
        let edge = (w - itemW - sp*2) / 2
        let offSet = (itemW + sp) * CGFloat(currentPage) - (edge - sp)
        
        previousOffSet = offSet
        return CGPoint(x: offSet, y: proposedContentOffset.y)
    }
}
