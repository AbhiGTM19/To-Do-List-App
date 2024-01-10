//
//  ListViewModel.swift
//  ToDoList_MVVM_SwiftUI
//
//  Created by Abhishek Gautam on 09/01/24.
//

import Foundation


//CRUD Functions performed here -->


class ListViewModel : ObservableObject{
 
    @Published var items : [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    let itemKey : String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "First", isCompleted: true),
//            ItemModel(title: "Second", isCompleted: false),
//            ItemModel(title: "Third", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        
        guard let data = UserDefaults.standard.data(forKey: itemKey),
              let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
       
        self.items = savedItem
    }
    
    // to delete items in the list
    func deleteItem(indexSet : IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    // to move items in the list
    func moveItem(from : IndexSet, to :Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // to add items in the list
    func addItem(title : String){
       let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    // to update item in the list
    func updateItem (item: ItemModel){
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            // run this code
//        }
        
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateItem()
        }
    }
    
    // to save /persist the data of the list
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemKey)
        }
    }
    
}


