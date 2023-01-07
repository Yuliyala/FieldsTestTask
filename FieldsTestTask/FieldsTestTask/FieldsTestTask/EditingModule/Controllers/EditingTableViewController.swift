//
//  EditingTableViewController.swift
//  FieldsTestTask
//
//  Created by Yuliya Lapenak on 1/6/23.
//

import UIKit

final class EditingTableViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tableView.register(TextViewTableViewCell.self, forCellReuseIdentifier: TextViewTableViewCell.idTextViewCell)
    }
    
    private func setupViews() {
        title = "Редактирование"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(editingTapped))
    }
    
    @objc private func editingTapped() {
        print("Tap")
    }
}

// MARK: - UITableViewDataSource

extension EditingTableViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.idTextViewCell, for: indexPath) as? TextViewTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0...2:
            let nameField = Resources.NameFields.allCases[indexPath.row].rawValue
            cell.nameTextViewDelegate = self
            if indexPath.row == 1 {
                cell.configure(name: nameField, scrollEnable: false)
            } else {
                cell.configure(name: nameField, scrollEnable: true)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension EditingTableViewController{
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

extension EditingTableViewController: NameTextViewProtocol {
    func changeSize() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}