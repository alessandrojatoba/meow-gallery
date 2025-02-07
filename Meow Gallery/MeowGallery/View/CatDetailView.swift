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
        let breed = cat.breeds?.first
        
        ScrollView {
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

                if breed != nil {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("\(breed!.description)")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text("Origin: \(breed!.origin)")
                            .font(.body)

                        Text("Temperament: \(breed!.temperament)")
                            .font(.body)

                        Text("Weight: \(breed!.weight.metric) kg (\(breed!.weight.imperial) lbs)")
                            .font(.body)
                        
                        SectionTitle(title: "Ratings")
                        
                        RatingRow(label: "💉 Health Issues", rating: breed!.healthIssues)
                        RatingRow(label: "🧼 Shedding Level", rating: breed!.sheddingLevel)
                        RatingRow(label: "🤝 Social Needs", rating: breed!.socialNeeds)
                        RatingRow(label: "📢 Vocalisation", rating: breed!.vocalisation)
                        RatingRow(label: "🛁 Grooming Needs", rating: breed!.grooming)

                        RatingRow(label: "🧸 Child Friendly", rating: breed!.childFriendly)
                        RatingRow(label: "🐶 Dog Friendly", rating: breed!.dogFriendly)
                        
                        if  breed!.catFriendly != nil {
                            RatingRow(label: "🐾 Cat Friendly", rating: breed!.catFriendly!)
                        }
                        
                        RatingRow(label: "👽 Stranger Friendly", rating: breed!.strangerFriendly)

                        RatingRow(label: "🧠 Intelligence", rating: breed!.intelligence)
                        RatingRow(label: "🎯 Adaptability", rating: breed!.adaptability)
                        if breed!.bidability != nil {
                            RatingRow(label: "🎓 Bidability", rating: breed!.bidability!)
                        }
                        
                        SectionTitle(title: "Traits")
                        BinaryInfoRow(label: "🏡 Indoor", isTrue: breed!.indoor)
                        if breed!.lap != nil {
                            BinaryInfoRow(label: "🛋️ Lap Cat", isTrue: breed!.lap!)

                        }
                        BinaryInfoRow(label: "🔬 Experimental", isTrue: breed!.experimental)
                        BinaryInfoRow(label: "🌿 Natural Breed", isTrue: breed!.natural)
                        BinaryInfoRow(label: "🦄 Rare", isTrue: breed!.rare)
                        BinaryInfoRow(label: "🌀 Rex Fur", isTrue: breed!.rex)
                        BinaryInfoRow(label: "🐈‍⬛ Suppressed Tail", isTrue: breed!.suppressedTail)
                        BinaryInfoRow(label: "🦲 Hairless", isTrue: breed!.hairless)
                        BinaryInfoRow(label: "🦵 Short Legs", isTrue: breed!.shortLegs)
                        BinaryInfoRow(label: "🤧 Hypoallergenic", isTrue: breed!.hypoallergenic)
                        
                        HStack {
                            Text("🔗 More Info:")
                                .font(.headline)
                            Spacer()
                            if let wikiURL = breed!.wikipediaURL {
                                Link("Wikipedia", destination: URL(string: wikiURL)!)
                            }
                            if let vetstreetURL = breed!.vetstreetURL {
                                Link("Vetstreet", destination: URL(string: vetstreetURL)!)
                            }
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
        }
        .navigationTitle(breed != nil ? breed!.name : "Cat Details")
        .accessibilityIdentifier("cat-detail")
    }
}

struct RatingRow: View {
    let label: String
    let rating: Int

    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
            Spacer()
            HStack {
                ForEach(0..<rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

struct InfoRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
}

struct BinaryInfoRow: View {
    let label: String
    let isTrue: Int

    var body: some View {
        InfoRow(label: label, value: isTrue == 1 ? "✅ Yes" : "❌ No")
    }
}

struct SectionTitle: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .padding(.top, 10)
    }
}
