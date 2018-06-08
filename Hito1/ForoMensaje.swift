//
//  Foro.swift
//  Hito1
//
//  Created by Alvaro Barrado on 25/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import Firebase

class ForoMensaje: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var TablaMensaje:UITableView?
    var arM:[ArrayMensaje] = []
    var sID:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let strRuta:String = String(format: "/Foros/%@/Mensaje/",DataHolder.sharedInstance.sIDseleccion!)
        DataHolder.sharedInstance.firestoreDB?.collection(strRuta).addSnapshotListener() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.arM = []
                for document in querySnapshot!.documents {
                    let MensajeForo:ArrayMensaje = ArrayMensaje()
                    MensajeForo.sID=document.documentID
                    MensajeForo.setMap(valores2:document.data())
                    self.arM.append(MensajeForo)
                    print("\(document.documentID) => \(document.data())")
                }
                print("------>>>>", self.arM.count)
            }
            self.TablaMensaje?.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda2 = tableView.dequeueReusableCell(withIdentifier: "celda2") as! CeldaMensaje
        celda2.Mensaje?.text=self.arM[indexPath.row].sMensaje
        
        return celda2
    }
    
    func refreshUI(){
        DispatchQueue.main.async(execute:{
            self.TablaMensaje?.reloadData()
        })
    }
    
    
    
}

