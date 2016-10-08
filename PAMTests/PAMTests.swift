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
    
    func testEmotion() {
        XCTAssertNil(Emotion(0, 5))
        XCTAssertNil(Emotion(1, 5))
        XCTAssertNil(Emotion(4, 0))
        XCTAssertNotNil(Emotion(4, 4))
    }
    
    func testPositiveAffectScore() {
        let emotion = Emotion(4, 1)!
        XCTAssertEqual(emotion.positiveAffectScore, 13)
    }
    
    func testNegativeAffectScore() {
        let emotion = Emotion(4, 1)!
        XCTAssertEqual(emotion.negativeAffectScore, 1)
    }
    
    func testEmotionTag() {
        for valence: UInt8 in 1...4 {
            for arousal: UInt8 in 1...4 {
                XCTAssertNotNil(Emotion(valence, arousal)?.tag)
            }
        }
    }
    
    func testEmotionIndex() {
        for valence: UInt8 in 1...4 {
            for arousal: UInt8 in 1...4 {
                XCTAssertNotNil(Emotion(valence, arousal)?.position)
            }
        }
    }
}
