//
//  ForoNuevoViewController.swift
//  Hito1
//
//  Created by Alvaro Barrado on 12/6/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class ForoNuevoViewController: UIViewController {
    @IBOutlet var Titulo:UITextField?
    @IBOutlet var Mensaje:UITextView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func grabar(){
        let sTransicionNotas:String = "Vforo"
        self.performSegue(withIdentifier: sTransicionNotas, sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
