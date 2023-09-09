//
//  MainModule.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import Foundation

struct MainModule {
    typealias View = MainViewProtocol
    typealias Interactor = MainInteractorProtocol
    typealias Presenter = MainPresenterProtocol
    typealias Router = MainRouterProtocol
}
extension MainModule {
    enum MainTableItem {
        case title
        case games
    }
    enum MainCollectionItem {
        case games(model: [GamesResponseModelElement])
    }
}

