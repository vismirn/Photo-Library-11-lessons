//
//  SearchPhotoResults.swift
//  Photo Library
//
//  Created by Viktor Smirnov on 03.06.2020.
//  Copyright © 2020 Viktor Smirnov. All rights reserved.
//

import Foundation

struct SearchPhotoResults: Decodable {
    var total: Int
    var results: [Photo]
}

struct Photo: Decodable {
    var width: Int
    var height: Int
    var urls: [urlKind.RawValue]
    
    enum urlKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
    
    



}

    

