//
//  ApplicationCoordinator.swift
//  boatsaily
//
//  Created by yasin on 24.06.2024.
//

import Foundation
import UIKit
import SwiftUI

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    var childCoordinators = [Coordinator]()

    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let mainPageCoordinator = MainPageCoordinator()
        mainPageCoordinator.start()
        self.childCoordinators = [mainPageCoordinator]
        self.window.rootViewController = mainPageCoordinator.rootViewController
    }
}
