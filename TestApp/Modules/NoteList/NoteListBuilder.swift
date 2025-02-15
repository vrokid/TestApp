//
//  NoteListBuilder.swift
//  TestApp
//
//  Created by cj on 15.02.2025.
//

class NoteListBuilder {
    static func createModule() -> NoteListView {
        let view = NoteListView()
        let presenter = NoteListPresenter()
        let interactor = NoteListInteractor()
        let router = NoteListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
