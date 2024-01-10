//
//  NoItemView.swift
//  ToDoList_MVVM_SwiftUI
//
//  Created by Abhishek Gautam on 09/01/24.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate : Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no Items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("If you are a productive person, try to add some items in this list via clicking the below Button!")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something! ✅")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("ScaleColorStart") : Color("ScaleColorEnd"))
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 15, y: 10)
                })
                .padding(.horizontal, animate ? 30 : 40)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y : animate ? -3 : 0)
                
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
            
        }
    }
}

#Preview {
    NavigationView{
        NoItemView()
            .navigationTitle("Title")
    }
    
}
