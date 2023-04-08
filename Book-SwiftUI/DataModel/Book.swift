//
//  Book.swift
//  Book-SwiftUI
//
//  Created by Alan Liu on 2023/04/07.
//

import Foundation

struct Book: Identifiable, Decodable {
    var id: Int?
    var title: String?
    var author: String?
    var isFavourite: Bool?
    var currentPage: Int?
    var rating: Int?
    var content = [String]()
    
    func getImageName() -> String {
        return (isFavourite == true) ? "star.fill" : "star"
    }
}
