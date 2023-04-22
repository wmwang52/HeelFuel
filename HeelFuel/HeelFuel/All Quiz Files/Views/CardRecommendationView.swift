//
//  CardRecommendationView.swift
//  TryingAgain
//
//  Created by Jordan Becker on 4/21/23.
//

import SwiftUI

struct CardRecommendationView: View {
    @State var food: String
    @State var emoji: String
    @State var benefits: [String]

    var body: some View {
        VStack {
            HStack {
                Text(food)
                    .font(.title2)
                Spacer()
                Text(emoji)
            }
            Image("Plate")
                .scaledToFit()
            Text("Food Benefits:")
                .bold()
            ForEach(benefits, id: \.self) { benefit in
                Text("- \(benefit)")
            }
        }
        .padding()
        // .frame(width: 300)
        .background(Color("CarolinaBlue"))
        .cornerRadius(20)
        .shadow(color: .gray, radius: 30)
    }
}

struct CardRecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        CardRecommendationView(food: "Beef", emoji: "🥩", benefits: ["High protein", "Healthy"])
    }
}
