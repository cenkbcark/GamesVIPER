//
//  MainPresenter.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    var view: MainModule.View? { get set }
    var interactor: MainModule.Interactor? { get set }
    var router: MainModule.Router? { get set }
    var tableItems: [MainModule.MainTableItem] { get set}
    var collectionItems: [MainModule.MainCollectionItem] { get set }
    
    func viewDidLoad()
    func didFetchGames(with model: [GamesResponseModelElement])
    func didSelectedGame(with id: Int?)
    func fetchError()
}

final class MainPresenter: MainPresenterProtocol {
    var view: MainModule.View?
    var interactor: MainModule.Interactor?
    var router: MainModule.Router?
    var tableItems: [MainModule.MainTableItem] = []
    var collectionItems: [MainModule.MainCollectionItem] = []
    
    func viewDidLoad() {
        interactor?.fetchGames()
    }
    
    func didFetchGames(with model: [GamesResponseModelElement]) {
        tableItems.append(.title)
        tableItems.append(.games)
        collectionItems.append(.games(model: model))
        view?.updateTableView(with: tableItems)
    }
    
    func didSelectedGame(with id: Int?) {
        router?.navigateToDetail(with: id)
    }
    
    func fetchError() {
        
    }
    
    
}
