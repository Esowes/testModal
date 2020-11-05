//
//  ContentView.swift
//  refreshFromModal
//
//  Created by Serge Ostrowsky on 22/05/2020.
//  Copyright © 2020 Serge Ostrowsky. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var modalIsPresented = false // The "settingsView" modally presented as a sheet
        
   @State private var modalViewCaller = 0 // This triggers the appropriate modal (only one in this example)

    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                Button(action: {
                    self.modalViewCaller = 1 // SettingsView
                    self.modalIsPresented = true
                }
                    ) {
                        Text("Tap to present Modal")
                     }
                Spacer()
            } // END of main VStack
            .onAppear() {
                self.modalViewCaller = 0
            }
            .navigationBarTitle("Test app", displayMode: .inline)
        } // END of NavigationView
        .sheet(isPresented: $modalIsPresented, content: sheetContent)
        .navigationViewStyle(StackNavigationViewStyle()) // This avoids dual column on iPad

    } // END of var body: some View
  // MARK: @ViewBuilder func sheetContent() :
    
    @ViewBuilder func sheetContent() -> some View {
        
        if modalViewCaller == 1 {
            SettingsView()
                .navigationViewStyle(StackNavigationViewStyle())
                .onDisappear { // This always triggered
                    print("onDissappear triggered ! at \(Date().debugDescription)")
                    self.modalViewCaller = 0
                }
            }
    } // END of func sheetContent
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView()
        
    }
}
