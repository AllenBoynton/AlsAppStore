//
//  CustomAppCategory.swift
//  AlsAppStore
//
//  Created by Allen Boynton on 11/9/17.
//  Copyright © 2017 Allen Boynton. All rights reserved.
//

import Foundation

class CustomAppCategory: NSObject {
    
    var name: String?
    var hardCodedApps: [HardCodedApp]?
    
    // Data for hardcoded apps
    static func sampleAppCategories() -> [CustomAppCategory] {
        
        let bestNewAppsCategory = CustomAppCategory()
        bestNewAppsCategory.name = "New Apps We Love"
        
        var hardCodedApps = [HardCodedApp]()
        
        let frozenApp = HardCodedApp()
        frozenApp.name = "Disney Build It: Frozen"
        frozenApp.imageName = "frozen"
        frozenApp.category = "Entertainment"
        frozenApp.price = NSNumber(value: 3.99)

        hardCodedApps.append(frozenApp)
        
        bestNewAppsCategory.hardCodedApps = hardCodedApps
        
        
        let bestNewGamesCategory = CustomAppCategory()
        bestNewGamesCategory.name = "New Games We Love"
        
        var bestNewGameApps = [HardCodedApp]()
        
        let pokematchApp = HardCodedApp()
        pokematchApp.name = "PokéMatch: A Memory Game"
        pokematchApp.imageName = "pokematch"
        pokematchApp.category = "Games"
        
        bestNewGameApps.append(pokematchApp)
        
        let flowerApp = HardCodedApp()
        flowerApp.name = "Flower"
        flowerApp.imageName = "flower"
        flowerApp.category = "Games"
        flowerApp.price = NSNumber(value: 4.99)
        
        bestNewGameApps.append(flowerApp)
        
        let middleEarthApp = HardCodedApp()
        middleEarthApp.name = "Middle-Earth: Shadow of War"
        middleEarthApp.imageName = "middle_earth"
        middleEarthApp.category = "Games"
        
        bestNewGameApps.append(middleEarthApp)
        
        bestNewGamesCategory.hardCodedApps = bestNewGameApps
        
        return [bestNewAppsCategory, bestNewGamesCategory]
    }
}

class HardCodedApp: NSObject {
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
}
