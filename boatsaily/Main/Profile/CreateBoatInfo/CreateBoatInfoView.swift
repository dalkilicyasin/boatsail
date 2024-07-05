//
//  CreateBoatInfoView.swift
//  boatsaily
//
//  Created by yasin on 26.06.2024.
//

import SwiftUI
import RealmSwift
import SwiftUI
import PhotosUI

struct CreateBoatInfoView: View {
    
    @ObservedObject var viewModel: CreateBoatInfoViewModel
    @ObservedResults(BoatInformationList.self) var boatInformationList
    
    @State var selectedPhoto: PhotosPickerItem?
    @State var selectedPhotoData: Data?
    
    @Environment(\.dismiss) private var dismiss
                                        
    init(viewModel: CreateBoatInfoViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Enter Title", text: $viewModel.title)
                TextField("Enter Address", text: $viewModel.adress)
            }.frame(height: 200)
            
            Form {
                if let selectedPhotoData, let uiImage = UIImage(data: selectedPhotoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                }
                
                PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                    Label("Add Image", systemImage: "photo")
                }
                
                if selectedPhotoData != nil {
                    Button(role: .destructive, action: {
                        withAnimation {
                            selectedPhoto = nil
                            selectedPhotoData = nil
                        }
                    }, label: {
                        Label("Remove Image", systemImage: "xmark")
                            .foregroundStyle(.red)
                    })
                }
            }.frame(height: viewModel.imageHeight)
            
            Button(action: {
                
                let boatInformationList = BoatInformationList()
                boatInformationList.title = viewModel.title
                boatInformationList.address = viewModel.adress
                if let selectedPhotoData {
                    boatInformationList.imageData = selectedPhotoData
                }
               
                $boatInformationList.append(boatInformationList)
                
                dismiss()
            }, label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            }).buttonStyle(.bordered)
                .padding()
    
            Spacer()
            
        }.task(id: selectedPhoto) {
            if let data = try? await selectedPhoto?.loadTransferable(type: Data.self) {
                selectedPhotoData = data
                viewModel.imageHeight = 400
            }else {
                viewModel.imageHeight = 100
            }
            
        }
        .background(Color(uiColor: .systemGray6))
    }
}

#Preview {
    CreateBoatInfoView(viewModel: CreateBoatInfoViewModel())
}
