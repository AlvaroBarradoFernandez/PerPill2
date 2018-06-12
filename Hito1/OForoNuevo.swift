//
//  OForoNuevo.swift
//  Hito1
//
//  Created by Alvaro Barrado on 12/6/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class OForoNuevo: NSObject {
    var sTitulo:String?
    var sMensaje:String?
    
    
    func setMap(valores:[String:Any]) {
        sTitulo = valores["Foros"] as? String
        sMensaje = valores["Mensaje"] as? String
}
    
    func getMap() -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp["Foros"] = sTitulo
        mapTemp["Mensaje"] = sMensaje
        return getMap()
    }
    
    
}

