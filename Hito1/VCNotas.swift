//
//  VCNotas.swift
//  Hito1
//
//  Created by Alvaro Barrado on 1/6/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class VCNotas: UIViewController {
    @IBOutlet var stwInicioRegla:UISwitch?
    @IBOutlet var stwSigoRegla:UISwitch?
    @IBOutlet var stwFinRegla:UISwitch?
    @IBOutlet var stwRelaciones:UISwitch?
    @IBOutlet var stwPildora:UISwitch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func guardarNotas(){
        var sTransicionNotas:String = "notas"
        self.performSegue(withIdentifier: sTransicionNotas, sender: self)
        DataHolder.sharedInstance.InicioRegla = (stwInicioRegla?.isOn)!
        DataHolder.sharedInstance.SigoRegla = (stwSigoRegla?.isOn)!
        DataHolder.sharedInstance.FinRegla = (stwFinRegla?.isOn)!
        DataHolder.sharedInstance.Relaciones = (stwRelaciones?.isOn)!
        DataHolder.sharedInstance.Pildora = (stwPildora?.isOn)!
        DataHolder.sharedInstance.miPerfil.crearEvento()
    }
}
