//
//  MainInteractor.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import Foundation

protocol MainInteractorProtocol {
    var presenter: MainModule.Presenter? { get set }
    
    func fetchGames()
}

final class MainInteractor: MainInteractorProtocol {
    var presenter: MainModule.Presenter?
    
    private var serviceManager: Networkable
    
    init(serviceManager: Networkable) {
        self.serviceManager = serviceManager
    }
    
    func fetchGames() {
        let mainEndpoint: MainEndpoint = .games
        serviceManager.fetchDataArray(endpoint: mainEndpoint, parameters: []) { (result: Result<[GamesResponseModelElement], Error>) in
            switch result {
            case .success(let success):
                print("Foo Success: \(success)")
                self.presenter?.didFetchGames(with: success)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
