# MeowGallery

MeowGallery is an iOS application built with SwiftUI that displays a collection of cat images along with breed details. It follows the **MVVM** architecture and includes pagination, loading indicators, and unit/UI tests.

## 📂 Project Structure

```
MeowGallery/
│-- Service/
│   ├── CatAPIService.swift
│-- View/
│   ├── CatListView.swift
│   ├── CatDetailView.swift
│-- ViewModel/
│   ├── CatViewModel.swift
│-- Model/
│   ├── Cat.swift
│   ├── Breed.swift
```

### **🛠 Service (MeowGallery/Service)**

#### `CatAPIService.swift`
Handles all network requests to fetch cat images and breed details from **TheCatAPI**.

- `fetchCats(page: Int, limit: Int) -> [Cat]`: Fetches a paginated list of cat images.
- Uses `URLSession` and `JSONDecoder` for network communication.

### **📱 View (MeowGallery/View)**

#### `CatListView.swift`
Displays a list of cat images with infinite scrolling (pagination support).
- Shows the first breed name below each image.
- Implements a `ProgressView` while loading images.
- Navigates to `CatDetailView` when tapping on a cat.

#### `CatDetailView.swift`
Displays detailed breed information, including:
- **Basic Info:** Origin, lifespan, weight.
- **Temperament & Traits:** Intelligence, social needs, grooming, hypoallergenic, etc.
- **Ratings:** Dog-friendly, child-friendly, adaptability, shedding level, and more.

### **🎯 ViewModel (MeowGallery/ViewModel)**

#### `CatViewModel.swift`
Manages the app’s state, handling:
- Data fetching via `CatAPIService`.
- Pagination logic.
- Error handling.
- Loading state.

### **🐾 Model (MeowGallery/Model)**

#### `Cat.swift`
Represents a cat image with an associated breed.

#### `Breed.swift`
Represents detailed breed information, including:
- Name, origin, lifespan, temperament, and Wikipedia URL.
- Ratings: Intelligence, social needs, stranger-friendly, vocalization, etc.
- Binary traits: Indoor, lap cat, rare, hypoallergenic, etc.

## 🚀 Features

✅ Fetch and display cat images with pagination
✅ Show breed details with ratings & descriptions
✅ Handle loading states with a spinning indicator
✅ Navigate between list and detail views
✅ Unit and UI tests for reliability

## Screenshots

| <img src="screenshots/list-view.png?raw=true" width="200" /> | <img src="screenshots/detail-view.png?raw=true" width="200" /> |
 
## 🏗 Installation & Usage

1. Clone this repository:
   ```sh
   git clone https://github.com/alessandrojatoba/meow-gallery.git
   cd MeowGallery
   ```

2. Open `MeowGallery.xcodeproj` in Xcode.

3. Build and run the app on a simulator or device.

## 🧪 Testing

- **Unit Tests:** Test `CatViewModel` logic using XCTest.
- **UI Tests:** Verify `CatListView` scrolling and navigation with `XCTestUI`.

## 📜 License
MIT License. Feel free to use and modify!

---
🐱 Built with ❤️ using SwiftUI!

