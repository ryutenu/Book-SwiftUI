//
//  BookPreview.swift
//  Book-SwiftUI
//
//  Created by Alan Liu on 2023/04/07.
//

import SwiftUI

struct BookPreview: View {
    
    var book: Book
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 10, x: -5, y: 5)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(book.title ?? "")
                        .bold()
                        .font(.title)
                    
                    Spacer()
                    
                    Image(systemName: book.getImageName())
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                }
                
                Text(book.author ?? "")
                
                Image("cover" + String(book.id ?? 0))
                    .resizable()
                    .scaledToFit()
            }
            .padding(25)
        }
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookPreview(book: model.books[0])
    }
}
