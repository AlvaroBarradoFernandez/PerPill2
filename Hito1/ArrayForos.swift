//
//  ArrayForos.swift
//  Hito1
//
//  Created by Alvaro Barrado on 25/5/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class ArrayForos: NSObject {
    var sForo:String?
    var sID:String?
    func setMap(valores:[String:Any]){
        sForo = valores["Foros"] as? String
    }
    func getMap() -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp["Foros"] = sForo
        return getMap()
}
//    func MensajeCrear(){
//        let ev:ObjetosForoNuevo = ObjetosForoNuevo()
//        ev.sTituloF = DataHolder.sharedInstance.TituloF
//        ev.sMensajeF = DataHolder.sharedInstance.MensajeF
//        let strRuta:String = String(format: "/Foros/%@/Mensaje/",DataHolder.sharedInstance.sIDseleccion!)
//    DataHolder.sharedInstance.firestoreDB?.collection(strRuta).addDocument(data:ev.getMap()).documentID
//    }
}
