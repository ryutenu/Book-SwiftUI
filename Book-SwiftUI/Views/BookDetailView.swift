//
//  BookDetailView.swift
//  Book-SwiftUI
//
//  Created by Alan Liu on 2023/04/07.
//

import SwiftUI

struct BookDetailView: View {
    
    @EnvironmentObject var model: BookModel
    @State private var rating = 3
    
    var book: Book
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Read Now!")
                .font(.title)
            
            NavigationLink {
                BookContentView(book: book)
            } label: {
                Image("cover" + String(book.id ?? 0))
                    .resizable()
                    .scaledToFit()
            }
            
            Text("Mark for later!")
                .font(.headline)
            
            Button {
                model.updateFavourite(forId: book.id)
            } label: {
                Image(systemName: book.getImageName())
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 30, height: 30)
                    .scaledToFit()
            }
            
            Text("Rate " + (book.title ?? "this book"))
                .font(.headline)
            
            Picker("", selection: $rating) {
                ForEach(1..<6) { index in
                    Text(String(index)).tag(index)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: rating) { value in
                model.updateRating(forId: book.id, rating: value)
            }
        }
        .onAppear { rating = book.rating ?? 3 }
        .navigationBarTitle(book.title ?? "book")
        .padding([.leading, .trailing], 60)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: Book())
            .environmentObject(BookModel())
    }
}
