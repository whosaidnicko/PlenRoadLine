//
//  MonamueaView.swift
//  PlenRoadLine
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI

struct MonamueaView: View {
    @State var letsMakeAppear: Bool = false
    var body: some View {
        ZStack {
            // bg meniushka
            Image("loepasthd")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image("pleloeaolgeo")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(letsMakeAppear ? 1 : 0)
                    .animation(Animation.bouncy(duration: 0.5).delay(0.3), value: letsMakeAppear)
                    .padding(6)
                
                HStack(spacing: 50) {
                    // ingo nav
                    NavigationLink {
                        InfFls()
                    } label: {
                        Image("ifus")
                            .resizable()
                            .scaledToFit()
                            .offset(x: letsMakeAppear ? 0 : -UIScreen.main.bounds.width)
                            .animation(Animation.bouncy(duration: 0.5).delay(0.6), value: letsMakeAppear)
                            .padding(6)
                            .opacity(letsMakeAppear ? 1 : 0)
                    }

                  // game 
                    NavigationLink {
                        BalGoi()
                    } label: {
                        Image("ofletpla")
                            .resizable()
                            .scaledToFit()
                            .offset(y: letsMakeAppear ? 0 : -UIScreen.main.bounds.height)
                            .animation(Animation.bouncy(duration: 0.5).delay(0.85), value: letsMakeAppear)
                            .opacity(letsMakeAppear ? 1 : 0)
                            .padding(6)
                    }

                    
                    
                    
                    // set go
                    NavigationLink {
                        SetBut()
                    } label: {
                        Image("settings")
                            .resizable()
                            .scaledToFit()
                            .offset(x: letsMakeAppear ? 0 : UIScreen.main.bounds.width)
                            .animation(Animation.bouncy(duration: 0.5).delay(1), value: letsMakeAppear)
                            .padding(6)
                            .opacity(letsMakeAppear ? 1 : 0)
                    }
                 
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.letsMakeAppear = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                vibr(style: .soft)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                vibr(style: .light)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                vibr(style: .medium)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                vibr(style: .heavy)
            }
        }
    }
}
