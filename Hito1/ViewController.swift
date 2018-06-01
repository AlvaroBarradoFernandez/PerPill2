//
//  ViewController.swift
//  Hito1
//
//  Created by Alvaro Barrado on 4/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var txtDate:UIDatePicker?
    @IBOutlet var txtfHeight:UITextField?
    @IBOutlet var txtfWeight:UITextField?
    @IBOutlet var txtfUser:UITextField?
    @IBOutlet var txtfAge:UITextField?
    @IBOutlet var buttonaceptar:UIButton?
    @IBOutlet var imgView:UIImageView?
    let imagePicker:UIImagePickerController=UIImagePickerController()
    var imgData:Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil{
               // self.performSegue(withIdentifier: "entrar", sender: self)
            }
        }
        imagePicker.delegate = self
        if DataHolder.sharedInstance.blConfg == true{
            txtfUser?.text = DataHolder.sharedInstance.miPerfil.sFirst
            txtfAge?.text = String(format: "%d", DataHolder.sharedInstance.miPerfil.iAge!)
            txtfWeight?.text = String(format: "%f", DataHolder.sharedInstance.miPerfil.fWeight!)
            txtfHeight?.text = String(format: "%f", DataHolder.sharedInstance.miPerfil.fHeight!)
            txtDate?.date = DataHolder.sharedInstance.miPerfil.sDate!
            imgView?.image = DataHolder.sharedInstance.miPerfil.miImg
        }
    }
    
    func showAlert() {
        //Mostramos al usuario en un alert los datos de su registro
        let str = String(format: "Datos de tu registro: \n Nombre: %@  \n Fecha última regla: %@ \n Edad: %d \n Altura: %f \n Peso: %f", DataHolder.sharedInstance.miPerfil.sFirst!, DataHolder.sharedInstance.miPerfil.sDate! as CVarArg,
            DataHolder.sharedInstance.miPerfil.iAge!, DataHolder.sharedInstance.miPerfil.fHeight!, DataHolder.sharedInstance.miPerfil.fWeight!)
        let alertController = UIAlertController(title: "Registro", message: str, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Volver", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func guardarPerfil(){
        DataHolder.sharedInstance.miPerfil.sFirst = txtfUser?.text
        DataHolder.sharedInstance.miPerfil.iAge = Int((txtfAge?.text)!)
        DataHolder.sharedInstance.miPerfil.fWeight = Float((txtfWeight?.text)!)
        DataHolder.sharedInstance.miPerfil.fHeight = Float((txtfHeight?.text)!)
        DataHolder.sharedInstance.miPerfil.sDate = txtDate?.date
        let refPerfil = DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((DataHolder.sharedInstance.firUser?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap())
        
    }

    @IBAction func accionBotonGaleria(){
        imagePicker.allowsEditing = false;
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func accionBotonCamera(){
        imagePicker.allowsEditing = false;
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func accionVolver() {
        var sTransicionV:String = "PerfilALogin"
        if DataHolder.sharedInstance.blConfg == true{
            sTransicionV = "AceptaAConfiguracion"
        }
        self.performSegue(withIdentifier: sTransicionV, sender: self)
    }
    
    @IBAction func accionBotonSubir(){
        var sTransicionA:String = "PerfilALogin"
        
        if DataHolder.sharedInstance.blConfg == true{
            sTransicionA = "AceptaAConfiguracion"
        }
        let ruta:String = String(format: "tutorial/%@/miimagen.jpg", (DataHolder.sharedInstance.firUser?.uid)!)
        let imagenRef = DataHolder.sharedInstance.firStorageRef?.child(ruta)
        let uploadTask = imagenRef?.putData(imgData!,metadata:nil){
            (metadata, error) in
            guard let metadata = metadata else{
                return 
            }
         
            imagenRef?.downloadURL { (url, error) in
                DataHolder.sharedInstance.miPerfil.sImg = url?.absoluteString
                self.guardarPerfil()
                self.performSegue(withIdentifier: sTransicionA, sender: self)
            }
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("---->")
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        imgData = UIImageJPEGRepresentation(img!, 0.5)! as Data
        imgView?.image = img
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       self.dismiss(animated: true, completion: nil)
    }
}




