//
//  micelda2CollectionViewCell.swift
//  Hito1
//
//  Created by Alvaro Barrado on 24/4/18.
//  Copyright © 2018 Alvaro Barrado. All rights reserved.
//

import UIKit

class micelda2CollectionViewCell: UICollectionViewCell {
    @IBOutlet var imgMain:UIImageView?
    @IBOutlet var lblNombre:UILabel?
    var ImagenDescargada:UIImage?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func mostrarImagen(uri:String){
        self.imgMain?.image = nil
        print("-------")
        let imagenDes = DataHolder.sharedInstance.HMIMG[uri]
        if imagenDes != nil{
            imgMain?.image = imagenDes
        }else{
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                } else {
                    self.ImagenDescargada = UIImage(data: data!)
                    self.imgMain?.image = self.ImagenDescargada
                    DataHolder.sharedInstance.HMIMG[uri] = self.ImagenDescargada
                }
            }
        }
    }
}
