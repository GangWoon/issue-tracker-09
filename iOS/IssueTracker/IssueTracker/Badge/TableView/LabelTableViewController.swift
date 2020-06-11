//
//  LabelTableViewController.swift
//  IssueTracker
//
//  Created by Cloud on 2020/06/11.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit
import Combine

final class LabelTableViewController: ReusableTableViewController {
    
    // MARK: - Properties
    private let headerViewTitle: String = "Label"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell(anyClass: LabelTableViewCell.self,
                     identifier: LabelTableViewCell.identifier)
    }
    
    // MARK: - Methods
    // MARK: DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier, for: indexPath) as? LabelTableViewCell else { return LabelTableViewCell() }
        
        guard let backgroundColor = UIColor(hex: "#e1f7d5") else { return cell }
        cell.apply(title: "feature",
                   description: "기능에 대한 레이블입니다.",
                   backgroundColor: backgroundColor)

        return cell
    }
    
    // MARK: Delegate
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ReusableHeaderView.identifier) as? ReusableHeaderView
        headerView?.apply(title: headerViewTitle)
        var subscriber: AnyCancellable?
        subscriber = headerView?.addButton.publisher(for: .touchUpInside)
            .map { control -> UIButton in
                guard let button = control as? UIButton else { return UIButton() }
                return button
        }.sink(receiveCompletion: { _ in
            subscriber?.cancel()
        }, receiveValue: { _ in
            let createViewController = CreatLabelViewController()
            self.present(createViewController, animated: true)
        })
        
        return headerView
    }
}
