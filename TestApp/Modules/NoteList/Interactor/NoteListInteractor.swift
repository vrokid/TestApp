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
        presenter?.dataFetched(notes)
    }
    func getData() -> [NoteEntity] {
        return notes
    }
}
