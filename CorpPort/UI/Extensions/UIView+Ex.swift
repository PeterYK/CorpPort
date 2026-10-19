//
//  UIView+Ex.swift
//  CorpPort
//
//  Created by Peter Kozlov on 19.10.2026.
//

import SwiftUI

extension View {
    func withAppLogo() -> some View {
        self.toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
        }
    }
}
