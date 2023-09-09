//
//  DetailModule.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 7.09.2023.
//

import Foundation

struct DetailModule {
    typealias View = DetailViewProtocol
    typealias Interactor = DetailInteractorProtocol
    typealias Presenter = DetailPresenterProtocol
    typealias Router = DetailRouterProtocol
}

extension DetailModule {
    enum DetailTableItem {
        case title(model: GamesDetailModel)
        case desc(model: GamesDetailModel)
    }
}
