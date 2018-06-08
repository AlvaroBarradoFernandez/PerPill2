//
//  Evento.swift
//  Hito1
//
//  Created by Alvaro Barrado on 1/6/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class Evento: NSObject {
    var bInicioRegla:Bool?
    var bSigoRegla:Bool?
    var bFinRegla:Bool?
    var bRelaciones:Bool?
    var bPildora:Bool?
    var dFecha:Date?
    var sID:String?
    
    func setMap(valores:[String:Any]) {
        bInicioRegla = valores["InicioRegla"] as? Bool
        bSigoRegla = valores["SigoRegla"] as? Bool
        bFinRegla = valores["FinRegla"] as? Bool
        bRelaciones = valores["Relaciones"] as? Bool
        bPildora = valores["Pildora"] as? Bool
        dFecha = valores["Fecha"] as? Date
    }
    
    func getMap() -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp["InicioRegla"] = bInicioRegla
        mapTemp["SigoRegla"] = bSigoRegla
        mapTemp["FinRegla"] = bFinRegla
        mapTemp["Relaciones"] = bRelaciones
        mapTemp["Pildora"] = bPildora
        mapTemp["Fecha"] = dFecha
        return mapTemp
    }
}
