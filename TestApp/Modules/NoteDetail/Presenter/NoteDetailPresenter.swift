//
//  NoteDetailPresenter.swift
//  TestApp
//
//  Created by cj on 16.02.2025.
//

class NoteDetailPresenter: NoteDetailPresenterProtocol, NoteDetailInteractorOutputProtocol {
    weak var view: NoteDetailViewProtocol?
    var interactor: NoteDetailInteractorInputProtocol?
    var router: NoteDetailRouterProtocol?
    
    var selectedNote: NoteEntity?
    
    func viewDidLoad() {
    }
}
