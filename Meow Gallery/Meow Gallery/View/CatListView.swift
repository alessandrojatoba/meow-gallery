//
//  CatListView.swift
//  Meow Gallery
//
//  Created by Alessandro Jatoba on 06/02/25.
//

import SwiftUI

struct CatListView: View {
    @StateObject var viewModel = CatViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading cats...").padding()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.cats) { cat in
                            NavigationLink(destination: CatDetailView(cat: cat)) {
                                HStack {
                                    AsyncImage(url: URL(string: cat.url)) { phase in
                                        
                                        switch phase {
                                        case .empty:
                                            // Show a spinner while the image is loading
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                
                                        case .failure:
                                            // Fallback if image fails to load
                                            Image(systemName: "exclamationmark.triangle.fill")
                                                .foregroundColor(.red)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    

                                    VStack(alignment: .leading) {
                                        Text("Cat ID: \(cat.id)")
                                            .font(.headline)
                                            
                                        
                                        
                                        if let breedName = cat.breeds?.first?.name {
                                            Text(breedName)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        } else {
                                            Text("No breed info")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding(.leading, 10)
                                    
                                }
                                .padding(5)
                            }
                        }

                        // Pagination trigger
                        if !viewModel.isLoading {
                            HStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                            .onAppear {
                                viewModel.fetchCats()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Meow Gallery")
            .toolbar {
                Button(action: { viewModel.fetchCats(reset: true) }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
    }
}
