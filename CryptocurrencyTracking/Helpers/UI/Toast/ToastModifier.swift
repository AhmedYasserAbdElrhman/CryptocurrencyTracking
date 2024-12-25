//
//  ToastModifier.swift
//  CryptocurrencyTracking
//
//  Created by Ahmad Yasser on 25/12/2024.
//

import SwiftUI
struct ToastModifier: ViewModifier {
    @Binding var isShowing: Bool
    let message: String
    let type: ToastType
    let duration: TimeInterval
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Group {
                    if isShowing {
                        Toast(message: message, type: type)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20) // Margin from screen edges
                            .transition(.move(edge: .top).combined(with: .opacity))
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                    withAnimation {
                                        isShowing = false
                                    }
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    isShowing = false
                                }
                            }
                    }
                },
                alignment: .top
            )
            .animation(.easeIn(duration: 0.5), value: isShowing)
    }
}
extension View {
    func toast(isShowing: Binding<Bool>, message: String, type: ToastType = .success, duration: TimeInterval = 3) -> some View {
        self.modifier(ToastModifier(isShowing: isShowing, message: message, type: type, duration: duration))
    }
}
