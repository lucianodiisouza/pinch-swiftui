//
//  PageModel.swift
//  Pinch
//
//  Created by Luciano dii Souza on 25/04/23.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
