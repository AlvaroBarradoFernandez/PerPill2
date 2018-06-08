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

    func showAlert1() {
        let str = String(format: "Por favor cree uno nuevo")
        let alertController = UIAlertController(title: "Usuario ya existe", message: str, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Volver", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlert2() {
        let str = String(format: "Las contraseñas no coinciden, \n por favor introduzcalas de nuevo")
        let alertController = UIAlertController(title: "Contraseña incorrecta", message: str, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Volver", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
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
                }else{
                    self.showAlert1()
                    print("El usuario ya existe")
                }
            }
        }else{
            self.showAlert2()
            print("Las contraseñas no coinciden")
        }
    }
}

