//
//  NoteDetailView.swift
//  TestApp
//
//  Created by cj on 16.02.2025.
//

import UIKit

class NoteDetailView: UIViewController, NoteDetailViewProtocol {
    var presenter: NoteDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        presenter?.viewDidLoad()
        print(presenter?.selectedNote?.name ?? "NOTHING")
    }
}
