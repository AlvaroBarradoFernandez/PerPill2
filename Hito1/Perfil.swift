//
//  Perfil.swift
//  Hito1
//
//  Created by Alvaro Barrado on 12/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    var sTitulo:String?
    var sID:String?
    var sFirst:String?
    var iPass:String?
    var semail:String?
    var iAge:Int?
    var fWeight:Float?
    var fHeight:Float?
    var sImg:String?
    var sDate:Date?
    var miImg:UIImage?
    
    func setMap(valores:[String:Any]) {
        sFirst = valores["first"] as? String
        iPass = valores["pass"] as? String
        semail = valores["email"] as? String
        iAge = valores["age"] as? Int
        fHeight = valores["height"] as? Float
        fWeight = valores["weight"] as? Float
        sImg = valores["url_image"] as? String
        sDate = valores["date"] as? Date
        
        print("****************************", sImg)
        if sImg != nil{
            descargarImagen()
        }
    }
    
    func descargarImagen(){
        
        print("-------")
        let imagenDes = DataHolder.sharedInstance.HMIMG[sImg!]
        if imagenDes != nil{
         //   imgMain?.image = imagenDes
            miImg = imagenDes
        }else{
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: sImg!)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                } else {
                   self.miImg =  UIImage(data: data!)
                    DataHolder.sharedInstance.HMIMG[self.sImg!] = self.miImg
                }
            }
        }
    }
    
    func getMap() -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp["first"] = sFirst
        mapTemp["pass"] = iPass
        mapTemp["email"] = semail
        mapTemp["age"] = iAge
        mapTemp["height"] = fHeight
        mapTemp["weight"] = fWeight
        mapTemp["url_image"] = sImg
        mapTemp["date"] = sDate
        
        return mapTemp
    }
    
    
    func crearEvento(){
        let ev:Evento = Evento()
        ev.bInicioRegla = DataHolder.sharedInstance.InicioRegla
        ev.bSigoRegla = DataHolder.sharedInstance.SigoRegla
        ev.bFinRegla = DataHolder.sharedInstance.FinRegla
        ev.bRelaciones = DataHolder.sharedInstance.Relaciones
        ev.bPildora = DataHolder.sharedInstance.Pildora
        ev.dFecha = DataHolder.sharedInstance.fechaSeleccionada
        let strRuta:String = String(format: "/Perfiles/%@/eventos", sID!)
        
        DataHolder.sharedInstance.firestoreDB?.collection(strRuta).addDocument(data: ev.getMap())
    }
    
}
