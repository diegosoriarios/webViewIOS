//
//  AppDelegate.swift
//  webviewSwift
//
//  Created by diego.rios on 07/02/19.
//  Copyright © 2019 diego.rios. All rights reserved.
//

import UIKit
import PushIOManager
import UserNotifications
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        #if DEBUG
            PushIOManager.sharedInstance().setLoggingEnabled(true);
            PushIOManager.sharedInstance().setLogLevel(PIOLogLevel.info) //PIOLogLevel.warn or PIOLogLevel.error
        #else
            PushIOManager.sharedInstance().setLoggingEnabled(false)
        #endif
        
        #if DEBUG
            PushIOManager.sharedInstance()?.configType = PIOConfigType.debug
        #else
            PushIOManager.sharedInstance()?.configType = PIOConfigType.release
        #endif
        
        var apiKey: String
        var accountToken: String
        
        #if DEBUG
            apiKey = "ABEoyBU7LkVmw8eKE3t4M5UUc"
            accountToken = "ABEs2Vod4dLE-93sY1fXqlYsg"
        #else
            apiKey = "ABEpoBVsab4MiZ8iHbd2KFbMI"
            accountToken = "ABEs2Vod4dLE-93sY1fXqlYsg"
        #endif
        
        do {
            try PushIOManager.sharedInstance()?.configure(withAPIKey: apiKey, accountToken: accountToken)
            print("PushIO Configured!!")
        } catch {
            print("Unable to configure PushIO, reason: \(error.localizedDescription)")
        }
        
        PushIOManager.sharedInstance().register(forAllRemoteNotificationTypes: { (regTrackError, deviceToken) in
            if (regTrackError == nil) {
                print("Device Token: \(String(describing: deviceToken))")
                do {
                    try PushIOManager.sharedInstance()?.registerApp(completionHandler: {(regError, response) in
                        if(regError == nil) {
                            print("Registration Sucessful")
                        } else {
                            print("Unable to register, reason \(String(describing: regError))")
                        }
                    })
                } catch {
                    print("Unable to register, reason: \(error)")
                }
            }
        })
        
        PushIOManager.sharedInstance()?.didFinishLaunching(options: launchOptions)
        let deviceId = UIDevice.current.identifierForVendor?.uuidString
        PushIOManager.sharedInstance().registerUserID(deviceId)
        let userID = PushIOManager.sharedInstance().getUserID()
        print("Teste: \(String(describing: userID))")
        FirebaseApp.configure()
        incrementAppRuns()
        return true
    }
    
    // didRegisterForRemoteNotificationsWithDeviceToken
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        PushIOManager.sharedInstance().didRegisterForRemoteNotifications(withDeviceToken: deviceToken)
    }
    
    // didFailToRegisterForRemoteNotificationsWithError
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        PushIOManager.sharedInstance().didFailToRegisterForRemoteNotificationsWithError(error)
    }
    
    // didReceiveRemoteNotification
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]){
        PushIOManager.sharedInstance().didReceiveRemoteNotification(userInfo)
    }
    
    // userNotificationCenter:didReceiveNotificationResponse
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        PushIOManager.sharedInstance().userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
    }
    
    // userNotificationCenter:willPresentNotification
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        PushIOManager.sharedInstance().userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
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

