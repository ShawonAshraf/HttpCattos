//
//  CattoNetworking.swift
//  HTTPCattos
//
//  Created by Shawon Ashraf on 7/6/19.
//  Copyright © 2019 Shawon Ashraf. All rights reserved.
//

import Foundation

class CattoNetworking {
    private let rootURLString = "https://http.cat/"
    private var cattos: Cattos
    
    init() {
        self.cattos = Cattos()
    }
    
    // returns a completion handler with data
    public func getACattoAsap(completionHandler: @escaping (_ catto: Data?) -> ()) {
        let session = URLSession.shared
        let cattoToGet = cattos.getRandomCatto()
        let url = URL(string: "\(rootURLString)\(cattoToGet)")
        
        let cattoTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error getting the catto! 😢")
                completionHandler(nil)
            } else {
                completionHandler(data)
            }
        }
        
        cattoTask.resume()
    }
}
