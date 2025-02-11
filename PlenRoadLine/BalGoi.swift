//
//  BalGoi.swift
//  PlenRoadLine
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI


struct BalGoi: View {
    @State var finiani: Bool = false
    var body: some View {
        ZStack {
            
            Image("loepasthd")
                .resizable()
                .ignoresSafeArea()
            if !finiani {
                OhfuadKe()
            }
            
            WKWebViewRepresentable(url: URL(string: "https://plays.org/game/line-road/")!) {
                self.finiani = false
            }
            .cornerRadius(25)
            .mask {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: UIScreen.main.bounds.width * 0.7)
            }
            .cornerRadius(25)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackButtonNavigation())
    }
}
