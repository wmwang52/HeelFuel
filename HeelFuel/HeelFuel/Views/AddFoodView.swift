//
//  AddFoodView.swift
//  HeelFuel
//
//  Created by Mitchell Anderson on 4/17/23.
// g

import SwiftUI

struct AddFoodView: View {
    @Binding var meal: MealModel
    @StateObject var vm: AddFoodViewModel
    @State private var searchText = ""
    @Binding var toggle: Bool

    var body: some View {
        NavigationStack {
            switch vm.state {
            case .success(let foods):
                VStack {
                    List {
                        ForEach(foods[meal.index!]) { item in
                            if item.name.contains(searchText) {
                                NavigationLink {
                                    FoodDetailView(meal: $meal, vm: vm, togglePopup: $toggle, food: item.self)
                                } label: {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("\(item.name)").font(.headline)
                                            .padding(.bottom, 5)

                                        Grid(horizontalSpacing: 20) {
                                            GridRow {
                                                Text("Calories")
                                                    
                                                Text("Protein")
                                                    
                                                Text("Fat")
                                                    
                                                Text("Carbs")
                                            }
                                                
                                            GridRow {
                                                Text("🔥 \(item.calories.digits)")
                                                if (item.protein.digits.starts(with: "0")) && (item.protein.digits.count > 1) {
                                                    Text("🍗 0.\(item.protein.digits.deletingPrefix("0")) g")
                                                } else {
                                                    Text("🍗 \(item.protein.digits) g")
                                                }
                                                
                                                Text("🧈 \(item.totalFat.digits) g")
                                                    
                                                Text("🍚 \(item.totalCarbohydrate.digits) g")
                                            }
                                        }
                                        .font(.subheadline).foregroundColor(.gray)
                                        .padding(.bottom, 10)
                                    }
                                }
                            } else if searchText.isEmpty {
                                NavigationLink {
                                    FoodDetailView(meal: $meal, vm: vm, togglePopup: $toggle, food: item.self)
                                } label: {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("\(item.name)").font(.headline)
                                            .padding(.bottom, 5)

                                        Grid(horizontalSpacing: 20) {
                                            GridRow {
                                                Text("Calories")
                                                    
                                                Text("Protein")
                                                    
                                                Text("Fat")
                                                    
                                                Text("Carbs")
                                            }
                                                
                                            GridRow {
                                                Text("🔥 \(item.calories.digits)")
                                                if (item.protein.digits.starts(with: "0")) && (item.protein.digits.count > 1) {
                                                    Text("🍗 0.\(item.protein.digits.deletingPrefix("0")) g")
                                                } else {
                                                    Text("🍗 \(item.protein.digits) g")
                                                }
                                                
                                                Text("🧈 \(item.totalFat.digits) g")
                                                    
                                                Text("🍚 \(item.totalCarbohydrate.digits) g")
                                            }
                                        }
                                        .font(.subheadline).foregroundColor(.gray)
                                        
                                        Text("\(item.allergens)")
                                            .font(.subheadline).foregroundColor(.gray)
                                            .padding(.bottom, 10)
                                    }
                                }
                            }
                        }
                    }
                }
            case .idle:
                VStack {
                    Text("Currently Loading!")
                    ProgressView()
                }
            case .loading:
                VStack {
                    Text("Almost finished Loading!")
                    ProgressView()
                }
            case .error:
                Text("There was an error")
            }
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onAppear {
                vm.findFoods()
            }
    }
}

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView(meal: HomeView().$breakfast, vm: AddFoodViewModel(), toggle: MealView(vm: AddFoodViewModel(), meal: HomeView().$breakfast).$showingPopover)
    }
}
