//
//  ContentView.swift
//  FirebaseGuilda
//
//  Created by gabriel.nascimento on 18/04/20.
//  Copyright © 2020 gabriel.nascimento. All rights reserved.
//

import SwiftUI

import FirebaseAnalytics
import FirebaseCrashlytics

struct ContentView: View {
    @State private var name: String = ""
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
                VStack {
                    TextField("Enter Name", text: $name)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(4)
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 1))
                        
                        NavigationLink(destination: SendInformationView(name: name), tag: 1, selection: $selection) {
                            Button(action: {
                                
                                if (self.name.isEmpty) {
                                    Crashlytics.crashlytics().setUserID("123")
                                    Crashlytics.crashlytics()
                                        .record(error: ErrorGuilda.init(strError: "Campo de texto Vazio"))
                                    
                                } else {
                                    self.buttonAction()
                                    self.selection = 1
                                }
                            }, label: {
                                Text("Name")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 24, weight: .light, design: .rounded))
                            })
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(.white)
                                .background(
                                    LinearGradient(gradient: Gradient(colors:
                                        [Color.orange, Color.red]),
                                                   startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(12)
                            .padding(.horizontal, 4)
                        }
            }.padding(4)
        }
    }

    func buttonAction() {
        Analytics.logEvent("GuildaiOS", parameters: [
            "evento" : "enviando_nome_\(name)",
            "Entendi" : ""
        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
