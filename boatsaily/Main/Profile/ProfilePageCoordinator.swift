//
//  ProfilePageCoordinator.swift
//  boatsaily
//
//  Created by yasin on 25.06.2024.
//

import Foundation
import UIKit
import SwiftUI

class ProfilePageCoordinator: Coordinator {
    var rootViewController = UINavigationController()
    
   // let viewModel = BoatInfoListViewModel()
    
    init() {
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
    }
    
    lazy var profilePageController: ProfilePageViewController = {
        let vc = ProfilePageViewController()
       // vc.viewModel = viewModel
        vc.showProfileDetail = { [weak self] in
            self?.goProfileDetail()
        }
        vc.showCreateList = { [weak self] in
            self?.goCreateList()
        }
        vc.title = "Profile Page"
        return vc
    }()
    
    
    
    func start() {
      
        self.rootViewController.setViewControllers([profilePageController], animated: false)
    }
    
    func goProfileDetail() {
        let detailVc = UIHostingController(rootView: BoatInfoListView(viewModel: BoatInfoListViewModel()))
        rootViewController.pushViewController(detailVc, animated: true)
    }
    
    func goCreateList() {
        let detailVc = UIHostingController(rootView: CreateBoatInfoView(viewModel: CreateBoatInfoViewModel()))
        rootViewController.present(detailVc, animated: true)
    }
}
