//
//  ViewControllerCollection.swift
//  Hito1
//
//  Created by Alvaro Barrado on 24/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit
import Firebase

class ViewControllerCollection: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DataHolderDelegate {
    @IBOutlet var tablamia:UICollectionView?
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
    }
    
    func DHDDescargaCiudadesCompleta(blFin: Bool) {
        if blFin{
            tablamia?.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return arPerfiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celdamia:micelda2CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "celdamia", for: indexPath) as! micelda2CollectionViewCell
        celdamia.lblNombre?.text = arPerfiles[indexPath.row].sFirst
        if arPerfiles[indexPath.row].sImg != nil{
            celdamia.mostrarImagen(uri: arPerfiles[indexPath.row].sImg!)
        }
        return celdamia
    }

    func refreshUI(){
        DispatchQueue.main.async(execute:{
            self.tablamia?.reloadData()
        })
    }
}
