//
//  ListView.swift
//  ToDoList_MVVM_SwiftUI
//
//  Created by Abhishek Gautam on 09/01/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else {
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("ToDoList 📝")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
        
    }
    
}

#Preview {
    NavigationView{ //embedding in navigation view, so that we have the same environment as we want in our app
        ListView()
    }
    .environmentObject(ListViewModel())
}


