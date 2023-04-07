//
//  BookListView.swift
//  Book-SwiftUI
//
//  Created by Alan Liu on 2023/04/07.
//

import SwiftUI

struct BookListView: View {
    
    @EnvironmentObject var model: BookModel
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 50) {
                    ForEach(model.books) { book in
                        
                        NavigationLink {
                            BookDetailView(book: book)
                        } label: {
                            BookPreview(book: book)
                                .foregroundColor(.black)
                                .padding([.leading, .trailing], 20)
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("My Library")
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(BookModel())
    }
}
