//
//  HomePageView.swift
//  boatsaily
//
//  Created by yasin on 24.06.2024.
//

import SwiftUI

struct HomePageView: View {
    
    public var coordinator: HomePageCoordinator?
    
    init(coordinator: HomePageCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        Text("Hello, World! Home PAge")
    }
}

#Preview {
    HomePageView()
}
