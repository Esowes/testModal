//
//  settingsView.swift
//  refreshFromModal
//
//  Created by Serge Ostrowsky on 22/05/2020.
//  Copyright © 2020 Serge Ostrowsky. All rights reserved.
//

import SwiftUI
import UIKit

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode // in order to dismiss the Sheet
    
    @State public var multiRules = true
        
    @State private var ruleSelection = UserDefaults.standard.integer(forKey: kruleSelection) // 0 is rule 1, 1 is rule 2

    
    var body: some View {
        NavigationView {
            VStack {
                        Text(" modal test View")

            } // End of VStack
            .navigationBarItems(
                leading:
                Button("Done") {
                        self.presentationMode.wrappedValue.dismiss() // This dismisses the view
                }
            )
                .navigationBarTitle("modal View test", displayMode: .inline)
        } // END of Navigation view
    } // END of some View
    
}



// MARK: Preview struct

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        
        SettingsView()
    }
}
