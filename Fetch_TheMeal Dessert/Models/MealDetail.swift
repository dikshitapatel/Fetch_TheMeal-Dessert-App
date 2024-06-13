//
//  MealDetail.swift
//  Fetch_TheMeal Dessert
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import Foundation

struct MealDetails: Decodable {
    let id: String
    let name: String
    let instructions: String
    let thumbnail: String
    var ingredients: [(ingredient: String, measure: String)] = []

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
    }
    
    init(from meal: Meal, instructions: String, thumbnail: String, ingredients: [(ingredient: String, measure: String)]) {
        self.id = meal.id
        self.name = meal.name
        self.instructions = instructions
        self.thumbnail = thumbnail
        self.ingredients = ingredients
    }
    
    // Decoder-based initializer to handle decoding from JSON data
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        instructions = try container.decode(String.self, forKey: .instructions)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)

        let additionalKeys = try decoder.container(keyedBy: DynamicCodingKey.self)
        var ingredientsArray: [(ingredient: String, measure: String)] = []

        // Loop through possible ingredient and measure keys (up to 20)
        for i in 1...20 {
            let ingredientKey = DynamicCodingKey(stringValue: "strIngredient\(i)")
            let measureKey = DynamicCodingKey(stringValue: "strMeasure\(i)")
            
            if let ingredientKey = ingredientKey, let measureKey = measureKey,
               let ingredient = try additionalKeys.decodeIfPresent(String.self, forKey: ingredientKey),
               let measure = try additionalKeys.decodeIfPresent(String.self, forKey: measureKey),
               !ingredient.isEmpty {
                ingredientsArray.append((ingredient, measure))
            }
        }
        
        self.ingredients = ingredientsArray
    }
    
    // Helper struct for dynamic key decoding
    struct DynamicCodingKey: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        init?(intValue: Int) {
            self.stringValue = "\(intValue)"
            self.intValue = intValue
        }
    }
}
