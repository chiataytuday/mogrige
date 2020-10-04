//
//  AppDelegate.swift
//  SaveRandom
//
//  Created by 장은비 on 2020/09/26.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        
        // cloudKit 설정했을 경우 바꿔야하는 코드 !!필수!! 프로젝트 처음 생성시 반드시 Core Date 체크박스 체크
        //let container = NSPersistentContainer(name: "SaveRandom")
        let container = NSPersistentContainer(name: "SaveRandom")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    /* 이거는 넣어야하는지 아닌지 모르겠습니다. sharedDate에 대한 내용 같습니다.
     
     static var manageContext: NSManageObjectContext {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        return context
     
     }
     
     그 외에도 fetch 관련 구문이 많았는데 ㅠㅠ 옵셔널한 선택지인지 아닌지 모르겠네요....
     
     
     */

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

