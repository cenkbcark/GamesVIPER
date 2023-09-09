//
//  MainRouter.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import UIKit

protocol MainRouterProtocol {
    func navigateToDetail(with id: Int?)
}

final class MainRouter: MainRouterProtocol {
    weak var presenterVC: UIViewController?
    
    func navigateToDetail(with id: Int?) {
        //
        guard let id = id else { return }
        let detailVC = DetailBuilder.build(with: id)
        UIApplication.topViewController()?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
