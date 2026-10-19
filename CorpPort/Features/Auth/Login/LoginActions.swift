//
//  LoginActions.swift
//  CorpPort
//
//  Created by Peter Kozlov on 17.10.2026.
//

import Foundation

enum LoginActions {
    case loginChanged(String)
    case passwordChanged(String)
    case loginTapped
    case loginSucceeded
    case loginFailed(String)
}
