//
//  DetailInteractor.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 7.09.2023.
//

import Foundation

protocol DetailInteractorProtocol {
    var presenter: DetailModule.Presenter? { get set }
    
    func fethGameDetail(with id: Int?)
}

final class DetailInteractor: DetailInteractorProtocol {
    
    var presenter: DetailModule.Presenter?
    
    private var serviceManager: Networkable
    
    init(serviceManager: Networkable) {
        self.serviceManager = serviceManager
    }
    
    func fethGameDetail(with id: Int?) {
        let mainEndPoint: MainEndpoint = .game
        let parameters: MainParameter = .id(String(id ?? 0))
        serviceManager.fetchData(endpoint: mainEndPoint, parameters: [parameters]) { (result: Result<GamesDetailModel, Error>) in
            switch result {
            case .success(let detail):
                self.presenter?.didFetchGameDetail(with: detail)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
