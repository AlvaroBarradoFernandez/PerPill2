//
//  ViewController.swift
//  FIRDBExample
//
//  Created by Belal Khan on 05/03/17.
//  Copyright © 2017 Belal Khan. All rights reserved.
//

import UIKit

//importing firebase
import Firebase
import FirebaseDatabase

class ForoNuevoViewController: UIViewController{
    
    
    
    //defining firebase reference var
    var ref: DatabaseReference?
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldGenre: UITextView!
    @IBOutlet var button:UIButton?
  
    @IBAction func boton(){

        let db = Firestore.firestore()
       db.collection("Foros").document(textFieldName.text!).setData([
            "Mensaje": textFieldGenre.text!
            ])
        db.collection("Foros").document(textFieldName.text!).collection("Mensaje").document("Mensaje").setData([
            "Mensaje": textFieldGenre.text!
            ])
        self.performSegue(withIdentifier: "Grabar", sender: self)
//        print("--------->>", db3)
//        ref?.child("Foross").childByAutoId().setValue(textFieldName.text)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        ref = Database.database().reference()
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
