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
    var ifAnswer:Bool = true //正解の数を記憶
   
    //背景の画像をランダム表示
    var haikeiImgArray:[UIImage] = [
        UIImage(named: "001.jpg")!,
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
    var questionArray:[String] = [
        "秋の田んぼの世話をするための仮の小屋は屋根の編み目が荒く、私の袖が夜露に濡れてしまっていることよ。\n",
        "天の香具山に白い衣装が干してある。夏が来たようだ。\n",
        "長い長い夜を愛する人と離れ離れになって一人寂しく寝るのだろうなあ。\n",
        "田子の浦から遠くを眺めると藤の峰に真っ白な雪が降り積もっているなあ。\n",
        "人里離れた山の奥の地一面の紅葉を踏みながら鹿の声が聞こえた時は秋がとても寂しく感じられるなあ。\n",
        "天の川にカササギが掛けていった橋に霜が降りている。その白さを見ると夜が随分更けたなあと思う。\n",
        "大空を見上げてみると、月がとても美しいことよ。故郷の三笠山にかかっている月でもあるのだなあ。\n",
        "私が住んでいる家は静かなところにあるので落ち着く。しかし皆さんは私が人付き合いが煩わしいと思ってこの場所に住んでいると思っているみたいですね。\n",
        "花が色あせるように私の美しさも衰えてしまったわ。恋愛なんかの悩みに、長雨を眺めながら思いを馳せているうちに。\n",
        "京の都から東国へ行く人も東国から都へ帰る人もこの場所で会って別れていることだ。\n",
        "天皇の怒りを買い、地位を取り上げられて島流しにあっている。釣り船に乗った漁師さん、どうか都にいる愛しいあの人に伝えてください。\n",
        "天女のように美しい舞姫をもう少し見ていたいなあ\n",
        "筑波山の峰の川には泥が積もって淵になっているようにあなたへの気持ちが募っています。\n",
        "乱れ染の文様のように私の気持ちが乱れていった。誰によって乱されたのでしょうね。乱されたくなかったのに。\n",
        "あなたのために若菜を摘んでいる私の袖には雪が積もっているよ。\n",
        "あなたと別れ移ってもあなたが待つと言ってくれるのを聞いたならすぐに帰ってきましょう。\n",
        "神がこの世を納めていた時代にもこんなことは聞いたことがない。竜田川に紅葉が落ちて水をくくり染めにしているとは。\n",
        "どうしてあなたは夜の夢の中でも人目を避けるのですか。すみの江の岸に波がうちよるように。\n",
        "難波潟に生える葦の節の間のような短い間でさえもあなたに合わないでどうしてこの世を過ごしてとおっしゃるのでしょうか。\n",
        "会うこともできずに思い煩うのは身を捨てたのと同じだ。身を尽くしてもあなたに会いたいものだ。\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
        "\n",
    ]
    
    var questionRnd: Int = 0
    
    //答えの配列
    var answerArray:[UIImage] = [
         UIImage(named:"u001.jpg")!,
         UIImage(named:"u002.jpg")!,
         UIImage(named:"u003.jpg")!,
         UIImage(named:"u004.jpg")!,
         UIImage(named:"u005.jpg")!,
         UIImage(named:"u006.jpg")!,
         UIImage(named:"u007.jpg")!,
         UIImage(named:"u008.jpg")!,
         UIImage(named:"u009.jpg")!,
         UIImage(named:"u010.jpg")!,
         UIImage(named:"u011.jpg")!,
         UIImage(named:"u012.jpg")!,
         UIImage(named:"u013.jpg")!,
         UIImage(named:"u014.jpg")!,
         UIImage(named:"u015.jpg")!,
         UIImage(named:"u016.jpg")!,
         UIImage(named:"u017.jpg")!,
         UIImage(named:"u018.jpg")!,
         UIImage(named:"u019.jpg")!,
         UIImage(named:"u020.jpg")!,
         UIImage(named:"u021.jpg")!,
         UIImage(named:"u022.jpg")!,
         UIImage(named:"u023.jpg")!,
         UIImage(named:"u024.jpg")!,
         UIImage(named:"u025.jpg")!,
         UIImage(named:"u026.jpg")!,
         UIImage(named:"u027.jpg")!,
         UIImage(named:"u028.jpg")!,
         UIImage(named:"u029.jpg")!,
         UIImage(named:"u030.jpg")!,
         UIImage(named:"u031.jpg")!,
         UIImage(named:"u032.jpg")!,
         UIImage(named:"u033.jpg")!,
         UIImage(named:"u034.jpg")!,
         UIImage(named:"u035.jpg")!,
         UIImage(named:"u036.jpg")!,
         UIImage(named:"u037.jpg")!,
         UIImage(named:"u038.jpg")!,
         UIImage(named:"u039.jpg")!,
         UIImage(named:"u040.jpg")!,
         UIImage(named:"u041.jpg")!,
         UIImage(named:"u042.jpg")!,
         UIImage(named:"u043.jpg")!,
         UIImage(named:"u044.jpg")!,
         UIImage(named:"u045.jpg")!,
         UIImage(named:"u046.jpg")!,
         UIImage(named:"u047.jpg")!,
         UIImage(named:"u048.jpg")!,
         UIImage(named:"u049.jpg")!,
         UIImage(named:"u050.jpg")!,
         UIImage(named:"u051.jpg")!,
         UIImage(named:"u052.jpg")!,
         UIImage(named:"u053.jpg")!,
         UIImage(named:"u054.jpg")!,
         UIImage(named:"u055.jpg")!,
         UIImage(named:"u056.jpg")!,
         UIImage(named:"u057.jpg")!,
         UIImage(named:"u058.jpg")!,
         UIImage(named:"u059.jpg")!,
         UIImage(named:"u060.jpg")!,
         UIImage(named:"u061.jpg")!,
         UIImage(named:"u062.jpg")!,
         UIImage(named:"u063.jpg")!,
         UIImage(named:"u064.jpg")!,
         UIImage(named:"u065.jpg")!,
         UIImage(named:"u066.jpg")!,
         UIImage(named:"u067.jpg")!,
         UIImage(named:"u068.jpg")!,
         UIImage(named:"u069.jpg")!,
         UIImage(named:"u070.jpg")!,
         UIImage(named:"u071.jpg")!,
         UIImage(named:"u072.jpg")!,
         UIImage(named:"u073.jpg")!,
         UIImage(named:"u074.jpg")!,
         UIImage(named:"u075.jpg")!,
         UIImage(named:"u076.jpg")!,
         UIImage(named:"u077.jpg")!,
         UIImage(named:"u078.jpg")!,
         UIImage(named:"u079.jpg")!,
         UIImage(named:"u080.jpg")!,
         UIImage(named:"u081.jpg")!,
         UIImage(named:"u082.jpg")!,
         UIImage(named:"u083.jpg")!,
         UIImage(named:"u084.jpg")!,
         UIImage(named:"u085.jpg")!,
         UIImage(named:"u086.jpg")!,
         UIImage(named:"u087.jpg")!,
         UIImage(named:"u088.jpg")!,
         UIImage(named:"u089.jpg")!,
         UIImage(named:"u090.jpg")!,
         UIImage(named:"u091.jpg")!,
         UIImage(named:"u092.jpg")!,
         UIImage(named:"u093.jpg")!,
         UIImage(named:"u094.jpg")!,
         UIImage(named:"u095.jpg")!,
         UIImage(named:"u096.jpg")!,
         UIImage(named:"u097.jpg")!,
         UIImage(named:"u098.jpg")!,
         UIImage(named:"u099.jpg")!,
         UIImage(named:"u100.jpg")!,
    ]
    
    var dummyAnswerRnd1: Int = 0
    var dummyAnswerRnd2: Int = 0
    
    //正解をどのボタンに表示させるか。
    var selectAnswerRnd: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ifAnswer = false
        
        //<--------     背景をランダムに設定　　---------->
        rnd = Int(arc4random_uniform(54))
        rndHaikei()
        
        
        //<------------   問題をランダムに設定   ------------->
        //とりあえず10個の配列でやってみる。あとで変更の必要が有る。!!注意!!
        questionRnd = Int(arc4random_uniform(10))
        rndQuestion()
        
        
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
                dummyAnswerRnd2 = Int(arc4random_uniform(10))
            }
            while(dummyAnswerRnd2 == dummyAnswerRnd1){
                dummyAnswerRnd2 = Int(arc4random_uniform(10))
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
            answerButton1.setBackgroundImage(answerArray[dummyAnswerRnd1], forState: .Normal)
            answerButton2.setBackgroundImage(answerArray[dummyAnswerRnd2], forState: .Normal)
            answerButton3.setBackgroundImage(answerArray[questionRnd], forState: .Normal)
        }
        
    }

    //<----- 正解の数と出題数の処理 ------>
    @IBAction func answerButton1Pressed(sender: AnyObject) {
        if(selectAnswerRnd == 0){
            ifAnswer = true
        }
        performSegueToResult()
    }

    @IBAction func answerButton2Pressed(sender: AnyObject) {
        if(selectAnswerRnd == 1){
            ifAnswer = true
        }
        performSegueToResult()
    }
    
    @IBAction func answerButton3Pressed(sender: AnyObject) {
        if(selectAnswerRnd == 2){
            ifAnswer = true
        }
        performSegueToResult()
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultViewController", sender: nil)
    }
    
    //<--------     背景をランダムに設定する関数　　---------->
    func rndHaikei(){
        haikeiImage.image = haikeiImgArray[rnd]
    }
    
    //<------------   問題をランダムに設定する関数   ------------->
    //とりあえず10個の配列でやってみる。あとで変更の必要が有る。!!注意!!
    func rndQuestion() {
        questionTextView.text = questionArray[Int(questionRnd)]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultViewController") {
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.ifAnswer = self.ifAnswer
            resultView.questionIndex = questionRnd
        }
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
