//
//  Alert.swift
//  Hito1
//
//  Created by Alvaro Barrado on 17/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class Alert: UIViewController {

    @IBOutlet weak var displayLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayLbl.text = "Press Save"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        let alertView = UIAlertController(title: "Save", message: "Do you really want to save?", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            self.displayLbl.text = "Save Canceled"
        }
        let save = UIAlertAction(title: "Save", style: .default) { (action) in
            self.displayLbl.text = "Save Successfull"
        }
        alertView.addAction(cancel)
        alertView.addAction(save)
        present(alertView, animated: true, completion: nil)
    }
}


