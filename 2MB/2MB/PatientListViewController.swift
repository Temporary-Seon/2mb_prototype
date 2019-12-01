//
//  PatientListViewController.swift
//  2MB
//
//  Created by 조선우 on 28/11/2019.
//  Copyright © 2019 조선우. All rights reserved.
//

import UIKit

class PatientListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorColor = UIColor.white
        tv.allowsSelection = true
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        
        tableview.delegate = self
        tableview.dataSource = self
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        
        tableview.register(ThirtyDayCell.self, forCellReuseIdentifier: "cellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ThirtyDayCell
        cell.dayLabel.text = cellLabel(indexpath: indexPath.row)
        
        return cell
    }
    
    func cellLabel (indexpath: Int) -> String {
        var celllabel: String = ""
        
        switch indexpath {
        case 0:
            celllabel = "성수진"
        case 1:
            celllabel = "김지수"
        case 2:
            celllabel = "정영문"
        case 3:
            celllabel = "김민수"
        case 4:
            celllabel = "공기자"
        case 5:
            celllabel = "송아름"
        case 6:
            celllabel = "박주원"
        case 7:
            celllabel = "안하은"
        case 8:
            celllabel = "박도윤"
        case 9:
            celllabel = "송민희"
        default: ()
        }
    
        return celllabel
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func unwindVC1 (segue: UIStoryboardSegue) {
        self.tableview.reloadData()
    }
}
