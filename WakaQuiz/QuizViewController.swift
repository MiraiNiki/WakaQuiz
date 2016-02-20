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

    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerButton1: UIButton!
    
    @IBOutlet weak var answerButton2: UIButton!
    
    @IBOutlet weak var answerButton3: UIButton!
    
    let questionMax = 5 //全部で5問出す装置だと仮定。
    var countQuestion:Int = 0 //出題数を記憶
    var countAnswer:Int = 0 //正解の数を記憶
   
    //背景の画像をランダム表示
    var haikeiImgArray:[UIImage] = [UIImage(named: "001.jpg")!,
                                    UIImage(named: "002.jpg")!,
        UIImage(named: "003.jpg")!,
        UIImage(named: "004.jpg")!,
        UIImage(named: "005.jpg")!,
        UIImage(named: "006.jpg")!,
        UIImage(named: "007.jpg")!,
        UIImage(named: "008.jpg")!,
        UIImage(named: "009.jpg")!,
        UIImage(named: "010.jpg")!,
        UIImage(named: "011.jpg")!,
        UIImage(named: "012.jpg")!,
        UIImage(named: "013.jpg")!,
        UIImage(named: "014.jpg")!,
        UIImage(named: "015.jpg")!,
        UIImage(named: "016.jpg")!,
        UIImage(named: "017.jpg")!,
        UIImage(named: "018.jpg")!,
        UIImage(named: "019.jpg")!,
        UIImage(named: "020.jpg")!,
        UIImage(named: "021.jpg")!,
        UIImage(named: "022.jpg")!,
        UIImage(named: "023.jpg")!,
        UIImage(named: "024.jpg")!,
        UIImage(named: "025.jpg")!,
        UIImage(named: "026.jpg")!,
        UIImage(named: "027.jpg")!,
        UIImage(named: "028.jpg")!,
        UIImage(named: "029.jpg")!,
        UIImage(named: "030.jpg")!,
        UIImage(named: "031.jpg")!,
        UIImage(named: "032.jpg")!,
        UIImage(named: "033.jpg")!,
        UIImage(named: "034.jpg")!,
        UIImage(named: "035.jpg")!,
        UIImage(named: "036.jpg")!,
        UIImage(named: "037.jpg")!,
        UIImage(named: "038.jpg")!,
        UIImage(named: "039.jpg")!,
        UIImage(named: "040.jpg")!,
        UIImage(named: "041.jpg")!,
        UIImage(named: "042.jpg")!,
        UIImage(named: "043.jpg")!,
        UIImage(named: "044.jpg")!,
        UIImage(named: "045.jpg")!,
        UIImage(named: "046.jpg")!,
        UIImage(named: "047.jpg")!,
        UIImage(named: "048.jpg")!,
        UIImage(named: "049.jpg")!,
        UIImage(named: "050.jpg")!,
        UIImage(named: "051.jpg")!,
        UIImage(named: "052.jpg")!,
        UIImage(named: "053.jpg")!,
        UIImage(named: "054.jpg")!
        ]
    var rnd: Int = 0
   
    //問題の配列
    //！！問題がかぶることが考慮されていない！！
    var questionArray:[String] = ["秋の田んぼの世話をするための仮の小屋は屋根の編み目が荒く、私の袖が夜露に濡れてしまっていることよ。\n",
        "天の香具山に白い衣装が干してある。夏が来たようだ。\n",
        "長い長い夜を愛する人と離れ離れになって一人寂しく寝るのだろうなあ。\n",
        "田子の浦から遠くを眺めると藤の峰に真っ白な雪が降り積もっているなあ。\n",
        "人里離れた山の奥の地一面の紅葉を踏みながら鹿の声が聞こえた時は秋がとても寂しく感じられるなあ。\n",
        "天の川にカササギが掛けていった橋に霜が降りている。その白さを見ると夜が随分更けたなあと思う。\n",
        "大空を見上げてみると、月がとても美しいことよ。故郷の三笠山にかかっている月でもあるのだなあ。\n",
        "私が住んでいる家は静かなところにあるので落ち着く。しかし皆さんは私が人付き合いが煩わしいと思ってこの場所に住んでいると思っているみたいですね。\n",
        "花が色あせるように私の美しさも衰えてしまったわ。恋愛なんかの悩みに、長雨を眺めながら思いを馳せているうちに。\n",
        "京の都から東国へ行く人も東国から都へ帰る人もこの場所で会って別れていることだ。\n"
    ]
    
    var questionRnd: Int = 0
    
    //答えの配列
    var answerArray:[UIImage] = [UIImage(named:"u001.jpg")!,
         UIImage(named:"u002.jpg")!,
         UIImage(named:"u003.jpg")!,
         UIImage(named:"u004.jpg")!,
         UIImage(named:"u005.jpg")!,
         UIImage(named:"u006.jpg")!,
         UIImage(named:"u007.jpg")!,
         UIImage(named:"u008.jpg")!,
         UIImage(named:"u009.jpg")!,
         UIImage(named:"u010.jpg")!,
        ]
    
    var dummyAnswerRnd1: Int = 0
    var dummyAnswerRnd2: Int = 0
    
    //正解をどのボタンに表示させるか。
    var selectAnswerRnd: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //<--------     背景をランダムに設定　　---------->
        rnd = Int(arc4random_uniform(54))
        haikeiImage.image = haikeiImgArray[rnd]
        
        
        //<------------   問題をランダムに設定   ------------->
        //とりあえず10個の配列でやってみる。あとで変更の必要が有る。!!注意!!
        questionRnd = Int(arc4random_uniform(10))
        questionTextView.text = questionArray[Int(questionRnd)]
        
        
        //<-------- 正解を表示する場所の決定  ------>
        selectAnswerRnd = Int(arc4random_uniform(3))
        
        
        //<-------- ダミーの答えのインデックス  ------>
        //とりあえず10個の配列でやってみる。あとで変更の必要が有る。!!注意!!
        dummyAnswerRnd1 = Int(arc4random_uniform(10))
        //正解を一つにする。
        while(dummyAnswerRnd1 == questionRnd){
                dummyAnswerRnd1 = Int(arc4random_uniform(10))
        }
        dummyAnswerRnd2 = Int(arc4random_uniform(10))
        while(dummyAnswerRnd2 == questionRnd){
            dummyAnswerRnd1 = Int(arc4random_uniform(10))
        }
        while(dummyAnswerRnd2 == dummyAnswerRnd1){
            dummyAnswerRnd1 = Int(arc4random_uniform(10))
        }
        
        //<--------  選択肢の設定  ---------->
        if(selectAnswerRnd == 0){
            answerButton1.setBackgroundImage(answerArray[questionRnd], forState: .Normal)
             answerButton2.setBackgroundImage(answerArray[dummyAnswerRnd1], forState: .Normal)
             answerButton3.setBackgroundImage(answerArray[dummyAnswerRnd2], forState: .Normal)
        }else if(selectAnswerRnd == 1){
            answerButton1.setBackgroundImage(answerArray[dummyAnswerRnd1], forState: .Normal)
            answerButton2.setBackgroundImage(answerArray[questionRnd], forState: .Normal)
            answerButton3.setBackgroundImage(answerArray[dummyAnswerRnd2], forState: .Normal)
        }else{ //selectAnswerRnd == 2
            answerButton1.setBackgroundImage(answerArray[questionRnd], forState: .Normal)
            answerButton2.setBackgroundImage(answerArray[dummyAnswerRnd1], forState: .Normal)
            answerButton3.setBackgroundImage(answerArray[dummyAnswerRnd2], forState: .Normal)
        }
        
    }

    //<----- 正解の数と出題数の処理 ------>
    @IBAction func answerButton1Pressed(sender: AnyObject) {
        if(selectAnswerRnd == 0){
            countAnswer++;
        }
        countQuestion++;
        if(countQuestion == questionMax){
            performSegueToResult()
        }else{
            
        }
    }

    @IBAction func answerButton2Pressed(sender: AnyObject) {
        if(selectAnswerRnd == 1){
            countAnswer++;
        }
        countQuestion++;
        if(countQuestion == questionMax){
                performSegueToResult()
        }else{
            
        }
    }
    
    @IBAction func answerButton3Pressed(sender: AnyObject) {
        if(selectAnswerRnd == 2){
            countAnswer++;
        }
        countQuestion++;
        if(countQuestion == questionMax){
            performSegueToResult()
        }else{
            
        }
    }
    
    func performSegueToResult() {
    performSegueWithIdentifier("toResultViewController", sender: nil)
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
