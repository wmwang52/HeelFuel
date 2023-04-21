//
//  RingView.swift
//  HeelFuel
//
//  Created by Milan Dutta on 4/10/23.
//

import SwiftUI
struct customShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

struct RingView: View {
    @EnvironmentObject var vm: AddFoodViewModel

    // Varaibles dealing with Macros
    var macroGoals: Float = 2000
    var gramsString: String = "g"
    var carbGoal: Float = 200
    var fatGoal: Float = 200
    var proteinGoal: Float = 200
    // These three goals should be floats that reflect what the user inputs, or based on the API that calculates the optimal macro goals

    var percent: CGFloat = 300
    let width: CGFloat = 140
    let height: CGFloat = 140
    let calorieIndicator: String = "cal"
    var userCalorieGoal: Float = 2000
    var body: some View {
        @State var ringValue = UserDefaults.standard.integer(forKey: "calories")
        let multiplier = width / 44
        @State var progress = 1 - (ringValue / Int(userCalorieGoal))
        return HStack {
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.1), style: StrokeStyle(lineWidth: 4 * multiplier))
                    .frame(width: width, height: height)
                Circle()
                    .trim(from: CGFloat(progress), to: 1)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("RingColor"), .blue]), startPoint: .top, endPoint: .bottom),
                            style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))

                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .frame(width: width, height: height)
                Text("\(ringValue) \(calorieIndicator)").bold()
                    .font(.title2)
            }
            .padding()

            HStack(spacing: 30) {
                FoodElementView(element: "Carbs", gram: String(format: "100" + gramsString, ""), color: "carbs", elementValue: CGFloat(vm.carbs))
                FoodElementView(element: "Fat", gram: String(format: "%.0f" + gramsString, ""), color: "fat", elementValue: CGFloat(vm.fat))
                FoodElementView(element: "Protein", gram: String(format: "%.0f" + gramsString, ""), color: "protein", elementValue: CGFloat(vm.protein))
                    .offset(x: -5)
            }
        }
        .frame(height: 180)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(20)
        .modifier(customShadow())
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}

struct FoodElementView: View {
    var element: String = ""
    var gram: String = ""
    var color: String = ""
    var elementValue: CGFloat = 0
    var body: some View {
        let height: CGFloat = 130
        let multiplier = height / 2000
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(width: 8, height: 110)
                    .foregroundColor(.gray.opacity(0.5))
                if elementValue != 0 {
                    Rectangle()
                        .frame(width: 8, height: elementValue * multiplier)
                        .foregroundColor(Color(color))
                } else {
                    Rectangle()
                        .frame(width: 8, height: 110)
                        .foregroundColor(Color(color))
                }
            }
            .cornerRadius(10)
            Text(element)
                .font(.system(size: 12))
            Text(gram)
                .font(.system(size: 10))
        }
    }
}
