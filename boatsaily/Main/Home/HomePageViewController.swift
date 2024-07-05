//
//  HomePageViewController.swift
//  boatsaily
//
//  Created by yasin on 24.06.2024.
//

import UIKit
import SnapKit

class HomePageViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Create Costumer Travel Date Picker"
        label.textAlignment = .center
        label.backgroundColor = .green
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        self.createViews()
    }
}

extension HomePageViewController {
  
    
    func createViews() {
        self.view.addSubview(self.label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(300)
        }
    }
}
