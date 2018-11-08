//
//  NotesVC.swift
//  Notes
//
//  Created by MEHEDI.R8 on 11/8/18.
//  Copyright © 2018 R8soft. All rights reserved.
//

import UIKit

class NotesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as? NoteCell else {
            return UITableViewCell()
        }
        let note = noteArray[indexPath.row]
        cell.configureCell(note: note)
        return cell
    }
}
