//
//  LoadingViewOverlay.swift
//  desafio-enjoei
//
//  Created by Arthur Rocha on 10/02/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import Foundation

import UIKit

private let kTextLabelTag = 17131

class LoadingViewOverlay: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    private(set) var text: String?
    init(text: String? = nil) {
        super.init(frame: .zero)
        self.text = text
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    fileprivate func commonInit() {
        Bundle.main.loadNibNamed("LoadingViewOverlay", owner: self, options: nil)
        backgroundColor = .clear
        addContainerView(contentView)
        if text != nil {
            stackView.addArrangedSubview(createLabel(text!))
        }
    }
    func setText(_ text: String?) {
        self.text = text
        if let label = viewWithTag(kTextLabelTag) as? UILabel {
            if text == nil {
                label.removeFromSuperview()
            } else {
                DispatchQueue.main.async {
                    label.text = text
                }
            }
        } else {
            guard text != nil else { return }
            stackView.addArrangedSubview(createLabel(text!))
        }
    }
    private func createLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.font = UIFont(name: "Arial", size: 15.0)
        label.textAlignment = .center
        label.tag = kTextLabelTag
        return label
    }
}
