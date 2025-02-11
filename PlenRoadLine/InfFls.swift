//
//  InfFls.swift
//  PlenRoadLine
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI

struct InfFls: View {
    @State var infOse: Bool = false
    var body: some View {
        ZStack {
            Image("loepasthd")
                .resizable()
                .ignoresSafeArea()
             
            Image("inflet")
                .resizable()
                .scaledToFit()
                .padding(15.5)
                .offset(x: infOse ? 0 : -UIScreen.main.bounds.width)
                .animation(Animation.bouncy, value: infOse)
                .opacity(infOse ? 1 : 0)
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.34) {
                        self.infOse = true
                    }
                }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackButtonNavigation())
    }
}
