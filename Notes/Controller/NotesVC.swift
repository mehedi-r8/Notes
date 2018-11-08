//
//  NotesVC.swift
//  Notes
//
//  Created by MEHEDI.R8 on 11/8/18.
//  Copyright © 2018 R8soft. All rights reserved.
//

import UIKit
import LocalAuthentication

class NotesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if noteArray[indexPath.row].lockStatus == .locked {
            authenticateBiometrices { (authenticated) in
                if authenticated {
                    let lockStatus = noteArray[indexPath.row].lockStatus
                    noteArray[indexPath.row].lockStatus = lockStatusFlipper(lockStatus)
                    DispatchQueue.main.async {
                        self.pushNoteFor(indexPath: indexPath)
                    }
                }
            }
        } else {
            pushNoteFor(indexPath: indexPath)
        }
    }
    
    func pushNoteFor(indexPath: IndexPath) {
        guard let noteDetailVC = storyboard?.instantiateViewController(withIdentifier: "NoteDetailsVC") as? NoteDetailsVC else {
            return
        }
        
        noteDetailVC.note = noteArray[indexPath.row]
        noteDetailVC.index = indexPath.row
        navigationController?.pushViewController(noteDetailVC, animated: true)
    }
    
    func authenticateBiometrices(completion: @escaping (Bool) -> Void) {
        let myContext = LAContext()
        let myLocalizedReasonString = "Your app uses Touch ID / Face ID to secure your notes"
        var authError: NSError?
        
        if #available(iOS 8.0, macOS 10.12.1, *){
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { (success, evaluateError) in
                    if success {
                        completion(true)
                    } else {
                        guard let evaluteErrorString = evaluateError?.localizedDescription else {
                            return
                        }
                        self.showAlert(withMessage: evaluteErrorString)
                        completion(false)
                    }
                }
                
            } else {
                guard let authErrorString = authError?.localizedDescription else {
                    return
                }
                self.showAlert(withMessage: authErrorString)
                completion(false)
            }
        }
    }
    
    func showAlert(withMessage message: String) {
        let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
    
}
