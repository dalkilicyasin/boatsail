//
//  SceneDelegate.swift
//  boatsaily
//
//  Created by yasin on 24.06.2024.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationCoordinator: ApplicationCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let _ = UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
      
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationCoordinator = ApplicationCoordinator(window: window)
            applicationCoordinator.start()
            
            self.applicationCoordinator = applicationCoordinator
            window.makeKeyAndVisible()
        }
    }

}

