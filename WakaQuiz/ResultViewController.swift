//
//  ResultViewController.swift
//  WakaQuiz
//
//  Created by MiraiNIKI on 2016/02/19.
//  Copyright © 2016年 UnivercityofTsukuba. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var haikeiLabel: UIImageView!
    var countAnswer: Int = 0
    var questionMax: Int = 0
    
    var haikeiImg1 : UIImage = UIImage(named: "result1.jpg")!
    var haikeiImg2 : UIImage = UIImage(named: "result2.jpg")!
    var haikeiImg3 : UIImage = UIImage(named: "result3.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(countAnswer <= questionMax/3){
            haikeiLabel.image = haikeiImg1
        }else if(countAnswer <= 2*questionMax/3){
            haikeiLabel.image = haikeiImg2
        }else{
            haikeiLabel.image = haikeiImg3
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
