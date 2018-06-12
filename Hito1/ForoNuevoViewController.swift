//
//  ForoNuevoViewController.swift
//  Hito1
//
//  Created by Alvaro Barrado on 12/6/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ForoNuevoViewController: UIViewController {
    @IBOutlet var Titulo:UITextField?
    @IBOutlet var Mensaje:UITextView?
    var arFN:[OForoNuevo] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func grabar(){
        DataHolder.sharedInstance.miOForo.sTitulo = Titulo?.text
        let sTransicionNotas:String = "Vforo"
        self.performSegue(withIdentifier: sTransicionNotas, sender: self)
        self.crearEvento()
    }
    
    func crearEvento(){
        let ev:OForoNuevo = OForoNuevo()
        ev.sTitulo = DataHolder.sharedInstance.TituloF
        DataHolder.sharedInstance.firestoreDB?.collection("Foros").addDocument(data: ev.getMap())
        self.arFN.append(ev)
        
        
    }

}
