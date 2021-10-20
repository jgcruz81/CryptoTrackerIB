//
//  ViewController.swift
//  CryptoTrackerIB
//
//  Created by Juan Cruz on 10/15/21.
//

import UIKit
//API Caller
//UI to shower different cryptos
//MVVM

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(
            CryptoTableViewCell.self,
            forCellReuseIdentifier: CryptoTableViewCell.identifier)
        return tableView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Crypto Tracker"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //creates a frame
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    //TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CryptoTableViewCell.identifier,
            for: indexPath
        //cast as CryptoTableViewCell else fatal error
        ) as? CryptoTableViewCell else {
            fatalError()
        }
        cell.textLabel?.text = "Hello World"
        return cell
    }
}

