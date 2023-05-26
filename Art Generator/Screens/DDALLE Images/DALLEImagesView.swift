//
//  ContentView.swift
//  Art Generator
//
//  Created by Salima O. on 16/05/2023.
//

import SwiftUI

struct DALLEImagesView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                if !vm.urls.isEmpty {
                    ViewThatFits {
                        PreviewImage(vm: vm)
                            .padding()
                        ScrollView(.horizontal) {
                            PreviewImage(vm: vm)
                                .padding()
                        }
                    }
                }
                if !vm.fetching {
                    if !vm.urls.isEmpty {
                        Text("Select an image")
                    }
                    if let selectedImage = vm.selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 256, height: 256)
                    }
                    if vm.urls.isEmpty {
                        Text("Ce que vous proposez : ")
                            .padding(.trailing, 200.0)
                            
                        
                        
                        TextField("Description de votre entreprise...",
                                  text: $vm.prompt)
                        .showClearButton($vm.prompt)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        
                        
                        Text("Votre marque s'appelle")
                        
                        TextField("Nom de votre marque...",
                                  text: $vm.name)
                        .showClearButton($vm.name)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        
                        
                        Form {
                            Picker("Couleur", selection: $vm.imageStyle) {
                                ForEach(ImageStyle.allCases, id: \.self) { imageStyle in
                                    Text(imageStyle.rawValue)
                                    
                                }
                            }
                        
                        
                        
                            Picker("Tendance", selection: $vm.imageMedium) {
                                ForEach(ImageMedium.allCases, id: \.self) { imageMedium in
                                    Text(imageMedium.rawValue)
                                    
                                }
                            }
                        
                        
                        
                            Picker("Type", selection: $vm.artist) {
                                ForEach(Artist.allCases, id: \.self) { artist in
                                    Text(artist.rawValue)
                                    
                                }
                            }
                            
                            Picker("Style", selection: $vm.style) {
                                ForEach(Style.allCases, id: \.self) { style in
                                    Text(style.rawValue)
                                }
                            }
                       
                        
                        
                        HStack {
                            Spacer()
                            Button("Fetch") {
                                vm.fetchImages()
                            }
                            .disabled(vm.prompt.isEmpty)
                            .buttonStyle(.borderedProminent)
                        }
                        
                        HStack {
                            Spacer()
                            if vm.urls.isEmpty || vm.selectedImage == nil {
                                Image("Artist")
                            }
                            Spacer()
                            }
                        }
                
                    } else {
                        Text(vm.description)
                            .padding()
                        
                        HStack {
                            if vm.selectedImage != nil {
                                Button("Get Variation") {
                                    vm.fetchVariations()
                                }
                            }
                            Button("Try another") {
                                vm.reset()
                            }
                            
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    Spacer()
                    FetchingView()
                    Spacer()
                }
                if vm.selectedImage == nil && !vm.urls.isEmpty {
                    Image("Artist")
                }
                Spacer()
            }
            .navigationTitle("Créez votre logo")
            .edgesIgnoringSafeArea(.bottom)
            .toolbar {
                if let selectedImage = vm.selectedImage {
                    ToolbarItem {
                        ShareLink(item: Image(uiImage: selectedImage),
                                  subject: Text("Generated Image"),
                                  message: Text(vm.description),
                                  preview: SharePreview(Text("Generated Image"),
                                                        image: Image(uiImage: selectedImage)))
                    }
                }
            }
            .alert("Processing error", isPresented: $vm.showAlert) {
                Button("OK") {}
            } message: {
                Text("Unable to process this request. Your image descprition cannot be interpreted")
                    
                
            }
        }
    }
}

struct PreviewImage: View {
    
    @ObservedObject var vm: ViewModel
    @Environment(\.horizontalSizeClass) var hsc
    
    var body: some View {
        
        HStack {
            ForEach(vm.dallEImages) { dalleImage in
                if let uiImage = dalleImage.uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: hsc == .compact ? 80 : 120,
                               height: hsc == .compact ? 80 : 120)
                        .onTapGesture {
                            vm.selectedImage = uiImage
                        }
                } else {
                    ProgressView()
                        .frame(width: hsc == .compact ? 80 : 120,
                               height: hsc == .compact ? 80 : 120)

                }
                
            }
        }
    }
    
}

struct DALLEImagesView_Previews: PreviewProvider {
    static var previews: some View {
        DALLEImagesView()
    }
}
