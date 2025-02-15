//
//  NoteListPresenter.swift
//  TestApp
//
//  Created by cj on 15.02.2025.
//

class NoteListPresenter: NoteListPresenterProtocol, NoteListInteractorOutputProtocol {
    weak var view: NoteListViewProtocol?
    var interactor: NoteListInteractorInputProtocol?
    var router: NoteListRouterProtocol?
    
    var getItemCount: Int {
        return interactor?.getData().count ?? 0
    }
    
    func viewDidLoad() {
        interactor?.loadData()
    }
    
    func dataFetched(_ notes: [NoteEntity]) {
        view?.showData(notes)
    }
}
