//
//  SendInformationView.swift
//  FirebaseGuilda
//
//  Created by gabriel.nascimento on 22/04/20.
//  Copyright © 2020 gabriel.nascimento. All rights reserved.
//

import SwiftUI
import FirebasePerformance

struct SendInformationView: View {
    var name: String
    @State var trace: Trace? = Performance.sharedInstance().trace(name: "iOS_GUILDA")
    
    var body: some View {
        VStack {
            Text(name)
            
            Button(action: {
                self.sendEvent(isiOS: false)
            }, label: {
                Text("Enviar Android")
                    .font(.title)
            })
                .padding()
            
            Button(action: {
                self.sendEvent(isiOS: true)
            }, label: {
                Text("Enviar iOS")
                    .font(.title)
            })
            .padding()
        }
    }
    
    func sendEvent(isiOS: Bool) {
        if isiOS {
            trace?.setValue(1, forMetric: "click_ios")
        } else {
            trace?.setValue(1, forMetric: "click_android")
        }
    }
}

struct SendInformationView_Previews: PreviewProvider {
    static var previews: some View {
        SendInformationView(name: "Guilda")
    }
}
