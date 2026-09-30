//
//  PlaceholderView.swift
//  lane college
//
//  Created by brian kim on 9/16/26.
//

import Foundation
import SwiftUI

struct PlaceholderView: View {

    let title: String
    let icon: String

    var body: some View {

        VStack(spacing: 20) {

            Image(systemName: icon)
                .font(.system(size: 65))
                .foregroundStyle(.purple)

            Text(title)
                .font(.largeTitle.bold())

            Text("We're building something awesome here.")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Text("Coming Soon 🚀")
                .font(.headline)
                .padding()
                .background(.purple.opacity(0.15))
                .clipShape(Capsule())
        }
        .padding()
        .navigationTitle(title)
    }
}
