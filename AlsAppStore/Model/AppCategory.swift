//
//  AppCategory.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/8/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

struct Apps: Decodable {
    let Id: Int?
    var Name: String?
    var Category: String?
    var ImageName: String?
    var Price: Float?
    
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
    var type: String?
    
//    func setValue(value: AnyObject?, forKey key: String) {
//        if key == "apps" {
//            apps = [App]()
//            for dict in value as! [[String: AnyObject]] {
//                let app = App()
//                app.setValuesForKeys(dict)
//                apps?.append(app)
//            }
//        } else {
//            super.setValue(value, forKey: key)
//        }
//    }
    
    // RESTful API
    static func fetchFeaturedApps(_ completionHandler: @escaping (FeaturedApps) -> ()) {
        
        //Implementing URLSession
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data else { return }

            if let error = error {
                print(error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let featuredApps = try decoder.decode(FeaturedApps.self, from: data)
                print("SUCCESS: \(featuredApps)")

                DispatchQueue.main.async(execute: { () -> Void in
                    completionHandler(featuredApps)
                })

            } catch let jsonError {
                print("Error socializing json: ", jsonError)
            }
            
        }).resume()
    }
}

extension AppCategory {
    
    static func sampleAppCategories() -> [AppCategory] {

        var bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "New Apps We Love"
        
        var apps = [App]()

        let frozenApp = App()
        frozenApp.name = "Disney Build It: Frozen"
        frozenApp.imageName = "frozen"
        frozenApp.category = "Entertainment"
        frozenApp.price = NSNumber(value: 3.99)

        apps.append(frozenApp)

        bestNewAppsCategory.apps = apps


        var bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "New Games We Love"

        var bestNewGameApps = [App]()

        let pokematchApp = App()
        pokematchApp.name = "PokéMatch: A Memory Game"
        pokematchApp.imageName = "pokematch"
        pokematchApp.category = "Games"

        bestNewGameApps.append(pokematchApp)

        let flowerApp = App()
        flowerApp.name = "Flower"
        flowerApp.imageName = "flower"
        flowerApp.category = "Games"
        flowerApp.price = NSNumber(value: 4.99)

        bestNewGameApps.append(flowerApp)

        let middleEarthApp = App()
        middleEarthApp.name = "Middle-Earth: Shadow of War"
        middleEarthApp.imageName = "middle_earth"
        middleEarthApp.category = "Games"

        bestNewGameApps.append(middleEarthApp)

        bestNewGamesCategory.apps = bestNewGameApps

        return [bestNewAppsCategory, bestNewGamesCategory]
    }
}

class App: NSObject {
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
}

