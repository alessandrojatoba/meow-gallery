//
//  Meow_GalleryTests.swift
//  Meow GalleryTests
//
//  Created by Alessandro Jatoba on 07/02/25.
//

import XCTest

@testable import Meow_Gallery

final class Meow_GalleryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNoLoadCats() throws {
        let viewModel = CatViewModel()
        
        XCTAssertTrue(viewModel.cats.count == 0, "Cat list should have 0 elements after init")
    }
    
    func testLoadCats() throws {
        let viewModel = CatViewModel()

        let expectation = XCTestExpectation(description: "fetchCats")
        
        viewModel.fetchCats(reset: true, completionBlock: {
            _ in
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 10, enforceOrder: false)
        
        XCTAssertTrue(viewModel.cats.count == 10, "Cat list should have 10 elements initially")
    }
        
    func testLoadCatsTwice() throws {
        let viewModel = CatViewModel()

        let expectation = XCTestExpectation(description: "fetchCats")
        
        viewModel.fetchCats(reset: true, completionBlock: {
            _ in
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 10, enforceOrder: false)
        
        XCTAssertTrue(viewModel.cats.count == 10, "Cat list should have 10 elements after first fetch")
        
        let expectation2 = XCTestExpectation(description: "fetchCats2")
        
        viewModel.fetchCats(reset: false, completionBlock: {
            _ in
            
            expectation2.fulfill()
        })
        
        wait(for: [expectation2], timeout: 10, enforceOrder: false)
        
        XCTAssertTrue(viewModel.cats.count == 20, "Cat list should have 20 elements after second fetch")
    }
    
    func testLoadCats3Times() throws {
        let viewModel = CatViewModel()

        let expectation = XCTestExpectation(description: "fetchCats")
        
        viewModel.fetchCats(reset: true, completionBlock: {
            _ in
            
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: 10, enforceOrder: false)
        
        XCTAssertTrue(viewModel.cats.count == 10, "Cat list should have 10 elements after first fetch")
        
        let expectation2 = XCTestExpectation(description: "fetchCats2")
        
        viewModel.fetchCats(reset: false, completionBlock: {
            _ in
            
            expectation2.fulfill()
        })
        
        wait(for: [expectation2], timeout: 10, enforceOrder: false)
        
        XCTAssertTrue(viewModel.cats.count == 20, "Cat list should have 20 elements after second fetch")
        
        let expectation3 = XCTestExpectation(description: "fetchCats3")
        
        viewModel.fetchCats(reset: true, completionBlock: {
            _ in
            
            expectation3.fulfill()
        })
        
        wait(for: [expectation3], timeout: 10, enforceOrder: false)
        
        XCTAssertTrue(viewModel.cats.count == 10, "Cat list should have 10 element again after reset")
    }
    


}
