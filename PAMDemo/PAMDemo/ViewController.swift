//
//  ViewController.swift
//  PAMDemo
//
//  Created by Huai-Che Lu on 10/3/16.
//  Copyright © 2016 Cornell Tech. All rights reserved.
//

import UIKit

import PAM

class ViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = CGSize(width: view.bounds.size.width, height: view.bounds.size.width)
        let frame = CGRect(origin: CGPoint(x: 0.0, y: 100.0), size: size)
        let assessmentSheet = PAMAssessmentSheet(frame: frame, option: .intermediate)
        assessmentSheet.delegate = self
        view.addSubview(assessmentSheet)
        
        label = UILabel(frame: CGRect(x: 0.0, y: 100.0, width: view.bounds.size.width, height: 100.0))
        label.textAlignment = .center
        view.addSubview(label)
    }

}

extension ViewController: PAMAssessmentSheetDelegate {
    func assessmentSheet(_: PAMAssessmentSheet, didSelectEmotion emotion: Emotion) {
        label.text = emotion.tag
    }
}

