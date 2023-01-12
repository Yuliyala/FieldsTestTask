//
//  MainViewController.swift
//  FieldsTestTask
//
//  Created by Yuliya Lapenak on 1/6/23.
//

import UIKit

final class MainTableViewController: UITableViewController{

    private var userModel = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getUserModel()
        tableView.register(MainTableViewCell.self)
        print(userModel)
    }

    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать", style: .plain, target: self, action: #selector(editingTapped))
    }
    
    @objc private func editingTapped() {
       let editingTableViewController = EditingViewController(userModel)
        navigationController?.pushViewController(editingTableViewController, animated: true)
    }
    private func getUserModel() {
        userModel = UserDefaultsHelper.getUserModel()
    }
}

// MARK: - UITableViewDataSource

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(MainTableViewCell.self) else {
            return UITableViewCell()
        }
        let nameField = Resources.NameFields.allCases[indexPath.row].rawValue
        let value = UserDefaultsHelper.getUserValue(Resources.NameFields.allCases[indexPath.row].rawValue)
        
        cell.configure(name: nameField, value: value)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

