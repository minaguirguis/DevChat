//
//  UserCell.swift
//  DevChat
//
//  Created by Mina Guirguis on 5/25/18.
//  Copyright © 2018 Mina Guirguis. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    
    @IBOutlet weak var firstNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckMark(selected: false)
        
    }
    
    func updateUI(user: User) {
        firstNameLbl.text = user.firstName
    }

    func setCheckMark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
    }

}
