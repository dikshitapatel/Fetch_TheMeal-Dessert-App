//
//  MealDetailView.swift
//  Fetch_TheMeal Dessert
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject private var viewModel = MealDetailViewModel(apiManager: APIManager.shared)
    let mealId: String
    @State private var showIngredients = false
    @State private var showInstructions = false

    var body: some View {
        VStack {
            if let meal = viewModel.mealDetail {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        RemoteImageView(url: meal.thumbnail)
                            .frame(height: 250)
                            .cornerRadius(10)
                        
                        Text(meal.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, 8)
                        
                        DisclosureGroup(isExpanded: $showInstructions) {
                                                   Text(meal.instructions)
                                                       .font(.body)
                                               } label: {
                                                   Text("Instructions")
                                                       .font(.headline)
                                               }
                                               .padding(.top)
                        
                        DisclosureGroup(isExpanded: $showIngredients) {
                            ForEach(0..<meal.ingredients.count, id: \.self) { index in
                                                                                 HStack {
                                                                                     Text(meal.ingredients[index].ingredient)
                                                                                     Spacer()
                                                                                     Text(meal.ingredients[index].measure)
                                                                                 }
                                                                             }
                                                                         }  label: {
                            Text("Ingredients")
                                .font(.headline)
                        }
                        .padding(.top)
                    }
                    .padding()
                }
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                ProgressView("Loading...")
            }
        }
        .onAppear {
            viewModel.fetchMealDetails(id: mealId)
        }
        .navigationBarTitle("Meal Details", displayMode: .inline)
        .onTapGesture {
            withAnimation {
                showIngredients.toggle()
            }
        }
    }
}
