//
//  NoteListNoteCell.swift
//  TestApp
//
//  Created by cj on 15.02.2025.
//

import UIKit

class NoteListNoteCell: UITableViewCell {
    static let reuseId = "noteListNoteCell"
    
    var doneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "selectionOn")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let titleLable = UILabel()
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        return titleLable
    }()
    
    var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func config(isSelected: Bool, title: String) {
        if isSelected {
            doneImage.image = UIImage(named: "selectionOn")
        } else {
            doneImage.image = UIImage(named: "selectionOff")
        }
        titleLabel.text = title
        descriptionLabel.text = "Сходить в спортзал или сделать тренировку дома. Не забыть про разминку и растяжку!"
        dateLabel.text = "10/02/2025"
    }
    
    private func setupUI() {
        contentView.addSubview(doneImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([doneImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                                     doneImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                                     doneImage.widthAnchor.constraint(equalToConstant: 25),
                                     doneImage.heightAnchor.constraint(equalToConstant: 25.0),
                                    
                                     titleLabel.leadingAnchor.constraint(equalTo: doneImage.trailingAnchor, constant: 10.0),
                                     titleLabel.centerYAnchor.constraint(equalTo: doneImage.centerYAnchor),
                                     titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
                                     
                                     descriptionLabel.leadingAnchor.constraint(equalTo: doneImage.trailingAnchor, constant: 10.0),
                                     descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
                                     descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5.0),
                                     
                                     dateLabel.leadingAnchor.constraint(equalTo: doneImage.trailingAnchor, constant: 10.0),
                                     dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10.0),
                                     dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
                                     dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0)
                                    ])
        
    }
}
