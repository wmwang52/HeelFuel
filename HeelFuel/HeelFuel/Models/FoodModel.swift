import Foundation

struct Food: Codable, Hashable, Identifiable {
    var id = UUID()
    var allergens, calories, caloriesFromFat, cholestrol: String
    var dietaryFiber, ingredients, name, protein: String
    var saturatedFat, servingSize, sodium, sugars: String
    var totalCarbohydrate, totalFat: String
    var transFat: String
}