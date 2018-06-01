//
//  VCRegistro.swift
//  Hito1
//
//  Created by Alvaro Barrado on 9/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCRegistro: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var txtfPass:UITextField?
    @IBOutlet var txtfPasscon:UITextField?
    @IBOutlet var txtfEmail:UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func clickRegistrar(){
        DataHolder.sharedInstance.miPerfil.iPass = txtfPass?.text
        DataHolder.sharedInstance.miPerfil.semail = txtfEmail?.text
        if (self.txtfPass?.text == self.txtfPasscon?.text){
            Auth.auth().createUser(withEmail: (txtfEmail?.text)!, password: (txtfPass?.text)!){(user, error) in
                if user != nil{
                    DataHolder.sharedInstance.firUser = user?.user
                    print("Las contraseñas coinciden")
                    self.performSegue(withIdentifier: "registrar", sender: self)
                }
            }
        }else{
            print("Las contraseñas no coinciden")
        }
    }
}

