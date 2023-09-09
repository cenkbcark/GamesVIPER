//
//  DetailPresenter.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 7.09.2023.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailModule.View? { get set }
    var interactor: DetailModule.Interactor? { get set }
    var router: DetailModule.Router? { get set }
    var tableItems: [DetailModule.DetailTableItem] { get set }
    
    func viewDidLoad()
    func didFetchGameDetail(with model: GamesDetailModel)
    
}

final class DetailPresenter: DetailPresenterProtocol {
    
    var id: Int?
    var view: DetailModule.View?
    var interactor: DetailModule.Interactor?
    var router: DetailModule.Router?
    var tableItems: [DetailModule.DetailTableItem] = []
    
    init(id: Int) {
        self.id = id
    }
    
    func viewDidLoad() {
        interactor?.fethGameDetail(with: id)
    }
    
    func didFetchGameDetail(with model: GamesDetailModel) {
        tableItems.append(.title(model: model))
        tableItems.append(.desc(model: model))
        view?.updateTableView(with: tableItems)
    }
}
