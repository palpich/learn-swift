// Project 06: screen solution — paste into ContentView.swift of an Xcode App project
import SwiftUI
import PostsCore

struct ContentView: View {
    @State private var posts: [Post] = []
    @State private var query = ""
    @State private var favorites = loadFavorites(from: .standard)
    @State private var errorText: String?

    private var visiblePosts: [Post] {
        search(posts, for: query)
    }

    var body: some View {
        NavigationStack {
            List(visiblePosts) { post in
                HStack {
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                    }
                    Spacer()
                    Button {
                        favorites.toggle(post.id)
                        saveFavorites(favorites, to: .standard)
                    } label: {
                        Image(systemName: favorites.contains(post.id) ? "star.fill" : "star")
                    }
                    .buttonStyle(.borderless)
                }
            }
            .overlay {
                if let errorText {
                    Text(errorText)
                        .foregroundStyle(.red)
                        .padding()
                }
            }
            .navigationTitle("Posts")
            .searchable(text: $query)
            .task {
                do {
                    posts = try await fetchPosts(limit: 20)
                } catch {
                    errorText = "Не удалось загрузить посты: \(error)"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
