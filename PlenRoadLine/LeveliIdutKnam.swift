//
//  LeveliIdutKnam.swift
//  PlenRoadLine
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI


struct LeveliIdutKnam: View {
    var body: some View {
        ZStack {
            
        }
    }
}
import StoreKit
func requestReview(in window: UIWindow?) {
    if let windowScene = window?.windowScene {
        SKStoreReviewController.requestReview(in: windowScene)
    } else {
        print("Failed to find a valid UIWindowScene.")
    }
}
