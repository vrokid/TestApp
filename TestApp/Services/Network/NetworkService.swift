//
//  NetworkService.swift
//  TestApp
//
//  Created by cj on 15.02.2025.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchNotes(completion: @escaping (Result<[NoteEntity], Error>) -> Void) {
        let urlString = "https://dummyjson.com/todos"
        guard let url = URL.init(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { _data, res, _err in
            if let err = _err {
                DispatchQueue.main.async {
                    completion(.failure(err))
                }
                return
            }
            
            guard let data = _data else { return }
            
            do {
                let todoDTO = try JSONDecoder().decode(TodoEntityDTO.self, from: data)
                let notes = todoDTO.todos.map { $0.toDomainModel() }
                DispatchQueue.main.async {
                    completion(.success(notes))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
