//
//  NoteListView.swift
//  TestApp
//
//  Created by cj on 15.02.2025.
//

import Foundation
import UIKit

class NoteListView: UIViewController, NoteListViewProtocol {
    var presenter: NoteListPresenterProtocol?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.register(NoteListNoteCell.self, forCellReuseIdentifier: NoteListNoteCell.reuseId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.frame = self.view.frame
    }
    
    func showData(_ data: [NoteEntity]) {
        self.tableView.reloadData()
        print(data)
    }
    
    func showError(_ error: any Error) {
        print(error)
    }
}

extension NoteListView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else if section == 1 {
            return presenter?.getItemCount ?? 0
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let note = presenter?.getItemAt(indexPath.row) else {
            return
        }
        presenter?.openDetailNote(note)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return UITableViewCell()
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteListNoteCell.reuseId, for: indexPath) as? NoteListNoteCell else {
                return UITableViewCell()
            }
            guard let note = presenter?.getItemAt(indexPath.row) else {
                return cell
            }
            cell.config(note: note)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
