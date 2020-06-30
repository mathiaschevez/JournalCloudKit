//
//  EntryDetailViewController.swift
//  JournalCloudKit
//
//  Created by Mathias on 6/29/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry? {
        didSet {
            DispatchQueue.main.async {
                self.loadViewIfNeeded()
                self.updateViews()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        titleTextField.delegate = self
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
            let body = bodyTextView.text, !body.isEmpty else {return}
        
        EntryController.shared.createEntry(title: title, body: body) { (result) in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    func updateViews() {
        guard let entry = entry else {return}
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }

}
