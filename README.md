# Fetch-TheMeal

Fetch-TheMeal is an iOS app using SwiftUI that allows users to discover and explore various dessert recipes. The app leverages an external API to fetch meal data and display it to the users.

# Snapshots


<img width="175" height="350" alt="Screenshot 2024-06-12 at 7 39 17 PM" src="https://github.com/dikshitapatel/Fetch_TheMeal/assets/51240335/9f9d7734-4989-4d79-b4d5-bbf92854316d">
<img width="175" height="350" alt="Screenshot 2024-06-12 at 7 39 29 PM" src="https://github.com/dikshitapatel/Fetch_TheMeal/assets/51240335/436a19aa-ffb0-4503-b9b8-ee3d5d2eeae1">
<img width="175" height="350" alt="Screenshot 2024-06-12 at 7 39 42 PM" src="https://github.com/dikshitapatel/Fetch_TheMeal/assets/51240335/b75e4357-a159-46a0-813d-469c2595e6c0">
<img width="175" height="350" alt="Screenshot 2024-06-12 at 7 39 50 PM" src="https://github.com/dikshitapatel/Fetch_TheMeal/assets/51240335/ee18daa6-22da-4a3c-8603-25deb9f5d4f1">
<img width="175" height="350" alt="Screenshot 2024-06-12 at 7 40 08 PM" src="https://github.com/dikshitapatel/Fetch_TheMeal/assets/51240335/7fcafea9-59dc-4c35-832e-7def985ac74c">

## Model-View-ViewModel (MVVM) Architecture
<img width="702" alt="Screenshot 2024-06-12 at 7 56 12 PM" src="https://github.com/dikshitapatel/Fetch_TheMeal/assets/51240335/ac6828ee-45d5-47bc-aaae-e4b452f26ab1">

### Model

- **Meal.swift**: Represents a meal object with properties like id, name, and thumbnail.
- **MealDetails.swift**: Represents detailed information about a meal, including its ingredients and instructions.
- **APIManager.swift**: Handles network requests to fetch meal data from an external API.
- **APIProtocol.swift**: Defines protocols for fetching meals and meal details asynchronously.

### View

- **ContentView.swift**: The main view of the app, responsible for displaying the list of meals.
- **MealListView.swift**: Displays a list of meals fetched from the API. Allows users to search for specific meals.
- **MealDetailView.swift**: Displays detailed information about a selected meal, including its ingredients and instructions.
- **RemoteImageView.swift**: A custom view for loading and displaying remote images.

### ViewModel

- **MealListViewModel.swift**: The view model responsible for fetching and managing the list of meals.
- **MealDetailViewModel.swift**: The view model responsible for fetching and managing detailed information about a selected meal.
- **MockAPIManager.swift**: A mock implementation of the APIManager protocol for testing purposes.
- **DynamicCodingKey.swift**: Helper struct for dynamic key decoding in MealDetails.

### APIs used
- https://themealdb.com/api.php 
- https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the list of meals in the  Dessert category
- https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its  ID

## Installation

1. Clone the repository:

```
[git clone https://github.com/yourusername/Fetch_TheMeal.git](https://github.com/dikshitapatel/Fetch_TheMeal.git)
```

2. Open the project in Xcode.

3. Build and run the app on a simulator or a physical iOS device.


## Tests

The project includes unit tests for the view models using the XCTest framework. The tests cover both success and failure scenarios for fetching meal data.

### Test Structure

#### ViewModelTests

- **MealListViewModelTests.swift**: Contains tests for the `MealListViewModel`. These tests verify that meals are fetched correctly and that errors are handled properly.
- **MealDetailViewModelTests.swift**: Contains tests for the `MealDetailViewModel`. These tests check the fetching of meal details and the handling of error scenarios.

#### Mock

- **MockAPIManager.swift**: A mock implementation of the `APIProtocol` for testing. This mock manager simulates network requests and provides predefined data or errors for testing purposes.

