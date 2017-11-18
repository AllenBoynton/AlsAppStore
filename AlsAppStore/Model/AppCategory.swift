//
//  AppCategory.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/8/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import Foundation

struct App: Decodable {
    let Id: Int?
    var Name: String?
    var Category: String?
    var ImageName: String?
    var Price: Double?
    
    var Screenshots: [String]?
    var description: String?
    var appInformation: [AppInformation]?
}

struct AppInformation: Decodable {
    let Name: String
    let Value: String
}

struct FeaturedApps: Decodable {
    var bannerCategory: AppCategory?
    var categories: [AppCategory]?
}

struct AppCategory: Decodable {
    
    var name: String?
    var apps: [App]?
    
    // RESTful API
    static func fetchFeaturedApps(_ completionHandler: @escaping (FeaturedApps) -> ()) {
        
        //Implementing URLSession
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            
            guard let data = data else { return }

            if let error = error {
                print(error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let featuredApps = try decoder.decode(FeaturedApps.self, from: data)
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(featuredApps)
                })

            } catch let jsonError {
                print("Error socializing json: ", jsonError)
            }
            
        }.resume()
    }
}
