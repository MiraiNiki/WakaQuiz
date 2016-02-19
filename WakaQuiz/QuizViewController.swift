//
//  QuizViewController.swift
//  WakaQuiz
//
//  Created by MiraiNIKI on 2016/02/19.
//  Copyright © 2016年 UnivercityofTsukuba. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var haikeiImage: UIImageView!
    
    var haikeiImg001: UIImage = UIImage(named: "001.jpg")!
    var haikeiImg002: UIImage = UIImage(named: "002.jpg")!
    var haikeiImg003: UIImage = UIImage(named: "003.jpg")!
    var haikeiImg004: UIImage = UIImage(named: "004.jpg")!
    var haikeiImg005: UIImage = UIImage(named: "005.jpg")!
    var haikeiImg006: UIImage = UIImage(named: "006.jpg")!
    var haikeiImg007: UIImage = UIImage(named: "007.jpg")!
    var haikeiImg008: UIImage = UIImage(named: "008.jpg")!
    var haikeiImg009: UIImage = UIImage(named: "009.jpg")!
    var haikeiImg010: UIImage = UIImage(named: "010.jpg")!
    var haikeiImg011: UIImage = UIImage(named: "011.jpg")!
    var haikeiImg012: UIImage = UIImage(named: "012.jpg")!
    var haikeiImg013: UIImage = UIImage(named: "013.jpg")!
    var haikeiImg014: UIImage = UIImage(named: "014.jpg")!
    var haikeiImg015: UIImage = UIImage(named: "015.jpg")!
    var haikeiImg016: UIImage = UIImage(named: "016.jpg")!
    var haikeiImg017: UIImage = UIImage(named: "017.jpg")!
    var haikeiImg018: UIImage = UIImage(named: "018.jpg")!
    var haikeiImg019: UIImage = UIImage(named: "019.jpg")!
    var haikeiImg020: UIImage = UIImage(named: "020.jpg")!
    var haikeiImg021: UIImage = UIImage(named: "021.jpg")!
    var haikeiImg022: UIImage = UIImage(named: "022.jpg")!
    var haikeiImg023: UIImage = UIImage(named: "023.jpg")!
    var haikeiImg024: UIImage = UIImage(named: "024.jpg")!
    var haikeiImg025: UIImage = UIImage(named: "025.jpg")!
    var haikeiImg026: UIImage = UIImage(named: "026.jpg")!
    var haikeiImg027: UIImage = UIImage(named: "027.jpg")!
    var haikeiImg028: UIImage = UIImage(named: "028.jpg")!
    var haikeiImg029: UIImage = UIImage(named: "029.jpg")!
    var haikeiImg030: UIImage = UIImage(named: "030.jpg")!
    var haikeiImg031: UIImage = UIImage(named: "031.jpg")!
    var haikeiImg032: UIImage = UIImage(named: "032.jpg")!
    var haikeiImg033: UIImage = UIImage(named: "033.jpg")!
    var haikeiImg034: UIImage = UIImage(named: "034.jpg")!
    var haikeiImg035: UIImage = UIImage(named: "035.jpg")!
    var haikeiImg036: UIImage = UIImage(named: "036.jpg")!
    var haikeiImg037: UIImage = UIImage(named: "037.jpg")!
    var haikeiImg038: UIImage = UIImage(named: "038.jpg")!
    var haikeiImg039: UIImage = UIImage(named: "039.jpg")!
    var haikeiImg040: UIImage = UIImage(named: "040.jpg")!
    var haikeiImg041: UIImage = UIImage(named: "041.jpg")!
    var haikeiImg042: UIImage = UIImage(named: "042.jpg")!
    var haikeiImg043: UIImage = UIImage(named: "043.jpg")!
    var haikeiImg044: UIImage = UIImage(named: "044.jpg")!
    var haikeiImg045: UIImage = UIImage(named: "045.jpg")!
    var haikeiImg046: UIImage = UIImage(named: "046.jpg")!
    var haikeiImg047: UIImage = UIImage(named: "047.jpg")!
    var haikeiImg048: UIImage = UIImage(named: "048.jpg")!
    var haikeiImg049: UIImage = UIImage(named: "049.jpg")!
    var haikeiImg050: UIImage = UIImage(named: "050.jpg")!
    var haikeiImg051: UIImage = UIImage(named: "051.jpg")!
    var haikeiImg052: UIImage = UIImage(named: "052.jpg")!
    var haikeiImg053: UIImage = UIImage(named: "053.jpg")!
    var haikeiImg054: UIImage = UIImage(named: "054.jpg")!

    var haikeiImgArray:[UIImage] = []
    
    var rnd = Int(arc4random_uniform(54))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        for i in 0..<9 {
            haikeiImgArray.append(UIImage(named: "00\(i+1).jpg")!)
        }
        for i in 9..<54 {
            haikeiImgArray.append(UIImage(named: "0\(i+1).jpg")!)
        }
        
        haikeiImage.image = haikeiImgArray[rnd]
        
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
