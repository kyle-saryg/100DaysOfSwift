//
//  ContentView.swift
//  BucketList(14)
//
//  Created by Kyle Sarygin on 9/3/23.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
     @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Successfully authenticated")
            } else {
                Text("Whos this rando")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // '&error' store error in 'error' (one way binding, take result and store in variable)
        // $ is used with @State properties and is a two-way binding
        // Device has biometric capabilities
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    // Whos this rando
                }
            }
        } else {
            // no biometrics on device
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
