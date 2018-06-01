//
//  MiTabla1.swift
//  Hito1
//
//  Created by Alvaro Barrado on 5/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import Firebase

class MiTabla1: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tablamia:UITableView?
    var arPerfiles:[Perfil] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").addSnapshotListener() { (querySnapshot, err) in
            if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.arPerfiles = []
                    for document in querySnapshot!.documents {
                        let Perfiles:Perfil = Perfil()
                        Perfiles.sID=document.documentID
                        Perfiles.setMap(valores:document.data())
                        self.arPerfiles.append(Perfiles)
                        print("\(document.documentID) => \(document.data())")
                    }
                    print("------>>>>", self.arPerfiles.count)
                }
            self.tablamia?.reloadData()
        }
        tablamia?.delegate=self
        tablamia?.dataSource=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arPerfiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdamia = tableView.dequeueReusableCell(withIdentifier: "celdamia") as! micelda1
        celdamia.miLabel?.text=self.arPerfiles[indexPath.row].sFirst
        if arPerfiles[indexPath.row].sImg != nil{
            celdamia.mostrarImagen(uri: self.arPerfiles[indexPath.row].sImg!)
        }
        return celdamia
    }
    
    func refreshUI(){
        DispatchQueue.main.async(execute:{
            self.tablamia?.reloadData()
        })
    }
}
