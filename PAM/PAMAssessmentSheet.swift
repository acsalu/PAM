//
//  PAMAssessmentSheet.swift
//  PAM
//
//  Created by Huai-Che Lu on 9/23/16.
//  Copyright © 2016 Cornell Tech. All rights reserved.
//

import Foundation

public protocol PAMAssessmentSheetDelegate {
    func assessmentSheet(_: PAMAssessmentSheet, didSelectEmotion emotion: Emotion)
}

public enum PAMAssessmentSheetOption: Int {
    case minimum = 4
    case intermediate = 8
    case full = 16
    
    static let emotionTable: [PAMAssessmentSheetOption: [Emotion]] = [
        .minimum: [
            Emotion(1, 1)!, Emotion(1, 4)!, Emotion(4, 1)!, Emotion(4, 4)!
        ],
        .intermediate: [
            Emotion(1, 1)!, Emotion(2, 2)!, Emotion(3, 3)!, Emotion(4, 4)!,
            Emotion(4, 1)!, Emotion(3, 2)!, Emotion(2, 3)!, Emotion(1, 4)!
        ],
        .full: [
            Emotion(1, 1)!, Emotion(1, 2)!, Emotion(1, 3)!, Emotion(1, 4)!,
            Emotion(2, 1)!, Emotion(2, 2)!, Emotion(2, 3)!, Emotion(2, 4)!,
            Emotion(3, 1)!, Emotion(3, 2)!, Emotion(3, 3)!, Emotion(3, 4)!,
            Emotion(4, 1)!, Emotion(4, 2)!, Emotion(4, 3)!, Emotion(4, 4)!
        ]
    ]
}

open class PAMAssessmentSheet: UIView {
    var buttons = [UIButton]()
    var rows = [UIStackView]()
    open var delegate: PAMAssessmentSheetDelegate?
    var option: PAMAssessmentSheetOption!
    
    let collectionView = UICollectionView()
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let reuseIdentifier = "PAMCell"
    
    public init(frame: CGRect, option: PAMAssessmentSheetOption) {
        super.init(frame: frame)
        self.option = option
        
        setUpCollectionView()
        self.addSubview(collectionView)
        
//        let width = frame.size.width
//        let buttonWidth = width / CGFloat(option.rawValue)
//        for i in 0..<option.rawValue {
//            let button = UIButton(frame: CGRect(x: buttonWidth * CGFloat(i), y: 0.0, width: buttonWidth, height: buttonWidth))
//            button.addTarget(self, action: #selector(buttonSelected(_:)), for: .touchUpInside)
//            self.buttons.append(button)
//        }
    }
    
    func setUpCollectionView() {
        collectionView.register(PAMEmotionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let equalWidthConstraint = NSLayoutConstraint(
            item: collectionView, attribute: .width, relatedBy: .equal,
            toItem: self, attribute: .width, multiplier: 1.0, constant: 0.0)
        let equalHeightConstraint = NSLayoutConstraint(
            item: collectionView, attribute: .height, relatedBy: .equal,
            toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)

        collectionView.addConstraint(equalWidthConstraint)
        collectionView.addConstraint(equalHeightConstraint)
    }
    
    func buttonSelected(_ sender: UIButton) {
        guard let index = self.buttons.index(of: sender) else {
            return
        }
        
        guard let emotion = PAMAssessmentSheetOption.emotionTable[self.option]?[index] else {
            return
        }
        self.delegate?.assessmentSheet(self, didSelectEmotion: emotion)
    }
}

extension PAMAssessmentSheet: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected! \(indexPath)")
    }
}

extension PAMAssessmentSheet: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.option.rawValue
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PAMEmotionCell
        if let emotion = PAMAssessmentSheetOption.emotionTable[option]?[indexPath.row] {
            cell.imageView.image = PAMImage.loadRandomImage(forEmotion: emotion)
        }
        return cell
    }
}
