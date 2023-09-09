//
//  MainParameter.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import Foundation

enum MainParameter: Parameterable {
    case id(String)
    
    var queryItem: URLQueryItem {
        switch self {
        case .id(let id):
            return URLQueryItem(name: "id", value: id)
        }
    }
}
