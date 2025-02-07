//
//  Meow_GalleryUITests.swift
//  Meow GalleryUITests
//
//  Created by Alessandro Jatoba on 07/02/25.
//

import XCTest

final class Meow_GalleryUITests: XCTestCase {
    
    // create a function to wait for prediction
    func waitNotExistance(for element: XCUIElement, timeout: Double = 5) {
        let notExists = NSPredicate(format: "exists != 1")
        let elementShown = expectation(for: notExists, evaluatedWith: element)
        wait(for: [elementShown], timeout: timeout, enforceOrder: false)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testCatListViewLoads() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let loading = app.descendants(matching: .any)["loading"]
        
        waitNotExistance(for: loading)
        
        // Check if the ListView is visible
        let catList = app.descendants(matching: .any)["cat-list"]
        
        XCTAssertTrue(catList.exists, "Cat list should be visible")
    }
    
    func testCatListTapFirstRow() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let loading = app.descendants(matching: .any)["loading"]
        
        waitNotExistance(for: loading)
        
        // Check if the ListView is visible
        let catList = app.descendants(matching: .any)["cat-list"]
        
        XCTAssertTrue(catList.exists, "Cat list should be visible")
        
        // Check if the first row exists and it is hittable
        let firstCat = catList.cells.firstMatch
        
        XCTAssertTrue(catList.exists && firstCat.isHittable, "First row should exist and be hittable")
        
        firstCat.tap()
        
        let catDetail = app.descendants(matching: .any)["cat-detail"]
        
        XCTAssertTrue(catDetail.waitForExistence(timeout: 5), "Detail view should exist")
    }
    
    func testCatListLoadMore() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let loading = app.descendants(matching: .any)["loading"]
        
        waitNotExistance(for: loading)
        
        // Check if the ListView is visible
        let catList = app.descendants(matching: .any)["cat-list"]
        
        XCTAssertTrue(catList.exists, "Cat list should be visible")
        
        let initialRows = catList.cells.count
        
        catList.swipeUp()
        
        let loadingMore = app.descendants(matching: .any)["loading-more"]
        
        waitNotExistance(for: loadingMore)
        
        let finalRows = catList.cells.count
        
        XCTAssertTrue(finalRows > initialRows, "final rows must be greater than initial")
    }
}
