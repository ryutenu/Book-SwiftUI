//
//  BookModel.swift
//  Book-SwiftUI
//
//  Created by Alan Liu on 2023/04/07.
//

import Foundation

class BookModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        books = getLocalData()
    }
    
    func getLocalData() -> [Book] {
        var books = [Book]()
        
        guard let url = Bundle.main.url(forResource: "books", withExtension: "json") else {
            print("Data not found.")
            return books
        }
        
        do {
            let data = try Data(contentsOf: url)
            books = try JSONDecoder().decode([Book].self, from: data)
            return books
        }
        catch {
            print(error)
        }
        
        return books
    }
    
    func updateFavourite(forId id: Int?) {
        if let index = books.firstIndex(where: { $0.id == id }) {
            books[index].isFavourite?.toggle()
        }
    }
    
    func updateRating(forId id: Int?, rating: Int) {
        if let index = books.firstIndex(where: { $0.id == id }) {
            books[index].rating = rating
        }
    }
    
    func recordCurrentPage(forId id: Int?, currentPage: Int) {
        if let index = books.firstIndex(where: { $0.id == id }) {
            books[index].currentPage = currentPage
        }
    }
}
