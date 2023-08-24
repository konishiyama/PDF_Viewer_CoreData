//
//  Book+CoreDataProperties.swift
//  PDF_Viewer_CoreData
//
//  Created by KO NISHIYAMA on 2023/08/25.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var coverImageURL: URL?
    @NSManaged public var createdAt: Date?
    @NSManaged public var title: String?
    @NSManaged public var url: URL?

}

extension Book : Identifiable {

}
