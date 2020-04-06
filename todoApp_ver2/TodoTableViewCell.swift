//
//  TodoTableViewCell.swift
//  todoApp_ver2
//
//  Created by Kozasa Mizuki on 2020/04/05.
//  Copyright © 2020 Kozasa Mizuki. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet var todoLabel: UILabel!
    @IBOutlet weak var CategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
