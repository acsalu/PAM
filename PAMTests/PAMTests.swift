//
//  PAMTests.swift
//  PAMTests
//
//  Created by Huai-Che Lu on 9/22/16.
//  Copyright © 2016 Cornell Tech. All rights reserved.
//

import XCTest
@testable import PAM

class PAMTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPositiveAffectScore() {
        let valence: Valence = 4
        let arousal: Arousal = 1
        XCTAssertEqual(positiveAffectScore(valence: valence, arousal: arousal), 13)
    }
    
    func testNegativeAffectScore() {
        let valence: Valence = 4
        let arousal: Arousal = 1
        XCTAssertEqual(negativeAffectScore(valence: valence, arousal: arousal), 1)
    }
    
}
