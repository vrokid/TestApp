//
//  NoteListProtocols.swift
//  TestApp
//
//  Created by cj on 15.02.2025.
//

protocol NoteListViewProtocol: AnyObject {
    func showData(_ data: [NoteEntity])
    func showError(_ error: Error)
}

protocol NoteListInteractorInputProtocol: AnyObject {
    func loadData()
    func getData() -> [NoteEntity]
}

protocol NoteListInteractorOutputProtocol: AnyObject {
    func dataFetched(_ notes: [NoteEntity])
    func didFailToFetchNotes(_ error: Error)
}

protocol NoteListPresenterProtocol: AnyObject {
    func viewDidLoad()
    var getItemCount: Int { get }
    func getItemAt(_ index: Int) -> NoteEntity?
    func openDetailNote(_ note: NoteEntity)
}

protocol NoteListRouterProtocol: AnyObject {
    func navigateToDetailNote(_ note: NoteEntity)
}
