//
//  Cattos.swift
//  HTTPCattos
//
//  Created by Shawon Ashraf on 7/6/19.
//  Copyright © 2019 Shawon Ashraf. All rights reserved.
//

import Foundation

class Cattos {
    private var codes: [Int] = [
        100, 101, 200, 201, 202, 204, 206, 207, 300, 301, 302,
        303, 304, 305, 307, 400, 401, 402, 403, 404, 405, 406,
        407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417,
        418, 420, 421, 422, 423, 424, 425, 426, 429, 431, 444,
        450, 451, 500, 502, 503, 504, 506, 507, 508, 509, 510,
        511, 599
    ]
    
    private let imageExtension = ".jpg"
    
    public func getRandomCatto() -> String {
        guard let randomCode = codes.randomElement() else {
            return "\(codes[0])\(imageExtension)"
        }
        return "\(randomCode)\(imageExtension)"
    }
}
