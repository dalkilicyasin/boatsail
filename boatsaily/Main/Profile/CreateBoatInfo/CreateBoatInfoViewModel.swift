//
//  CreateBoatInfoViewModel.swift
//  boatsaily
//
//  Created by yasin on 27.06.2024.
//

import Foundation
import RealmSwift

class CreateBoatInfoViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var adress: String = ""
    @Published var imageHeight: CGFloat = 100.0

}
