//
//  BookContentView.swift
//  Book-SwiftUI
//
//  Created by Alan Liu on 2023/04/07.
//

import SwiftUI

struct BookContentView: View {
    
    @EnvironmentObject var model: BookModel
    @State private var currentIndex = 0
    
    var book: Book
    
    var body: some View {
        TabView(selection: $currentIndex) {
            
            ForEach(book.content.indices, id: \.self) { index in
                
                VStack {
                    ScrollView {
                        Text(book.content[index])
                    }
                    
                    Spacer()
                    
                    Text(String(index + 1))
                }
                .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onAppear { currentIndex = book.currentPage ?? 0 }
        .onChange(of: currentIndex) { value in
            model.recordCurrentPage(forId: book.id, currentPage: value)
        }
    }
}

struct BookContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookContentView(book: Book())
            .environmentObject(BookModel())
    }
}
