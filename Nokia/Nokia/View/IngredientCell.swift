//
//  IngredientCell.swift
//  Nokia
//
//  Created by Jhonattan Solarte Martinez on 19/01/20.
//  Copyright © 2020 Nokia. All rights reserved.
//

import UIKit

class IngredientCell: UITableViewCell {
    
    @IBOutlet weak var imgIngredient: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var iconCheck: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setValuesByIngredient(_ objIngredient: IngredientItem){
        var image = UIImage()
        
        self.lblType.text = objIngredient.name
        self.lblId.text = objIngredient.id
        self.iconCheck.isHidden = !objIngredient.selected
        self.iconCheck.image = self.iconCheck.image!.imageWithColor(Utils.getColorBranding())
        
        if objIngredient.type == TypeIngredient.Batters.rawValue {
            image = UIImage(named: "batter")!
        }else{
            image = UIImage(named: "topping")!
        }
        self.imgIngredient.image = image
    }
    
}
