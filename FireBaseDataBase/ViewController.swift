//
//  ViewController.swift
//  FireBaseDataBase
//
//  Created by Qaisar Raza on 5/14/22.
//

import Firebase
import UIKit

class ViewController: UIViewController {
    
    // Give reference to realtime database
    private let database = Database.database().reference()
    
    let button : UIButton = {
        let button = UIButton()
        button.setTitle("  Add Entry  ", for: .normal)
        button.layer.cornerRadius = 10
        
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc private func addNewEntry() {
        let object : [String: Any] = [
            "Name": "Qaisar Raza" as NSObject,
            "Designation": "IOS Developer"
        ]
        database.child("SomeData\(Int.random(in: 0..<100))").setValue(object)
    }

}

