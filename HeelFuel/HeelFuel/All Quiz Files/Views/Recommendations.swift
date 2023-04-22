//
//  Recommendations.swift
//  TryingAgain
//
//  Created by Jordan Becker on 4/21/23.
//

import SwiftUI

struct Recommendations: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Your Recommendations")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 30)
                CardRecommendationView(food: "Beef", emoji: "🥩", benefits: ["High protein", "Healthy"])
                CardRecommendationView(food: "Beef", emoji: "🥩", benefits: ["High protein", "Healthy"])
                CardRecommendationView(food: "Beef", emoji: "🥩", benefits: ["High protein", "Healthy"])
                //Spacer()
            }
            .padding()
        }
        
    }
}

struct Recommendations_Previews: PreviewProvider {
    static var previews: some View {
        Recommendations()
    }
}
