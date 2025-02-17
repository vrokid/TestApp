//
//  PlaceholderTextView.swift
//  TestApp
//
//  Created by cj on 17.02.2025.
//

import UIKit

class PlaceholderTextView: UITextView {
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    
    override var text: String! {
        didSet {
            placeholderLabel.isHidden = !text.isEmpty
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupPlaceholder()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPlaceholder()
    }
    
    func config(placeholderFont: UIFont, fontColor: UIColor) {
        self.placeholderLabel.font = placeholderFont
        self.placeholderLabel.textColor = fontColor
    }
        
    private func setupPlaceholder() {
        addSubview(placeholderLabel)
        placeholderLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
            
        // Observe text changes
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextView.textDidChangeNotification, object: nil)
    }
        
    @objc private func textDidChange() {
        placeholderLabel.isHidden = !self.text.isEmpty
    }
        
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
