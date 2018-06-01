//
//  VCLogin.swift
//  Hito1
//
//  Created by Alvaro Barrado on 9/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCLogin:  UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var txtfUsuario:UITextField?
    @IBOutlet var txtfContraseña:UITextField?
    @IBOutlet var buttonLogear:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.blConfg = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func accionbuttonLogear(){
        print(txtfUsuario?.text)
        print(txtfContraseña?.text)
        Auth.auth().signIn(withEmail: (txtfUsuario?.text)!, password: (txtfContraseña?.text)!) { (user, error) in
            if (user != nil){DataHolder.sharedInstance.firUser = user?.user
                let refPerfil =
                    DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document ((user?.user.uid)!)
                refPerfil?.getDocument{(document, error) in if document != nil{
                    DataHolder.sharedInstance.miPerfil.sID = document?.documentID
                    DataHolder.sharedInstance.miPerfil.setMap(valores:(document?.data())!)
                    print(DataHolder.sharedInstance.miPerfil.sFirst!)
                    self.performSegue(withIdentifier: "entrar", sender: self)
                }else{
                    print(error!)
                    }
                }
            }
        }
    }
}
