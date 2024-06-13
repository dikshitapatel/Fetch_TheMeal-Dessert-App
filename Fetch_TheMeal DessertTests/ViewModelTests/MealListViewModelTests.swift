//
//  MealListViewModelTests.swift
//  Fetch_TheMeal DessertTests
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import Foundation
import XCTest
@testable import Fetch_TheMeal_Dessert

final class MealListViewModelTests: XCTestCase {
    func testFetchMeals_Success() async {
        let mockAPIManager = MockAPIManager()
        let viewModel = MealListViewModel(apiManager: mockAPIManager)
        let expectation = XCTestExpectation(description: "Meals fetched successfully")
        
        print("Before fetching: \(viewModel.meals)")
        viewModel.fetchMeals()
        expectation.fulfill()
        
        // Wait for the expectation to be fulfilled, with a timeout
        await fulfillment(of: [expectation], timeout: 5)
        
        print("After fetching: \(viewModel.meals)")
        
        XCTAssertFalse(viewModel.meals.isEmpty)
    }

    
    func testFetchMeals_Failure() async {
        let mockAPIManager = MockAPIManager()
        mockAPIManager.shouldReturnError = true
        let viewModel = MealListViewModel(apiManager: mockAPIManager)
        
        viewModel.fetchMeals()
        
        XCTAssertTrue(viewModel.meals.isEmpty)
    }
}
