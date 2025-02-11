//
//  BackButtonNavigation.swift
//  PlenRoadLine
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI

struct BackButtonNavigation: View {
    @State var opacityOn: Bool = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            opacityOn = false
            self.dismiss()
        } label: {
            Image("ofkba")
                .resizable()
                .frame(width: 42, height: 36)
        }
        .opacity(opacityOn ? 1 : 0)

    }
}
