//
//  UIView+Extension.swift
//  desafio-consulta-remedios
//
//  Created by Arthur Rocha on 05/06/19.
//  Copyright © 2019 Arthur Rocha. All rights reserved.
//

import UIKit

let kLoadingViewTag: Int = 13131
extension UIView {
    var isDisplayingLoadingIndicator: Bool {
        return viewWithTag(kLoadingViewTag) != nil
    }
    @objc func displayLoadingIndicator(
        text: String? = nil,
        backgroundColor: UIColor = .white) {
        guard !isDisplayingLoadingIndicator else { return }
        let loadingOverlay = LoadingViewOverlay(text: text)
        loadingOverlay.tag = kLoadingViewTag
        loadingOverlay.backgroundColor = backgroundColor
        loadingOverlay.layer.masksToBounds = true
        addContainerView(loadingOverlay, onTop: true)
    }
    @objc func dismissLoadingIndicator() {
        viewWithTag(kLoadingViewTag)?.removeFromSuperview()
    }
    
    func addContainerView(_ containerView: UIView, onTop: Bool = false) {
        addSubview(containerView)
        
        if onTop {
            bringSubviewToFront(containerView)
        }
        
        tightConstrain(containerView)
    }
    
    func tightConstrain(_ containerView: UIView) {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func addWindowView(_ containerView: UIView, onTop: Bool = false){
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(containerView)
            tightWindowConstrain(containerView, window)
            return
        }else{
            addSubview(containerView)
        }
        if onTop {
            bringSubviewToFront(containerView)
        }
        tightConstrain(containerView)
    }
    
    func tightWindowConstrain(_ containerView: UIView, _ window: UIWindow){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: window.rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
    }
}

extension UIView {
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }
}
