//
//  VCConfiguracion.swift
//  Hito1
//
//  Created by Alvaro Barrado on 18/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class VCConfiguracion: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.blConfg = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
