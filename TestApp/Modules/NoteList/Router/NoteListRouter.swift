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
        let noteDetailView = NoteDetailBuilder.createModule()
        
        noteDetailView.presenter?.selectedNote = note
        
        viewController?.navigationController?.pushViewController(noteDetailView, animated: true)
    }
}
