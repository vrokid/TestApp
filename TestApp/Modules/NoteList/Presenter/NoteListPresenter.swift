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
    
    func didFailToFetchNotes(_ error: Error) {
        view?.showError(error)
    }
    
    func getItemAt(_ index: Int) -> NoteEntity? {
        return interactor?.getData()[index]
    }
    
    func openDetailNote(_ note: NoteEntity) {
        router?.navigateToDetailNote(note)
    }
}
