//
//  LogoProgressView.swift
//  CorpPort
//
//  Created by Peter Kozlov on 20.10.2026.
//

import SwiftUI

struct LogoProgressView: View {
    @State private var offset: CGFloat = -1
    
    var body: some View {
        Image("AppLogo")
            .resizable()
            .scaledToFit()
            .frame(width: 48, height: 48)
            .overlay {
                GeometryReader { geo in
                    LinearGradient(
                        colors: [
                            .clear,
                            .white.opacity(0.8),
                            .clear
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: geo.size.width * 0.4)
                    .offset(x: offset * geo.size.width)
                    .blendMode(.screen)
                }
                .mask {
                    Image("AppLogo")
                        .resizable()
                        .scaledToFit()
                }
            }
            .onAppear {
                withAnimation(
                    .linear(duration: 1.2)
                    .repeatForever(autoreverses: false)
                ) {
                    offset = 1.5
                }
            }
    }
}
