//
//  BookListView.swift
//  Book-SwiftUI
//
//  Created by Alan Liu on 2023/04/07.
//

import SwiftUI

struct BookListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}