//
//  CakeCellTableViewCell.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 19/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import UIKit

class CakeDetailCell: UITableViewCell {

    @IBOutlet weak var imgType: UIImageView!
    @IBOutlet weak var imgPrice: UIImageView!
    @IBOutlet weak var imgId: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let color = Utils.getColorBranding()
        self.imgType.image = self.imgType.image?.imageWithColor(color)
        self.imgPrice.image = self.imgPrice.image?.imageWithColor(color)
        self.imgId.image = self.imgId.image?.imageWithColor(color)
        self.lblName.backgroundColor = color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setValuesByIngredient(_ objCake: CakeItem){
        self.lblName.text = objCake.name
        self.lblId.text = objCake.id
        self.lblType.text = objCake.type
        self.lblPrice.text = "\(objCake.ppu)"
    }
}
