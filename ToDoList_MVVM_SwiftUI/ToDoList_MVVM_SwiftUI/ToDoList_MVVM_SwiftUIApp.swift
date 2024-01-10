//
//  ToDoList_MVVM_SwiftUIApp.swift
//  ToDoList_MVVM_SwiftUI
//
//  Created by Abhishek Gautam on 09/01/24.
//

import SwiftUI


/*
 MVVM Architecture -->
 Model - data point
 View - UI
 ViewModel - manages Models for View
*/

@main
struct ToDoList_MVVM_SwiftUIApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
              ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle()) // to fix the sidebar screen issue in iPad simulator.
            .environmentObject(listViewModel)
        }
    }
}
