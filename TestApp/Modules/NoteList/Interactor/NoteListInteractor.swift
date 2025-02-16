//
//  NoteListInteractor.swift
//  TestApp
//
//  Created by cj on 15.02.2025.
//

import Foundation

class NoteListInteractor: NoteListInteractorInputProtocol {
    weak var presenter: NoteListInteractorOutputProtocol?
    
    private var notes: [NoteEntity] = [NoteEntity(id: 1, name: "Clean the room", description: "Clean the room and put away all clothes", creationDate: Date(), isDone: true), NoteEntity(id: 2, name: "Buy groceries", description: "Buy groceries and milk", creationDate: Date(), isDone: false)]
    
    func loadData() {
        // load data
        NetworkService.shared.fetchNotes { [weak self] result in
            switch result {
            case .success(let notes):
                self?.notes = notes
                self?.presenter?.dataFetched(notes)
            case .failure(let error):
                self?.presenter?.didFailToFetchNotes(error)
            }
        }
    }
    func getData() -> [NoteEntity] {
        return notes
    }
}
