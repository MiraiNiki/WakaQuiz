//
//  ViewController.swift
//  WakaQuiz
//
//  Created by MiraiNIKI on 2016/02/18.
//  Copyright © 2016年 UnivercityofTsukuba. All rights reserved.
//

import UIKit
import AVFoundation
import RealmSwift
import GoogleMobileAds


public class Waka: Object {
    dynamic var id = 0
    dynamic var score = 0
    dynamic var total = 0
    dynamic var name = ""
    
    //primaryKeyの設定
    override public static func primaryKey() -> String? {
        return "id"
    }
    
}


class ViewController: UIViewController, GADBannerViewDelegate{
    
    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var soundLabel: UILabel!
    
    var ifSound:Bool = true

    
    //AdMob ID
    let AdMobID = "ca-app-pub-3231060788085133/9160394406"
    let TEST_DEVICE_ID = "61b0154xxxxxxxxxxxxxxxxxxxxxxxe0"
    let AdMobTest:Bool = true
    let SimulatorTest:Bool = true
    
    
    //score配列を初期化
    var score: [Int] = [Int](count: 100, repeatedValue: 0)
    //
    let realm = try? Realm()
    
     let udFlag = NSUserDefaults.standardUserDefaults()
    
    
    
    //<-- viewDidLoadは一回だけ呼ばれる。 -->
    
    var bgm : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bgm = mkAudioPlayer("oto004", bgmType: "mp3")
        bgm!.volume = 0.3
        bgm!.numberOfLoops = -1
        bgm!.play()
        
        
        var admobView: GADBannerView = GADBannerView()
        admobView = GADBannerView(adSize:kGADAdSizeBanner)
        admobView.frame.origin = CGPointMake(0, self.view.frame.size.height - admobView.frame.height)
        
        admobView.frame.size = CGSizeMake(self.view.frame.width, admobView.frame.height)
        admobView.adUnitID = AdMobID
        admobView.delegate = self
        admobView.rootViewController = self
        
        let admobRequest:GADRequest = GADRequest()
        
        if AdMobTest {
            if SimulatorTest {
                admobRequest.testDevices = [kGADSimulatorID]
            }
            else {
                admobRequest.testDevices = [TEST_DEVICE_ID]
            }
            
        }
        
        admobView.loadRequest(admobRequest)
        
        self.view.addSubview(admobView)
        
        //let udFlag = NSUserDefaults.standardUserDefaults()
        
        udFlag.setObject("true", forKey: "ifSound")
        
        var soundId: String! = udFlag.objectForKey("ifSound") as! String!
        
        var udId: String! = udFlag.objectForKey("id") as! String!
        
        if(udId != nil){
            
            for i in 1...100 {
                let waka = Waka()
                let orgWaka = realm!.objects(Waka)[i]
                
                if(orgWaka.score != 0 || orgWaka != 0){
                    waka.score = orgWaka.score
                    waka.total = orgWaka.total
                }else{
                    waka.id = i // iに依存
                    waka.score = 0
                    waka.total = 0
                }
                
                try? realm!.write {
                    realm!.add(waka,update: true)
                }
                
            }
        }else{
            for i in 1...100 {
                let waka = Waka()
                waka.id = i // iに依存
                waka.score = 0
                waka.total = 0
            
            try? realm!.write {
                realm!.add(waka,update: true)
            }
            }
        }
        
        
        
        udFlag.setObject("notNil", forKey: "id")
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let subLabel : UILabel = UILabel(frame: CGRectMake(self.questionLabel.frame.origin.x, self.questionLabel.frame.origin.y, self.questionLabel.frame.width, self.questionLabel.frame.height))
        subLabel.text = "問題スタート"
        subLabel.alpha = 1
        subLabel.textAlignment = NSTextAlignment.Center
        subLabel.font = UIFont.systemFontOfSize(26)
        self.view.addSubview(subLabel)
        
        UILabel.animateWithDuration(2.0,delay: 0.0, options:  UIViewAnimationOptions.Repeat,animations: {() -> Void in
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
    
    
    @IBAction func soundButtonPushed(sender: AnyObject) {
        if(soundLabel.text == "さうんど　あり"){
            soundLabel.text = "さうんど　なし"
            bgm?.stop()
            ifSound = false
            udFlag.removeObjectForKey("ifSound")
            udFlag.setObject("false", forKey: "ifSound")
        }else{
            soundLabel.text = "さうんど　あり"
            bgm?.play()
            ifSound = true
            udFlag.removeObjectForKey("ifSound")
            udFlag.setObject("true", forKey: "ifSound")
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toQuizViewController") {
            let quizView = segue.destinationViewController as! QuizViewController
            quizView.ifSound = self.ifSound
        }

//        if (segue.identifier == "toNavigationController") {
//            let naviView = segue.destinationViewController as! NavigationController
//            let wakaView = naviView.visibleViewController
//            wakaView.ifSound = self.ifSound
//        }
        
    }
    
    
    //viewDidLoadの呼び出し（画面のインスタンスの作成）を一回で済ませる。
    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
        
    }
    
}

