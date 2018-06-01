//
//  ForoNuevo.swift
//  Hito1
//
//  Created by Alvaro Barrado on 25/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class ForoNuevo: UIViewController {
    @IBOutlet var Titulo:UITextField?
    @IBOutlet var MensajeC:UITextField?
    @IBOutlet var buttonGrabar:UIButton?
    var STitulo:String?
    var Tit:ForoNuevo = ForoNuevo()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//    func Gtitulo(){
//        DataHolder.sharedInstance.SaveT.sTitulo = Titulo?.text

//        let refPerfil = DataHolder.sharedInstance.firestoreDB?.collection("Foro").document((DataHolder.sharedInstance.firUser?.uid)!).setData(DataHolder.sharedInstance.sTitulo.getMap())
//
//    }

}
