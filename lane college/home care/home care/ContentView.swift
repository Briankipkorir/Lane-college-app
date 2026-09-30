//
//  ContentView.swift
//  home care
//
//  Created by brian kim on 9/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [String] = [
        "Welcome to Home Care",
        "Tap to see details",
        "This build should run"
    ]

    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink(item) {
                    DetailView(text: item)
                }
            }
            .navigationTitle("Home Care")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        addItem()
                    }
                }
            }
        }
    }

    private func addItem() {
        items.append("New item #\(items.count + 1)")
    }
}

struct DetailView: View {
    let text: String

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.text.square")
                .font(.system(size: 48))
                .foregroundStyle(.tint)
            Text(text)
                .font(.title2)
                .multilineTextAlignment(.center)
            Text("Navigation is working.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding()
        .navigationTitle("Details")
    }
}

#Preview {
    ContentView()
}
