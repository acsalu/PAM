//
//  PAMImage.swift
//  PAM
//
//  Created by Huai-Che Lu on 9/22/16.
//  Copyright © 2016 Cornell Tech. All rights reserved.
//

import Foundation

private enum Constant {
    static let bundleName = "Frameworks/PAM.framework/ResourceBundle.bundle"
    static let imageExtension = "jpg"
}

public typealias Valence = UInt8
public typealias Arousal = UInt8

private let emotionTagDict: [Arousal:[Valence: String]] = [
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

public func positiveAffectScore(valence: Valence, arousal: Arousal) -> UInt8 {
    return 4 * valence + arousal - 4
}

public func negativeAffectScore(valence: Valence, arousal: Arousal) -> UInt8 {
    return 4 * (5 - valence) + arousal - 4
}

public func getEmotionTag(valence: Valence, arousal: Arousal) -> String? {
    return emotionTagDict[arousal]?[valence]
}

public func getEmotionIndex(valence: Valence, arousal: Arousal) -> UInt8? {
    let index = (4 - arousal) * 4 + valence
    if index >= 1 && index <= 16 {
        return index
    }
    return nil
}

private func getDirName(valence: Valence, arousal: Arousal) -> String? {
    guard let emotionTag = getEmotionTag(valence: valence, arousal: arousal),
        let emotionIndex = getEmotionIndex(valence: valence, arousal: arousal) else {
            return nil
    }
    return "\(emotionIndex)_\(emotionTag)"
}

public class PAMImage {
    public static func loadAllImages(valence: Valence, arousal: Arousal) -> ([UIImage])? {
        guard let emotionIndex = getEmotionIndex(valence: valence, arousal: arousal) else {
                return nil
        }
        
        var images = [UIImage]()
        for i in 1...3 {
            let imagePath = Constant.bundleName.appending("/\(emotionIndex)_\(i)")
            let url = Bundle.main.url(forResource: imagePath, withExtension: Constant.imageExtension)
            let imageData = try! Data(contentsOf: url!)
            images.append(UIImage(data: imageData)!)
        }
        
        return images
    }
    
    public static func loadImage(forValence valence: Valence, andArousal arousal: Arousal, atIndex index: Int) -> UIImage? {
        guard let emotionIndex = getEmotionIndex(valence: valence, arousal: arousal) else {
                return nil
        }
        let imagePath = Constant.bundleName.appending("/\(emotionIndex)_\(index)")
        let url = Bundle.main.url(forResource: imagePath, withExtension: Constant.imageExtension)
        let imageData = try! Data(contentsOf: url!)
        
        return UIImage(data: imageData)
    }
    
    public static func loadRandomImage(forValence valence: Valence, andArousal arousal: Arousal) -> UIImage? {
        let index = Int(arc4random_uniform(3) + 1)
        return loadImage(forValence: valence, andArousal: arousal, atIndex: index)
    }
}
