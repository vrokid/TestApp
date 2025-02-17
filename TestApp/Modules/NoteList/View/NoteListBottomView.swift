//
//  NoteListBottomView.swift
//  TestApp
//
//  Created by cj on 17.02.2025.
//

import UIKit

class NoteListBottomView: UIView {
    
    private let taskNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Задач"
        return label
    }()
    
    private let noteImage: UIImageView = {
        let noteImage = UIImageView(image: UIImage(named: "createNote"))
        noteImage.translatesAutoresizingMaskIntoConstraints = false
        noteImage.contentMode = .scaleAspectFit
        return noteImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(blurView)
        blurView.contentView.addSubview(taskNumber)
        blurView.contentView.addSubview(noteImage)
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0),
            blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0),
            
            taskNumber.centerXAnchor.constraint(equalTo: blurView.centerXAnchor, constant: 0.0),
            taskNumber.topAnchor.constraint(equalTo: blurView.topAnchor, constant: 15.0),
            
            noteImage.trailingAnchor.constraint(equalTo: blurView.trailingAnchor, constant: -20.0),
            noteImage.widthAnchor.constraint(equalToConstant: 20.0),
            noteImage.heightAnchor.constraint(equalToConstant: 20.0),
            noteImage.centerYAnchor.constraint(equalTo: taskNumber.centerYAnchor, constant: -3.0)
        ])
    }
}
