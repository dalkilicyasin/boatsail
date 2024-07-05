//
//  BoatInformationList.swift
//  boatsaily
//
//  Created by yasin on 28.06.2024.
//

import Foundation
import RealmSwift

class BoatInformationList: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String?
    @Persisted var address: String?
    @Persisted var imageData: Data?
    
    override class func primaryKey() -> String? {
        "id"
    }
}
