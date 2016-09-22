//
//  PAMImage.swift
//  PAM
//
//  Created by Huai-Che Lu on 9/22/16.
//  Copyright © 2016 Cornell Tech. All rights reserved.
//

import Foundation

typealias Valence = UInt8
typealias Arousal = UInt8

func positiveAffectScore(valence: Valence, arousal: Arousal) -> UInt8 {
    return 4 * valence + arousal - 4
}

func negativeAffectScore(valence: Valence, arousal: Arousal) -> UInt8 {
    return 4 * (5 - valence) + arousal - 4
}
