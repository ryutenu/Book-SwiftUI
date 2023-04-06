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
        .padding([.leading, .trailing], 20)
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookPreview(book: model.books[0])
    }
}
