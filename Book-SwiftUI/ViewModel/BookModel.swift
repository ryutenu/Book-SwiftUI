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
}
