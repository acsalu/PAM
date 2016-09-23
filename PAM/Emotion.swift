//
//  PAMEmotion.swift
//  PAM
//
//  Created by Huai-Che Lu on 9/23/16.
//  Copyright © 2016 Cornell Tech. All rights reserved.
//

import Foundation

public struct Emotion {
    let valence: UInt8
    let arousal: UInt8
    
    public init?(_ valence: UInt8, _ arousal: UInt8) {
        guard 1 <= valence && valence <= 4 && 1 <= arousal && arousal <= 4 else {
            return nil
        }
        self.valence = valence
        self.arousal = arousal
    }
    
    public var positiveAffectScore: UInt8 {
        return 4 * valence + arousal - 4
    }
    
    public var negativeAffectScore: UInt8 {
        return 4 * (5 - valence) + arousal - 4
    }
    
    public var tag: String {
        return (Emotion.emotionTagDict[arousal]?[valence]!)!
    }
    
    public var index: UInt8 {
        return (4 - arousal) * 4 + valence
    }
    
    // [Arousal: [Valence: Tag]]
    private static let emotionTagDict: [UInt8:[UInt8: String]] = [
        4: [
            1: "afraid",
            2: "tense",
            3: "excited",
            4: "delighted"
        ],
        3: [
            1: "frustrated",
            2: "angry",
            3: "happy",
            4: "glad"
        ],
        2: [
            1: "miserable",
            2: "sad",
            3: "calm",
            4: "satisfied"
        ],
        1: [
            1: "gloomy",
            2: "tired",
            3: "sleepy",
            4: "serene"
        ]
    ]
}
