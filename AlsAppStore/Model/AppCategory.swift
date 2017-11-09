//
//  AppCategory.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/8/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    
    var name: String?
    var apps: [App]?
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
            apps = [App]()
            for dict in value as! [[String: AnyObject]] {
                let app = App()
                app.setValuesForKeys(dict)
                apps?.append(app)
            }
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    // RESTful API
    static func fetchFeaturedApps(completionHandler: @escaping ([AppCategory]) -> ()) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            
            if error != nil {
                print(error!)
                return
            }
            
            do {
                var parsedData = try JSONSerialization.jsonObject(with: data!) as! [String: Any]
                
                var appCategories = [AppCategory]()
                
                for dict in parsedData["categories"] as! [[String: AnyObject]] {
                    let appCategory = AppCategory()
                    appCategory.setValuesForKeys(dict)
                    appCategories.append(appCategory)
                }
                
                DispatchQueue.main.async { () -> Void in
                    completionHandler(appCategories)
                }
                
            } catch let jsonErr {
                print("Error socializing json: %d", jsonErr)
            }
        }.resume()
    }
    
//    static func sampleAppCategories() -> [AppCategory] {
//
//        var bestNewApps = [App]()
//
//        let bestNewAppsCategory = AppCategory()
//        bestNewAppsCategory.name = "New Apps We Love"
//
//        let frozenApp = App()
//        frozenApp.name = "Disney Build It: Frozen"
//        frozenApp.imageName = "frozen"
//        frozenApp.category = "Entertainment"
//        frozenApp.price = NSNumber(value: 3.99)
//
//        bestNewApps.append(frozenApp)
//
//        bestNewAppsCategory.apps = bestNewApps
//
//
//        let bestNewGamesCategory = App()
//        bestNewGamesCategory.name = "New Games We Love"
//
//        var bestNewGameApps = [App]()
//
//        let pokematchApp = App()
//        pokematchApp.name = "PokéMatch: A Memory Game"
//        pokematchApp.imageName = "pokematch"
//        pokematchApp.category = "Games"
//
//        bestNewGameApps.append(pokematchApp)
//
//        let flowerApp = App()
//        flowerApp.name = "Flower"
//        flowerApp.imageName = "flower"
//        flowerApp.category = "Games"
//        flowerApp.price = NSNumber(value: 4.99)
//
//        bestNewGameApps.append(flowerApp)
//
//        let middleEarthApp = App()
//        middleEarthApp.name = "Middle-Earth: Shadow of War"
//        middleEarthApp.imageName = "middle_earth"
//        middleEarthApp.category = "Games"
//
//        bestNewGameApps.append(middleEarthApp)
//
//        bestNewGamesCategory.apps = bestNewGameApps
//
//        return [bestNewAppsCategory, bestNewGamesCategory]
//    }
}

class App: NSObject {

    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
}

