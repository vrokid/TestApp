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
        titleLable.font = UIFont.systemFont(ofSize: 19.0)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        return titleLable
    }()
    
    var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
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
    
    func config(note: NoteEntity) {
        if note.isDone {
            doneImage.image = UIImage(named: "selectionOn")
            let attributes: [NSAttributedString.Key: Any] = [
                .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                .strikethroughColor: UIColor.gray,
                .foregroundColor: UIColor.gray
            ]
            let attributedString = NSMutableAttributedString(string: note.name, attributes: attributes)
            titleLabel.attributedText = attributedString
            descriptionLabel.textColor = .gray
            dateLabel.textColor = .gray
        } else {
            doneImage.image = UIImage(named: "selectionOff")
            titleLabel.attributedText = nil
            titleLabel.text = note.name
            descriptionLabel.textColor = UIColor.gray
            dateLabel.textColor = .gray
        }
        
        descriptionLabel.text = ""
        dateLabel.text = note.creationDate.formatDate
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
