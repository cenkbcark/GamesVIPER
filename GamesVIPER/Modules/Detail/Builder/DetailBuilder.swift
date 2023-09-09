//
//  DetailBuilder.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 7.09.2023.
//

import UIKit

final class DetailBuilder {
    
    private init() { }
    
    static func build(with id: Int) -> UIViewController {
        let nibName = String(describing: DetailViewController.self)
        let detailServiceManager = AlamofireServiceManager()
        let view = DetailViewController(nibName: nibName, bundle: .main)
        let interactor = DetailInteractor(serviceManager: detailServiceManager)
        let presenter = DetailPresenter(id: id)
        let router = DetailRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        //router.presenterVC = view
        return view
    }
}
