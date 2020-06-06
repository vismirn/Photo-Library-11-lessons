//
//  NetworkDataFetcher.swift
//  Photo Library
//
//  Created by Viktor Smirnov on 06.06.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import Foundation

class NetworkDataFetcher {
    let networkService = NetworkService()
    
    func fetchPhotos(searchText: String, completion: @escaping (SearchPhotoResults?) -> Void) {
        networkService.request(searchText: searchText) { (data, error) in
            guard let data = data else { return }
            do {
                let photos = try JSONDecoder().decode(SearchPhotoResults.self, from: data)
                completion(photos)
            } catch let jsonError {
                completion(nil)
                print(jsonError.localizedDescription)
            }
        }
    }
}
