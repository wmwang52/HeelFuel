//
//  MealSectionView.swift
//  HeelFuel
//
//  Created by William Wang on 9/1/25.
//

import SwiftUI

struct MealSectionView: View {
    var icon: String
    var mealTime: String
    var calories: String

    var body: some View {
        HStack {
            Text(icon)
                .padding(.horizontal, 10)

            VStack(alignment: .leading) {
                Text(mealTime)
                    .fontWeight(.bold)
                if calories != "" {
                    Text("\(calories) cal")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                }
            }
            Spacer()
            Image(systemName: "plus")
                .font(.title)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.blue)
                .cornerRadius(40)
        }
        .padding([.horizontal, .vertical], 20)
        .background(Color.white)
    }
}

#Preview {
    MealSectionView(icon: "🍳", mealTime: "Breakfast", calories: " 856/847")
}
