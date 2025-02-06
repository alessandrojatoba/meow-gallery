//
//  CatDetailView.swift
//  Meow Gallery
//
//  Created by Alessandro Jatoba on 06/02/25.
//

import SwiftUI

import SwiftUI

struct CatDetailView: View {
    let cat: Cat

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: cat.url)) { phase in
                switch phase {
                case .empty:
                    // Show a spinner while the image is loading
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .frame(height: 400)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 400)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                case .failure:
                    // Fallback if image fails to load
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                        .frame(height: 400)
                @unknown default:
                    EmptyView()
                }
            }

            if let breed = cat.breeds?.first {
                VStack(alignment: .leading, spacing: 10) {
                    Text(breed.name)
                        .font(.title)
                        .bold()
                    
                    Text("\(breed.description)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("🌍 Origin: \(breed.origin)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text("🧬 Temperament: \(breed.temperament)")
                        .font(.body)

                    Text("📏 Weight: \(breed.weight.metric) kg (\(breed.weight.imperial) lbs)")
                        .font(.body)

                    Text("❤️ Affection Level: \(breed.affectionLevel)/5")
                        .font(.body)

                    Text("🐶 Dog Friendly: \(breed.dogFriendly)/5")
                        .font(.body)

                    Text("🎢 Energy Level: \(breed.energyLevel)/5")
                        .font(.body)

                    if let wikiURL = breed.wikipediaURL {
                        Link("🌐 Wikipedia", destination: URL(string: wikiURL)!)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            } else {
                Text("No breed information available")
                    .font(.headline)
                    .padding()
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Cat Details")
    }
}
