//
//  ViewController.swift
//  WakaQuiz
//
//  Created by MiraiNIKI on 2016/02/18.
//  Copyright © 2016年 UnivercityofTsukuba. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //<-- viewDidLoadは一回だけ呼ばれる。 -->
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let subLabel : UILabel = UILabel(frame: CGRectMake(self.questionLabel.frame.origin.x, self.questionLabel.frame.origin.y, self.questionLabel.frame.width, self.questionLabel.frame.height))
        subLabel.text = "問題スタート"
        subLabel.alpha = 1
        subLabel.textAlignment = NSTextAlignment.Center
        subLabel.font = UIFont.systemFontOfSize(26)
        self.view.addSubview(subLabel)
        
        UILabel.animateWithDuration(2.0,delay: 0.0, options:  UIViewAnimationOptions.Repeat ,animations: {() -> Void in
            subLabel.alpha = 0.0
            }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func questionButtonPushed(sender: AnyObject) {
        questionLabel.alpha = 1.0

    }
    
    @IBAction func detailButtonPushed(sender: AnyObject) {

        questionLabel.alpha = 1.0
    }
    

}

