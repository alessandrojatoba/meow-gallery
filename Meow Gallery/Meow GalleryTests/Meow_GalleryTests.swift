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
    


}
