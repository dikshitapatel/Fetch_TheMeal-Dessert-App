//
//  APIProtocol.swift
//  Fetch_TheMeal Dessert
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import Foundation

protocol APIProtocol {
    func fetchMeals() async throws -> [Meal]
    func fetchMealDetails(id: String) async throws -> MealDetails
}
