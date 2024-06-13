//
//  APIManager.swift
//  Fetch_TheMeal Dessert
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import Foundation

// Custom error types for APIManager
enum APIError: Error {
    case invalidURL
    case decodingError
    case invalidData
    case invalidMealData
}

class APIManager : APIProtocol {
    static let shared = APIManager()
    
    private init() {}
    
    // Fetch meals asynchronously
    func fetchMeals() async throws -> [Meal] {
        // Ensure URL is valid
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            throw APIError.invalidURL
        }
        
        // Perform network request
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decode response
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(MealListResponse.self, from: data)
            return result.meals
        } catch {
            throw APIError.decodingError
        }
    }
    
    // Fetch meal details asynchronously
    func fetchMealDetails(id: String) async throws -> MealDetails {
        // Ensure URL is valid
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            throw APIError.invalidURL
        }
        
        // Perform network request
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decode response
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(MealDetailResponse.self, from: data)
            guard let meal = result.meals.first else {
                throw APIError.invalidMealData
            }
            return meal
        } catch {
            throw APIError.decodingError
        }
    }
}

// Codable structs for API responses
struct MealListResponse: Decodable {
    let meals: [Meal]
}

struct MealDetailResponse: Decodable {
    let meals: [MealDetails]
}
