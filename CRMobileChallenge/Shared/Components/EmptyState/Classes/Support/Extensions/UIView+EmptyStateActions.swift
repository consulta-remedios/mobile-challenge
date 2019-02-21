//
//  UIView+EmptyState.swift
//  EmptyState
//
//  Created by Adriano on 7/2/18.

import UIKit

private struct AssociatedKeys {
    static var emptyStateViewKey = "emptyStateView.key"
    static var oldEmptyStateKey = "oldState.key"
    static var tapGestureRecognizerKey = "tapGestureRecognizer.key"
    static var topConstraintKey = "topConstraint.key"
    static var bottomConstraintKey = "bottomConstraint.key"
    static var trailingConstraintKey = "trailingConstraint.key"
    static var leadingConstraintKey = "leadingConstraint.key"
}

extension UIView: EmptyStateActions {
    
    private var emptyStateView: UIView? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.emptyStateViewKey) as? UIView }
        set { objc_setAssociatedObject(self, &AssociatedKeys.emptyStateViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var oldEmptyState: EmptyStateRepresentable? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.oldEmptyStateKey) as? EmptyStateRepresentable }
        set { objc_setAssociatedObject(self, &AssociatedKeys.oldEmptyStateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var tapGestureRecognizerHandler: (() -> Void)? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.tapGestureRecognizerKey) as? (() -> Void) }
        set { objc_setAssociatedObject(self, &AssociatedKeys.tapGestureRecognizerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var topConstraint: NSLayoutConstraint {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.topConstraintKey) as! NSLayoutConstraint }
        set { objc_setAssociatedObject(self, &AssociatedKeys.topConstraintKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var bottomConstraint: NSLayoutConstraint {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.bottomConstraintKey) as! NSLayoutConstraint }
        set { objc_setAssociatedObject(self, &AssociatedKeys.bottomConstraintKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var trailingConstraint: NSLayoutConstraint {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.trailingConstraintKey) as! NSLayoutConstraint }
        set { objc_setAssociatedObject(self, &AssociatedKeys.trailingConstraintKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var leadingConstraint: NSLayoutConstraint {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.leadingConstraintKey) as! NSLayoutConstraint }
        set { objc_setAssociatedObject(self, &AssociatedKeys.leadingConstraintKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var emptyStateViewContainer: UIView {
        if let tableView = self as? UITableView {
            if tableView.backgroundView == nil {
                tableView.backgroundView = UIView()
            }
            return tableView.backgroundView!
        }
        
        return self
    }
    
    public func reloadEmptyState() {
        guard let emptyState = emptyStates.first(where: { $0.shouldDisplayHandler() }) else {
            return removeEmptyView()
        }

        if emptyState.uid == oldEmptyState?.uid {
            if let emptyStateView = emptyStateView as? EmptyStateView {
                emptyStateView.emptyState = emptyState
                updateConstrains(with: emptyState.edgeInsets)
            } else if let customView = emptyState.customView {
                showStateView(customView, edgeInsets: emptyState.edgeInsets)
            }
        } else {
            createEmptyView(with: emptyState)
        }
    }
    
    public func createEmptyView(with emptyState: EmptyStateRepresentable) {
        removeEmptyView()
        
        emptyState.willAppearHandler?()
        
        showStateView(emptyState.customView ?? EmptyStateView(with: emptyState), edgeInsets: emptyState.edgeInsets)
        
        oldEmptyState = emptyState
        emptyState.didAppearHandler?()
        
        emptyStateView?.addTapGestureRecognizer() {
            emptyState.tappedHandler?()
        }
        
        updateInteractionWithSubviews()
    }
    
    private func showStateView(_ view: UIView, edgeInsets: UIEdgeInsets) {
        let container = emptyStateViewContainer
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        bringSubviewToFront(view)

        leadingConstraint = view.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: edgeInsets.left)
        topConstraint = view.topAnchor.constraint(equalTo: container.topAnchor, constant: edgeInsets.top)
        trailingConstraint = view.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -edgeInsets.right)
        bottomConstraint = view.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -edgeInsets.bottom)
        
        NSLayoutConstraint.activate([
            leadingConstraint,
            topConstraint,
            trailingConstraint,
            bottomConstraint,
            view.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        emptyStateView = view
    }
    
    private func updateConstrains(with edgeInsets: UIEdgeInsets) {
        leadingConstraint.constant = edgeInsets.left
        topConstraint.constant = edgeInsets.top
        trailingConstraint.constant = -edgeInsets.right
        bottomConstraint.constant = -edgeInsets.bottom
    }
    
    private func updateInteractionWithSubviews() {
        if let scrollView = self as? UIScrollView {
            let enabled = emptyStateView == nil
            scrollView.setContentOffset(scrollView.contentOffset, animated: false)
            scrollView.isScrollEnabled = enabled
            scrollView.delaysContentTouches = enabled
        }
    }
    
    private func removeEmptyView() {
        emptyStateView?.removeFromSuperview()
        emptyStateView = nil
        
        oldEmptyState?.didDisappearHandler?()
        oldEmptyState = nil
        
        tapGestureRecognizerHandler = nil
        
        updateInteractionWithSubviews()
    }
    
    private func addTapGestureRecognizer(action: (() -> Void)?) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
        self.isUserInteractionEnabled = true
        tapGestureRecognizerHandler = action
    }
    
    @objc private func handleTapGesture(sender: UITapGestureRecognizer) {
        tapGestureRecognizerHandler?()
    }
    
}
