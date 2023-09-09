//
//  MainBuilder.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import UIKit

final class MainBuilder {
    
    private init() { }
    
    static func build() -> UIViewController {
        let nibName = String(describing: MainViewController.self)
        let mainServiceManager = AlamofireServiceManager()
        
        let view = MainViewController(nibName: nibName, bundle: .main)
        let interactor = MainInteractor(serviceManager: mainServiceManager)
        let presenter = MainPresenter()
        let router = MainRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        router.presenterVC = view
        return view
    }
}
