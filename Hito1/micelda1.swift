//
//  micelda1.swift
//  Hito1
//
//  Created by Alvaro Barrado on 5/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit



class micelda1: UITableViewCell {
@IBOutlet var miLabel:UILabel?
@IBOutlet var miImagen:UIImageView?
    var ImagenDescargada:UIImage?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func mostrarImagen(uri:String){
        self.miImagen?.image = nil
        let imagenDes = DataHolder.sharedInstance.HMIMG[uri]
        if imagenDes != nil{
            miImagen?.image = imagenDes
        }else{
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                } else {
                    self.ImagenDescargada = UIImage(data: data!)
                    self.miImagen?.image = self.ImagenDescargada
                    DataHolder.sharedInstance.HMIMG[uri] = self.ImagenDescargada
                }
            }
        }
    }
}
