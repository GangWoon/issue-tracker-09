//
//  AppDelegate.swift
//  IssueTracker
//
//  Created by Cloud on 2020/06/08.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import AuthenticationServices
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard !KeychainItem.currentUserIdentifier.isEmpty,
            let rootViewController = window?.rootViewController as? LoginViewController else { return true }
        DispatchQueue.main.async {
            rootViewController.presentTabBarController()
        }
        
        return true
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IssueTracker")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

