//
//  AddView.swift
//  ToDoList_MVVM_SwiftUI
//
//  Created by Abhishek Gautam on 09/01/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldString : String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert : Bool = false
    
    
    var body: some View {
        ScrollView{
            
            VStack {
                TextField("Type to add an item here.....", text: $textFieldString)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                .cornerRadius(15)
                
                Button(action: saveButtonPressed, label: {
                    Text ("Save".uppercased())
                        .foregroundStyle(.white)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
            
            
        }
        .navigationTitle("Add an Item 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldString)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldString.count < 5 {
            alertTitle = "Character length must be greater than 5! ‼️"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
    
}
