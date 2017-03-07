//
//  AppDelegate.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/13/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import UIKit

extension UIColor {
    func maroonColor() -> UIColor {
        return UIColor(red: 151 / 255, green: 5 / 255 , blue: 36 / 255, alpha: 1.0)
    }
}

extension Array  {
    var indexedDictionary: [Int: Element] {
        var result: [Int: Element] = [:]
        enumerated().forEach({ result[$0.offset] = $0.element })
        return result
    }
}

let appDelegate = UIApplication.shared.delegate as! AppDelegate

@UIApplicationMain



class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dataModel:DataModel!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Customize Navigation

        UINavigationBar.appearance().barTintColor = UIColor().maroonColor()
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName: UIFont.systemFont(ofSize: 24, weight: UIFontWeightThin)]

        // Changes the navigation bar style so that the Status bar will be white
        UINavigationBar.appearance().barStyle = .blackOpaque
        
        // Data
        
        dataModel = DataModel()
        var presentation = (dataModel["sessions"] as! Array<Dictionary<String, Any>>)
        
        print(presentation.count)
        
        var tag = 0
        
        
        
        let workshopTwo = ((presentation[1]["presentations"] as! Array<Dictionary<String,Any>>)[0]["workshops"] as! Array<Dictionary<String, Any>>)
        
        let gradeTwo = ((presentation[1]["presentations"] as! Array<Dictionary<String,Any>>)[1]["gradeLevels"] as! [Int])
               
        
        for tooItem in 0...presentation.count - 1{
            print(tooItem)
            
            let workshop = ((presentation[tooItem]["presentations"] as! Array<Dictionary<String,Any>>)[0]["workshops"] as! Array<Dictionary<String, Any>>)
            
            
            let grade = ((presentation[tooItem]["presentations"] as! Array<Dictionary<String,Any>>)[0]["gradeLevels"] as! [Int])
            print(workshopTwo)
            
            
            print(workshop)
            
            for item in 0...workshop.count - 1{
                
                print(item)
                
                tag = tag + 1
                
                dataModel.workshops.append(["Set \(tag)" : ((presentation[tooItem]["presentations"] as! Array<Dictionary<String,Any>>)[0]["workshops"] as! Array<Dictionary<String, Any>>)[item],"grade": grade])
                
                
            }

        }
        
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    


}

