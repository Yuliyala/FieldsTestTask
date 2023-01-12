//
//  EditingTableView.swift
//  FieldsTestTask
//
//  Created by Yuliya Lapenak on 1/10/23.
//

import UIKit

class EditingTableView: UITableView {
  
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        register(TextViewTableViewCell.self)
        register(DatePickerTableViewCell.self)
        register(PickerViewTableViewCell.self )
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDataSource

extension EditingTableView: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let nameField = Resources.NameFields.allCases[indexPath.row].rawValue
        
        switch indexPath.row {
        case 0...2:
            guard let cell = self.dequeueReusableCell(TextViewTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.nameTextViewDelegate = self
            if indexPath.row == 1 {
                cell.configure(name: nameField, scrollEnable: false)
            } else {
                cell.configure(name: nameField, scrollEnable: true)
            }
            return cell
        case 3 :
            guard let cell = self.dequeueReusableCell(DatePickerTableViewCell.self) else {
                return UITableViewCell()
            }
                cell.configure(name: nameField)
            return cell
        case 4 :
            guard let cell = self.dequeueReusableCell(PickerViewTableViewCell.self) else {
                return UITableViewCell()
            }
                cell.configure(name: nameField)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension EditingTableView: UITableViewDelegate{
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

extension EditingTableView: NameTextViewProtocol {
    func changeSize() {
        beginUpdates()
        endUpdates()
    }
}
