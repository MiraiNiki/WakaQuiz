//
//  WakaListTableViewCell.swift
//  WakaQuiz
//
//  Created by MiraiNIKI on 2016/02/26.
//  Copyright © 2016年 UnivercityofTsukuba. All rights reserved.
//

import UIKit

class WakaListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wakaLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
