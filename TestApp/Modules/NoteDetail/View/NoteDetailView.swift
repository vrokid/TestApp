//
//  NoteDetailView.swift
//  TestApp
//
//  Created by cj on 16.02.2025.
//

import UIKit

class NoteDetailView: UIViewController, NoteDetailViewProtocol {
    var presenter: NoteDetailPresenterProtocol?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .black
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private let titleTextView: PlaceholderTextView = {
        let textView = PlaceholderTextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .black
        let font = UIFont.systemFont(ofSize: 26.0, weight: .bold)
        textView.placeholder = "Заголовок"
        textView.config(placeholderFont: font, fontColor: .gray)
        textView.font = font
        return textView
    }()
    
    private let dateLabel: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.backgroundColor = .black
        date.font = UIFont.systemFont(ofSize: 11.0, weight: .light)
        return date
    }()
    
    private let descriptionTextView: PlaceholderTextView = {
        let textView = PlaceholderTextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .black
        let font = UIFont.systemFont(ofSize: 18.0, weight: .light)
        textView.placeholder = "Описание"
        textView.config(placeholderFont: font, fontColor: .gray)
        textView.font = font
        return textView
    }()
    
    var titleTextViewHeight: NSLayoutConstraint?
    var descriptionTextViewHeight: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        presenter?.viewDidLoad()
        titleTextView.text = presenter?.selectedNote?.name
        titleTextView.delegate = self
        descriptionTextView.delegate = self
        dateLabel.text = presenter?.selectedNote?.creationDate.formatDate
        descriptionTextView.text = presenter?.selectedNote?.description
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.layoutIfNeeded()
        titleTextViewHeight = titleTextView.heightAnchor.constraint(equalToConstant: titleTextView.contentSize.height)
        titleTextViewHeight?.isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: dateLabel.font.lineHeight + 5).isActive = true
        descriptionTextViewHeight = descriptionTextView.heightAnchor.constraint(equalToConstant: descriptionTextView.contentSize.height)
        descriptionTextViewHeight?.isActive = true
        self.view.layoutIfNeeded()
    }
    
    private func setupUI() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(titleTextView)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(descriptionTextView)

        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0),
                                     
                                     contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0.0),
                                     contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0.0),
                                     contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 0.0),
                                     contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0.0),
                                     contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1.0),
                                     
                                     titleTextView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0),
                                     titleTextView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0),
                                     titleTextView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10.0),
                                    
                                     dateLabel.topAnchor.constraint(equalTo: self.titleTextView.bottomAnchor, constant: 0.0),
                                     dateLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 14.0),
                                     dateLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10.0),
                                     dateLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1.0),
                                     
                                     descriptionTextView.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 10.0),
                                     descriptionTextView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0),
                                     descriptionTextView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10.0),
                                     descriptionTextView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0)
                                    ])
    }
}

extension NoteDetailView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("did begin")
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("should begin")
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == titleTextView {
            if text == "\n" {
                textView.resignFirstResponder()
                return false
            }
            return true
        }
        return true
    }

    
    func textViewDidChange(_ textView: UITextView) {
        if textView == titleTextView {
            titleTextViewHeight?.constant = textView.contentSize.height
            self.view.layoutIfNeeded()
        } else if textView == descriptionTextView {
            descriptionTextViewHeight?.constant = textView.contentSize.height
            self.view.layoutIfNeeded()
        }
    }
}
