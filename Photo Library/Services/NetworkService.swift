//
//  NetworkService.swift
//  Photo Library
//
//  Created by Viktor Smirnov on 03.06.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import Foundation

class NetworkService {
    func request(searchText: String, completion: @escaping (Data?, Error?) -> Void) {
        
        // 1. Настройка параметра
        var dictionary = [String:String]()
        dictionary["query"] = searchText
        dictionary["per_page"] = "50"
        
        // 2. Настраиваем URL
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = dictionary.map({ (key, value) in
            URLQueryItem.init(name: key, value: value)
        })
        
    
        // 3. Собираем Request
        
        var request = URLRequest(url: components.url!)
        
        request.allHTTPHeaderFields = ["Authorization" : "Client-ID QqE4y2ESDyrwgdXMpxqmzqa7TiZKLol1i7zv8WZqDKA"]
        request.httpMethod = "GET"
        
        // 4. Делаем сетевой запрос чере URLSession
        URLSession.shared.dataTask(with: request) { (myData, _, myError) in
            DispatchQueue.main.async {
                if let myError = myError {
                    completion(nil, myError)
                } else {
                    completion(myData, nil)
                }
            }
        }.resume()
                
    }
    
}
