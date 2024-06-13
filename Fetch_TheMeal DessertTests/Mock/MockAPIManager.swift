//
//  MockAPIManager.swift
//  Fetch_TheMeal DessertTests
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import Foundation
@testable import Fetch_TheMeal_Dessert

class MockAPIManager: APIProtocol {
    var shouldReturnError = false
    
    func fetchMeals() async throws -> [Meal] {
        if shouldReturnError {
            throw APIError.invalidData
        }
        
        return [
            Meal(id: "1", name: "Meal 1", thumbnail: "meal1.jpg"),
            Meal(id: "2", name: "Meal 2", thumbnail: "meal2.jpg"),
            Meal(id: "3", name: "Meal 3", thumbnail: "meal3.jpg"),
            Meal(id: "4", name: "Meal 4", thumbnail: "meal4.jpg"),
            Meal(id: "5", name: "Meal 5", thumbnail: "meal5.jpg"),
        ]
    }
    
    func fetchMealDetails(id: String) async throws -> MealDetails {
        if shouldReturnError {
            throw APIError.invalidMealData
        }
        
        let mockMeal = Meal(id: id, name: "Mock Meal", thumbnail: "mockThumbnail.jpg")
                let mockIngredients: [(ingredient: String, measure: String)] = [("Ingredient1", "1 cup")]
                return MealDetails(from: mockMeal, instructions: "Mock Instructions", thumbnail: "mockThumbnail.jpg", ingredients: mockIngredients)
            }
    }

