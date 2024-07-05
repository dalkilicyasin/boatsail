//
//  MainPageCoordinator.swift
//  boatsaily
//
//  Created by yasin on 24.06.2024.
//

import Foundation
import UIKit

class MainPageCoordinator: Coordinator {
    
    var rootViewController: UITabBarController
    var childCoordinator = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.isTranslucent = true
        rootViewController.tabBar.backgroundColor = .systemGray5
        
    }
  
    func start() {
        //Home Page setup
        let homePageCoordinator = HomePageCoordinator()
        homePageCoordinator.start()
        self.childCoordinator.append(homePageCoordinator)
        let homePageController = homePageCoordinator.rootViewController
        self.setup(vc: homePageController, title: "Home", imageName: "house", selectedImageName: "house.fill")
        
        //Profile Page setup
        let profilePageCoordinator = ProfilePageCoordinator()
        profilePageCoordinator.start()
        self.childCoordinator.append(profilePageCoordinator)
        let profilePageController = profilePageCoordinator.rootViewController
      
        self.setup(vc: profilePageController, title: "Profile", imageName: "person", selectedImageName: "person.fill")
        
        
        
        self.rootViewController.viewControllers = [homePageController, profilePageController]
        
        
    
    }
    
    func setup(vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}
