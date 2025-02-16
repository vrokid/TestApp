//
//  NoteDetailBuilder.swift
//  TestApp
//
//  Created by cj on 16.02.2025.
//

class NoteDetailBuilder {
    static func createModule() -> NoteDetailView {
        let view = NoteDetailView()
        let presenter = NoteDetailPresenter()
        let interactor = NoteDetailInteractor()
        let router = NoteDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
