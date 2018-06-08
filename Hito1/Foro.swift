//
//  Foro.swift
//  Hito1
//
//  Created by Alvaro Barrado on 25/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import Firebase

class Foro: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var TablaForo:UITableView?
    var arForos:[ArrayForos] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.firestoreDB?.collection("Foros").addSnapshotListener() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.arForos = []
                for document in querySnapshot!.documents {
                    let Foros:ArrayForos = ArrayForos()
                    Foros.sID=document.documentID
                    Foros.setMap(valores:document.data())
                    self.arForos.append(Foros)
                    print("\(document.documentID) => \(document.data())")
                }
                print("------>>>>", self.arForos.count)
            }
            self.TablaForo?.reloadData()
        }
        TablaForo?.delegate=self
        TablaForo?.dataSource=self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arForos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda") as! CeldaForo
        celda.Nombre?.text=self.arForos[indexPath.row].sID
        return celda
    }
    
    func refreshUI(){
        DispatchQueue.main.async(execute:{
            self.TablaForo?.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         DataHolder.sharedInstance.sIDseleccion=self.arForos[indexPath.row].sID
        self.performSegue(withIdentifier: "tran1", sender: self)
    }
    
    
}
