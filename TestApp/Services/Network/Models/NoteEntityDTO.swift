//
//  NoteEntityDTO.swift
//  TestApp
//
//  Created by cj on 15.02.2025.
//

import Foundation

struct NoteEntityDTO: Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userId: Int
}

extension NoteEntityDTO {
    func toDomainModel() -> NoteEntity {
        return NoteEntity(id: self.id, name: self.todo, description: nil, creationDate: Date(), isDone: self.completed)
    }
}
