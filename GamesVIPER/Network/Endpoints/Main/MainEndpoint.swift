//
//  MainEndpoint.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import Foundation

enum MainEndpoint: Endpointable {
    case games
    case game
    var baseUrl: String {
        return "https://www.mmobomb.com/api1/"
    }
    
    var fullPath: String {
        return baseUrl + self.rawValue
    }
    
    var rawValue: String {
        switch self {
        case .games:
            return "games"
        case .game:
            return "game"
        }
    }
    
    
}
//https://www.mmobomb.com/api1/games
