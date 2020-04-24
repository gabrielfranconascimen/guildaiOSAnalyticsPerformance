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
                        TextField("enter Name", text: $name)
                            .frame(width: 200, height: 70, alignment: .center)
                        
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
                            })
                        }
                    }
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
