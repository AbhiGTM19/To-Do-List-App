//
//  ItemModel.swift
//  ToDoList_MVVM_SwiftUI
//
//  Created by Abhishek Gautam on 09/01/24.
//

import Foundation


struct ItemModel : Identifiable, Codable {
    var id: String
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    
    func updateItem() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

//to create new item --> ItemModel(title: <#T##String#>, isCompleted: <#T##Bool#>)
//to update existing item --> ItemModel(id: <#T##String#>, title: <#T##String#>, isCompleted: <#T##Bool#>)
