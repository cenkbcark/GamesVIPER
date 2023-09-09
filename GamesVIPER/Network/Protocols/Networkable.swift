//
//  Networkable.swift
//  GamesVIPER
//
//  Created by Cenk Bahadır Çark on 5.09.2023.
//

import Foundation

protocol Networkable {
    func fetchData<T: Decodable>(endpoint: Endpointable, parameters: [Parameterable]?, completion: @escaping (Result<T, Error>) -> Void)
    func fetchDataArray<T: Decodable>(endpoint: Endpointable, parameters: [Parameterable]?, completion: @escaping (Result<[T], Error>) -> Void)
}
