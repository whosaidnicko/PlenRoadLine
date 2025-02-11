//
//  OhlfuadKe.swift
//  PlenRoadLine
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI

struct OhfuadKe: View {
    @State private var rotateGear1 = 0.0
    @State private var rotateGear2 = 0.0
    @State private var rotateGear3 = 0.0
    @State private var ballOffset = -20.0

    var body: some View {
        ZStack {
         
            
            VStack {
                // Bouncing Balls
                HStack(spacing: 20) {
                    Spoelasef(offset: $ballOffset, delay: 0)
                    Spoelasef(offset: $ballOffset, delay: 0.2)
                    Spoelasef(offset: $ballOffset, delay: 0.4)
                }
                .padding(.bottom, 50)

                // Rotating Gears
                HStack(spacing: -20) {
                    OhMoersa(size: 50, rotation: $rotateGear1)
                    OhMoersa(size: 80, rotation: $rotateGear2, reverse: true)
                    OhMoersa(size: 50, rotation: $rotateGear3)
                }
            }
        }
        .onAppear {
            startAnimations()
        }
    }
    
    func startAnimations() {
        withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
            rotateGear1 = 360
        }
        withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
            rotateGear2 = -360
        }
        withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
            rotateGear3 = 360
        }
        withAnimation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
            ballOffset = 20
        }
    }
}

struct OhMoersa: View {
    var size: CGFloat
    @Binding var rotation: Double
    var reverse: Bool = false

    var body: some View {
        Image(systemName: "gearshape.fill")
            .resizable()
            .frame(width: size, height: size)
            .foregroundColor(.orange)
            .rotationEffect(.degrees(rotation))
    }
}

struct Spoelasef: View {
    @Binding var offset: Double
    var delay: Double
    
    var body: some View {
        Circle()
            .frame(width: 15, height: 15)
            .foregroundColor(.yellow)
            .offset(y: offset)
            .animation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true).delay(delay), value: offset)
    }
}
