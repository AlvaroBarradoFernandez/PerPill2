//
//  CosasDelForo.swift
//  Hito1
//
//  Created by Alvaro Barrado on 5/6/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class ArrayMensaje: NSObject {
    var sMensaje:String?
    var sID:String?

    func setMap(valores2:[String:Any]){
        sMensaje = valores2["Mensaje"] as? String
    }
    func getMap() -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp["Mensaje"] = sMensaje
        return getMap()
    }
    
    
}
