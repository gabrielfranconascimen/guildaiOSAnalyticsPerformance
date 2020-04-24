//
//  ErrorGuilda.swift
//  FirebaseGuilda
//
//  Created by gabriel.nascimento on 23/04/20.
//  Copyright © 2020 gabriel.nascimento. All rights reserved.
//

import Foundation

class ErrorGuilda: Error {
    var error: String = ""
    init(strError: String) {
        error = strError
    }
}
