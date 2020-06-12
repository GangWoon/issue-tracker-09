//
//  CreatLabelViewController.swift
//  IssueTracker
//
//  Created by 임승혁 on 2020/06/11.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

final class CreatLabelViewController: CategoryFormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func makeConstraintsContentView() {
        super.makeConstraintsContentView()
        contentView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.85)
            make.height.equalTo(contentView.snp.width)
        }
    }
}
