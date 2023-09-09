//
//  Endpointable.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import Foundation


protocol Endpointable {
    var baseUrl: String { get }
    var fullPath: String { get }
    var rawValue: String { get }
}
