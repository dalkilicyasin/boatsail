//
//  ProfilePageViewController.swift
//  boatsaily
//
//  Created by yasin on 25.06.2024.
//

import UIKit
import SnapKit

class ProfilePageViewController: UIViewController {
   // var viewModel: ProfilePageViewModel!
    var showProfileDetail: () -> () = {}
    var showCreateList: () -> () = {}
    
    lazy var infoListButton: UIButton = {
        let button = UIButton()
        button.setTitle("InfoList", for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.addTarget(self, action: #selector(infoListButtonAction), for: .touchUpInside)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var createListButton: UIButton = {
        let button = UIButton()
        button.setTitle("CreateList", for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.addTarget(self, action: #selector(createListButtonAction), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        self.uploadView()
    }
    
    @objc func infoListButtonAction() {
        
        self.showProfileDetail()
    }
    
    @objc func createListButtonAction() {
        self.showCreateList()
    }
}

extension ProfilePageViewController {
    
    func uploadView() {
        self.view.addSubview(infoListButton)
        self.view.addSubview(createListButton)
        
        infoListButton.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(200)
            make.leading.equalToSuperview().offset(104)
            make.top.equalToSuperview().offset(227)
        }
        
        createListButton.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(200)
            make.leading.equalToSuperview().offset(104)
            make.top.equalTo(infoListButton.snp.bottom).offset(20)
        }
    }
}
