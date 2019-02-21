//
//  EmptyStateView.swift
//  EmptyState
//
//  Created by Adriano on 6/5/18.
//

import UIKit

class EmptyStateView: UIView {
    
    // MARK: - Public Variables
    
    var emptyState: EmptyStateRepresentable? {
        didSet {
            setupUI()
        }
    }
    
    // MARK: - Private Variables
    // MARK: Outlets
    
    @IBOutlet private weak var imageContainerView: UIStackView?
    @IBOutlet private weak var image: UIImageView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var descriptionLabel: UILabel?
    @IBOutlet private weak var actionButton: UIButton?
    @IBOutlet private weak var contentView: UIView?
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    convenience init(with emptyState: EmptyStateRepresentable, frame: CGRect = .zero) {
        self.init(frame: frame)
        
        defer {
            self.emptyState = emptyState
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    // MARK: - Private Methods
    
    private func commonInit() {
        Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        setupContentView()
    }
    
    private func setupContentView() {
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    private func setupUI() {
        let style = emptyState?.style
        
        imageContainerView?.isHidden = emptyState?.image == nil
        image?.image = emptyState?.image
        
        titleLabel?.font = style?.titleFont
        titleLabel?.textColor = style?.titleColor
        titleLabel?.text = emptyState?.title
        
        descriptionLabel?.font = style?.textFont
        descriptionLabel?.textColor = style?.textColor
        descriptionLabel?.text = emptyState?.text
        
        actionButton?.isHidden = emptyState?.action == nil
        actionButton?.setTitle(emptyState?.action?.title, for: .normal)
        actionButton?.setTitleColor(emptyState?.action?.color, for: .normal)
        actionButton?.titleLabel?.font = emptyState?.action?.font
        
        contentView?.backgroundColor = style?.backgroundColor
    }
    
    // MARK: Actions
    
    @IBAction private func perfomEmptyStateAction() {
        emptyState?.action?.handler()
    }
    
}
