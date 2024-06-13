//
//  MealDetailViewModel.swift
//  Fetch_TheMeal Dessert
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import Foundation
import Combine
import SwiftUI

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetails?
    @Published var errorMessage: String?
    
    private let apiManager: APIProtocol
        
    init(apiManager: APIProtocol) {
        self.apiManager = apiManager
    }

    func fetchMealDetails(id: String) {
        Task {
            do {
                let meal = try await apiManager.fetchMealDetails(id: id)
                // Check if the fetched meal has a non-empty name, instructions, and thumbnail
                guard !meal.name.isEmpty && !meal.instructions.isEmpty && !meal.thumbnail.isEmpty else {
                    DispatchQueue.main.async {
                        self.errorMessage = "Invalid meal details"
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    self.mealDetail = meal
                    self.errorMessage = nil // Reset error message on success
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Meal details fetch failure"
                }
            }
        }
    }
}

