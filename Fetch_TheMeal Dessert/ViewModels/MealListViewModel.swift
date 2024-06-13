//
//  MealListViewModel.swift
//  Fetch_TheMeal Dessert
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import Foundation

class MealListViewModel: ObservableObject {
    
    @Published var meals: [Meal] = []
    private let apiManager: APIProtocol
        
    init(apiManager: APIProtocol) {
            self.apiManager = apiManager
        }

    func fetchMeals() {
        Task {
            do {
                let meals = try await apiManager.fetchMeals()
                let filteredMeals = meals.filter { meal in
                    return !meal.name.isEmpty && !meal.thumbnail.isEmpty
                }
                // Update UI with fetched meals on the main thread
                DispatchQueue.main.async {
                    self.meals = filteredMeals
                }
            } catch {
                print("Error fetching meals: \(error.localizedDescription)")
            }
        }
    }
    
    func filteredMeals(for searchText: String) -> [Meal] {
            if searchText.isEmpty {
                return meals // Return all meals if search query is empty
            } else {
                // Filter meals based on search query
                return meals.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
    }
}
