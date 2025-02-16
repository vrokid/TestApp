//
//  NoteListRouter.swift
//  TestApp
//
//  Created by cj on 15.02.2025.
//

import UIKit

class NoteListRouter: NoteListRouterProtocol {
    weak var viewController: UIViewController?
    
    func navigateToDetailNote(_ note: NoteEntity) {
        let noteDetailView = NoteDetailView()
        
        let noteDetailPresenter = NoteDetailPresenter()
        noteDetailPresenter.selectedNote = note
        
        noteDetailView.presenter = noteDetailPresenter
        
        viewController?.navigationController?.pushViewController(noteDetailView, animated: true)
    }
}
