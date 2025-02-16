//
//  NoteDetailProtocol.swift
//  TestApp
//
//  Created by cj on 16.02.2025.
//

protocol NoteDetailViewProtocol: AnyObject {
}

protocol NoteDetailInteractorInputProtocol: AnyObject {
}

protocol NoteDetailInteractorOutputProtocol: AnyObject {
}

protocol NoteDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    var selectedNote: NoteEntity? { get set }
}

protocol NoteDetailRouterProtocol: AnyObject {
}
