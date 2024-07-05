//
//  HomePageCoordinator.swift
//  boatsaily
//
//  Created by yasin on 24.06.2024.
//

import Foundation
import SwiftUI

class HomePageCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    var childCoordinator = [Coordinator]()
    
    init() {
        self.rootViewController = UINavigationController()
        self.rootViewController.navigationBar.prefersLargeTitles = true
        
    }
    
    lazy var homePageController: HomePageViewController = {
        let vc = HomePageViewController()
        vc.title = "Home Page"
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([homePageController], animated: false)
    }
}
