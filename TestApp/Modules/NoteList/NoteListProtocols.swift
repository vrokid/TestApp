//
//  NoteListProtocols.swift
//  TestApp
//
//  Created by cj on 15.02.2025.
//

protocol NoteListViewProtocol: AnyObject {
    func showData(_ data: [NoteEntity])
}

protocol NoteListInteractorInputProtocol: AnyObject {
    func loadData()
    func getData() -> [NoteEntity]
}

protocol NoteListInteractorOutputProtocol: AnyObject {
    func dataFetched(_ notes: [NoteEntity])
}

protocol NoteListPresenterProtocol: AnyObject {
    func viewDidLoad()
    var getItemCount: Int { get }
}

protocol NoteListRouterProtocol: AnyObject {}
