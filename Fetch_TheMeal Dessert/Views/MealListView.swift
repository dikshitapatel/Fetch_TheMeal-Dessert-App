//
//  MealListView.swift
//  Fetch_TheMeal Dessert
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import Foundation
import SwiftUI

struct MealListView: View {
    @StateObject var viewModel = MealListViewModel(apiManager: APIManager.shared)
    @State private var searchQuery = ""
    

    
    var body: some View {
            NavigationView {
                List {
                    TextField("Search", text: $searchQuery)
                        .padding(5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                    
                    ForEach(viewModel.filteredMeals(for: searchQuery)) { meal in
                        NavigationLink(destination: MealDetailView(mealId: meal.id)) {
                            HStack {
                                RemoteImageView(url: meal.thumbnail)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                Text(meal.name)
                            }
                        }
                    }
                }
                .navigationTitle("Fetch-TheMeal")
                .lineLimit(nil)

                .task {
                    viewModel.fetchMeals()
                }
            }
        }
}
