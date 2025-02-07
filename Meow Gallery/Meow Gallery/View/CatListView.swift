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
                    ProgressView("Loading cats...")
                        .accessibilityIdentifier("loading")
                        .padding()
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
                                        if let breedName = cat.breeds?.first?.name {
                                            Text(breedName)
                                                .font(.headline)
                                        } else {
                                            Text("No breed info")
                                                .font(.headline)
                                        }
                                        
                                        Text("Cat ID: \(cat.id)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            
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
                                    .accessibilityIdentifier("loading-more")
                                Spacer()
                            }
                            .onAppear {
                                viewModel.fetchCats()
                            }
                        }
                    }
                    .accessibilityIdentifier("cat-list")
                }
            }
            .navigationTitle("Meow Gallery")
            .toolbar {
                Button(action: { viewModel.fetchCats(reset: true) }) {
                    Image(systemName: "arrow.clockwise")
                }
            }
            .onAppear {
                viewModel.fetchCats(reset: true)
            }
        }
    }
}
