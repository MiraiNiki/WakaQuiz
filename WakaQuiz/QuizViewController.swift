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

    var countAnswer:Int = 0 //とりあえず5問。
   
    //背景の画像をランダム表示
    var haikeiImgArray:[UIImage] = []
    var rnd: Int = 0
   
    //textViewへの問題の表示
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
    
    //答えをどのボタンに表示させるか。
    var selectAnswerRnd: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //<--------     背景をランダムに設定　　---------->
        for i in 0..<54 {
            haikeiImgArray.append(UIImage(named: String(format: "%03d.jpg",i))!)
        }
        rnd = Int(arc4random_uniform(54))
        haikeiImage.image = haikeiImgArray[rnd]
        
        //<------------   問題をランダムに設定   ------------->
        //とりあえず10個の配列でやってみる。あとで変更の必要が有る。!!注意!!
        //ここってletでいいのか謎です。とりあえずxcodeに注意されたから変えました。
        questionRnd = Int(arc4random_uniform(10))
        questionTextView.text = questionArray[Int(questionRnd)]
        
        
        
        
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
