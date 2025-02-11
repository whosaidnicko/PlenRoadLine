//
//  SetBut.swift
//  PlenRoadLine
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI



struct SetBut: View {
    var body: some View {
        ZStack {
            Image("loepasthd")
                .resizable()
                .ignoresSafeArea()
            
            Image("setIm")
                .resizable()
                .scaledToFit()
                .padding(40)
                .overlay {
                    VStack(spacing: 21) {
                        Button {
                            if let window = UIApplication.shared.windows.first {
                                requestReview(in: window)
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.init(hex: "#D9D9D9"),lineWidth: 2)
                                    
                                    Text("RATE US")
                                        .font(.system(size: 24, weight: .bold, design: .monospaced))
                                        .foregroundStyle(.black)
                                }
                                
                                .frame(width: 320, height: 30)
                        }

                      
                    }
                    .padding(.top, 30)
                }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackButtonNavigation())
    }
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
