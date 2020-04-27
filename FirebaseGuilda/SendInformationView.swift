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
    @State var trace: Trace? = Performance.startTrace(name: "iOS_GUILDA")
    
    var body: some View {
        VStack() {
            
            Text(self.name)
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 16, weight: .bold, design: .serif))
                .lineLimit(2)
                .padding(4)
                
            Button(action: {
                    self.sendEvent(isiOS: false)
                }, label: {
                    Text("Enviar Android")
                        .fontWeight(.semibold)
                        .font(.system(size: 24, weight: .light, design: .rounded))
                    
            })
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.white)
                .background(
                    LinearGradient(gradient: Gradient(colors:
                        [Color.gray, Color.green]),
                                   startPoint: .leading, endPoint: .trailing))
                .cornerRadius(12)
                .padding(4)
                
            Button(action: {
                    self.sendEvent(isiOS: true)
                }, label: {
                    Text("Enviar iOS")
                       .fontWeight(.semibold)
                        .font(.system(size: 24, weight: .light, design: .rounded))
                    
            })
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.white)
                .background(
                    LinearGradient(gradient: Gradient(colors:
                        [Color.primary, Color.gray]),
                                   startPoint: .leading, endPoint: .trailing))
                .cornerRadius(12)
                .padding(4)
            
        }
            .onDisappear() {
                self.trace?.stop()
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
