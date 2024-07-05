//
//  BoatInfoView.swift
//  boatsaily
//
//  Created by yasin on 25.06.2024.
//

import SwiftUI
import RealmSwift

struct BoatInfoListView: View {
    @ObservedObject var viewModel: BoatInfoListViewModel
    @State private var isPresented: Bool = false
    
    @ObservedResults(BoatInformationList.self) var boatInformationList
    
    init(viewModel: BoatInfoListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            
            if self.boatInformationList.isEmpty {
                Text("No Boat List")
            }
            
            List {
                
                ForEach(self.boatInformationList, id: \.id){ boatInformationList in
                    VStack(alignment: .leading){
                        
                        if let imageData = boatInformationList.imageData, let image = UIImage(data: imageData) {
                            Image(uiImage: image )
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        Text(boatInformationList.title ?? "")
                        Text(boatInformationList.address ?? "")
                            .opacity(0.4)
                    }
                    
                }.onDelete(perform: $boatInformationList.remove)
            }

        }
    }
}

#Preview {
    BoatInfoListView(viewModel: BoatInfoListViewModel())
}
