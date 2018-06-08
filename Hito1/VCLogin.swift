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
    
    func showAlert3() {
        //Mostramos al usuario en un alert los datos de su registro
        let str = String(format: "El usuario o contraseña es incorrecto, \n por favor, vuelva a escribirlos")
        let alertController = UIAlertController(title: "Dato incorrecto", message: str, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Volver", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
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
                    DataHolder.sharedInstance.fechaSeleccionada = Date()
                    DataHolder.sharedInstance.InicioRegla = false
                    DataHolder.sharedInstance.SigoRegla = false
                    DataHolder.sharedInstance.FinRegla = false
                    DataHolder.sharedInstance.Relaciones = false
                    DataHolder.sharedInstance.Pildora = false
                    self.performSegue(withIdentifier: "entrar", sender: self)
                }else{
                    print(error!)
                    }
                }
            }
            else{
                self.showAlert3()
                print("Usuario o contraseña incorrecto")
            }
        }
    }
}
