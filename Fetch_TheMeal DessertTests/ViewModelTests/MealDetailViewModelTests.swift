//
//  MealDetailViewModelTests.swift
//  Fetch_TheMeal DessertTests
//
//  Created by Dikshita Rajendra Patel on 13/06/24.
//

import Foundation
import XCTest
@testable import Fetch_TheMeal_Dessert

final class MealDetailViewModelTests: XCTestCase {
    func testFetchMealDetails_Success() async {
        let mockAPIManager = MockAPIManager()
        let viewModel = MealDetailViewModel(apiManager: mockAPIManager)
        let expectation = XCTestExpectation(description: "Meal details fetched successfully")
        viewModel.fetchMealDetails(id: "1")
        
        expectation.fulfill()
        
        // Wait for the expectation to be fulfilled, with a timeout
        await fulfillment(of: [expectation], timeout: 10)

        print("mealDetail: \(String(describing: viewModel.mealDetail))")
        print("errorMessage: \(String(describing: viewModel.errorMessage))")
        
        XCTAssertNotNil(viewModel.mealDetail)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchMealDetails_Failure() async {
        let mockAPIManager = MockAPIManager()
        mockAPIManager.shouldReturnError = true
        let viewModel = MealDetailViewModel(apiManager: mockAPIManager)
        let expectation = XCTestExpectation(description: "Meal details fetch failure")
        viewModel.fetchMealDetails(id: "2000")
        
        expectation.fulfill()
        
        // Wait for the expectation to be fulfilled, with a timeout
        await fulfillment(of: [expectation], timeout: 10)

        print("mealDetail: \(String(describing: viewModel.mealDetail))")
        print("errorMessage: \(String(describing: viewModel.errorMessage))")
        
        XCTAssertNil(viewModel.mealDetail)
        XCTAssertNotNil(viewModel.errorMessage)
    }

}
