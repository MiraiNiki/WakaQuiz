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
    
    @IBOutlet weak var answerTextView1: UITextView!
    
    @IBOutlet weak var answerTextView2: UITextView!
    
    @IBOutlet weak var answerTextView3: UITextView!
    
    var ifAnswer:Bool = false //正解の数を記憶
   
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
    var answerArray:[String] = [
        "秋の田の　かりほの庵の　苫をあらみ\nわが衣手は　露にぬれつつ","春過ぎて　夏来にけらし　白妙の\n衣干すてふ　天の香具山","あしびきの　山鳥の尾の　しだり尾の\nながながし夜を　ひとりかも寝む","田子の浦に　うち出でて見れば　白妙の\n富士の高嶺に　雪は降りつつ\n","奥山に　紅葉踏み分け　鳴く鹿の\n声聞く時ぞ　秋は悲しき",
        "鵲の　渡せる橋に　置く霜の\n白きを見れば　夜ぞ更けにける ","天の原　ふりさけ見れば　春日なる\n三笠の山に　出でし月かも","わが庵は　都の辰巳　しかぞ住む\n世をうぢ山と　人はいふなり","花の色は　移りにけりな　いたづらに\nわが身世にふる　ながめせしまに","これやこの　行くも帰るも　別れては\n知るも知らぬも　あふ坂の関",
        "わたの原　八十島かけて　漕ぎ出でぬと\n人には告げよ　海人の釣船 ","天つ風　雲の通ひ路　吹きとぢよ\n乙女の姿　しばしとどめむ","筑波嶺の　峰より落つる　みなの川\n恋ぞ積もりて　淵となりぬる","陸奥の　しのぶもぢずり　たれゆえに\n乱れそめにし　われならなくに","君がため　春の野に出でて　若菜摘む\nわが衣手に　雪は降りつつ",
        "立ち別れ　いなばの山の　峰に生ふる\nまつとし聞かば　今帰り来む","ちはやぶる　神代も聞かず　竜田川\nからくれなゐに　水くくるとは","住の江の　岸に寄る波　よるさへや\n夢の通ひ路　人目よくらむ","難波潟　短き蘆の　ふしの間も\n逢はでこの世を　過ぐしてよとや","わびぬれば　今はたおなじ　難波なる\nみをつくしても　逢はむとぞ思ふ",
        "今来むと　いひしばかりに　長月の\n有明の月を　待ち出でつるかな","吹くからに　秋の草木の　しをるれば\nむべ山風を　あらしといふらむ","月見れば　ちぢにものこそ　悲しけれ\nわが身ひとつの　秋にはあらねど","このたびは　幣も取りあへず　手向山\n紅葉の錦　神のまにまに","名にし負はば　逢う坂山の　さねかずら\n人に知られで　来るよしもがな",
        "小倉山　峰の紅葉　心あらば\nいまひとたびの　みゆき待たなむ ","みかの原　わきて流るる　いづみ川\nいつ見きとてか　恋しかるらむ ","山里は　冬ぞ寂しさ　まさりける\n人目も草も　かれぬと思へば ","心あてに　折らばや折らむ　初霜の\n置きまどはせる　白菊の花 ","有明の　つれなく見えし　別れより\n暁ばかり　憂きものはなし",
        "朝ぼらけ　有明の月と　見るまでに\n吉野の里に　降れる白雪","山川に　風のかけたる　しがらみは\n流れもあへぬ　紅葉なりけり","ひさかたの　光のどけき　春の日に\nしづ心なく　花の散るらむ","誰をかも　知る人にせむ　高砂の\n松も昔の　友ならなくに","人はいさ　心も知らず　ふるさとは\n花ぞ昔の　香に匂ひける",
        "夏の夜は　まだ宵ながら　明けぬるを\n雲のいずこに　月宿るらむ","白露に　風の吹きしく　秋の野は\nつらぬきとめぬ　玉ぞ散りける","忘らるる　身をば思はず　誓ひてし\n人の命の　惜しくもあるかな","浅茅生の　小野の篠原　忍ぶれど\nあまりてなどか　人の恋しき","忍ぶれど　色に出でにけり　わが恋は\nものや思ふと　人の問ふまで",
        "恋すてふ　わが名はまだき　立ちにけり\n人知れずこそ　思ひそめしか","契りきな　かたみに袖を　しぼりつつ\n末の松山　波越さじとは ","逢ひ見ての　のちの心に　くらぶれば\n昔はものを　思はざりけり","逢ふことの　絶えてしなくは　なかなかに\n人をも身をも　恨みざらまし","あはれとも　いふべき人は　思ほえで\n身のいたずらに　なりぬべきかな",
        "由良の門を　渡る舟人　かぢを絶え\nゆくへも知らぬ　恋のみちかな","八重むぐら　しげれる宿の　さびしきに\n人こそ見えね　秋は来にけり","風をいたみ　岩打つ波の　おのれのみ\nくだけてものを　思ふころかな"," みかきもり　衛士のたく火の　夜は燃え\n昼は消えつつ　ものをこそ思へ","君がため　惜しからざりし　命さへ\n長くもがなと　思ひけるかな",
        "かくとだに　えやは伊吹の　さしも草\nさしも知らじな　燃ゆる思ひを","明けぬれば　暮るるものとは　知りながら\nなほ恨めしき　朝ぼらけかな","嘆きつつ　ひとり寝る夜の　明くる間は\nいかに久しき　ものとかは知る","忘れじの　ゆく末までは　かたければ\n今日を限りの　命ともがな","滝の音は　絶えて久しく　なりぬれど\n名こそ流れて　なほ聞こえけれ",
        "あらざらむ　この世のほかの　思ひ出に\nいまひとたびの　逢ふこともがな","めぐり逢ひて　見しやそれとも　分かぬ間に\n雲隠れにし　夜半の月影","有馬山　猪名の篠原　風吹けば\nいでそよ人を　忘れやはする","やすらはで　寝なましものを　さ夜更けて\nかたぶくまでの　月を見しかな","大江山　いく野の道の　遠ければ\nまだふみも見ず　天の橋立",
        "いにしへの　奈良の都の　八重桜\nけふ九重に　匂ひぬるかな","夜をこめて　鳥のそら音は　はかるとも\nよに逢坂の　関は許さじ","今はただ　思ひ絶えなむ　とばかりを\n人づてならで　いふよしもがな","朝ぼらけ　宇治の川霧　たえだえに\nあらはれわたる　瀬々の網代木 ","恨みわび　干さぬ袖だに　あるものを\n恋に朽ちなむ　名こそ惜しけれ",
        "もろともに　あはれと思え　山桜\n花よりほかに　知る人もなし","春の夜の　夢ばかりなる　手枕に\nかひなく立たむ　名こそをしけれ","心にも　あらで憂き夜に　長らへば\n恋しかるべき　夜半の月かな","嵐吹く　三室の山の　もみぢ葉は\n竜田の川の　錦なりけり","寂しさに　宿を立ち出でて　ながむれば\nいづくも同じ　秋の夕暮れ",
        "夕されば　門田の稲葉　訪れて\n蘆のまろ屋に　秋風ぞ吹く","音に聞く　高師の浜の　あだ波は\nかけじや袖の　ぬれもこそすれ","高砂の　尾の上の桜　咲きにけり\n外山のかすみ　立たずもあらなむ","憂かりける　人を初瀬の　山おろしよ\n激しかれとは　祈らぬものを","契りおきし　させもが露を　命にて\nあはれ今年の　秋もいぬめり",
        "わたの原　漕ぎ出でて見れば　ひさかたの\n雲居にまがふ　沖つ白波","瀬をはやみ　岩にせかるる　滝川の\nわれても末に　逢はむとぞ思ふ","淡路島　通ふ千鳥の　鳴く声に\nいく夜寝覚めぬ　須磨の関守","秋風に　たなびく雲の　たえ間より\n漏れ出づる　月の影のさやけさ","ながからむ　心も知らず　黒髪の\n乱れてけさは　ものをこそ思へ",
        "ほととぎす　鳴きつる方を　ながむれば\nただ有明の　月ぞ残れる","思ひわび　さても命は　あるものを\n憂きに堪へぬは　涙なりけり","世の中よ　道こそなけれ　思ひ入る\n山の奥にも　鹿ぞ鳴くなる","長らへば　またこのごろや　しのばれむ\n憂しと見し世ぞ　今は恋しき","夜もすがら　もの思ふころは　明けやらぬ\nねやのひまさへ　つれなかりけり",
        "嘆けとて　月やはものを　思はする\nかこちがほなる　わが涙かな","村雨の　露もまだ干ぬ　まきの葉に\n霧立ちのぼる　秋の夕暮","難波江の　蘆のかりねの　ひとよゆゑ\n身を尽くしてや　恋ひわたるべき","玉の緒よ　絶えなば絶えね　ながらへば\n忍ぶることの　弱りもぞする","見せばやな　雄島の海人の　袖だにも\n濡れにぞ濡れし　色は変はらず",
        "きりぎりす　鳴くや霜夜の　さむしろに\n衣かたしき　ひとりかも寝む","わが袖は　潮干に見えぬ　沖の石の\n人こそ知らね　かわく間もなし","世の中は　常にもがもな　渚漕ぐ\n海人の小舟の　綱手かなしも","み吉野の　山の秋風　さよ更けて\nふるさと寒く　衣打つなり","おほけなく　憂き世の民に　おほふかな\nわが立つ杣に　すみ染の袖",
        "花さそふ　嵐の庭の　雪ならで\nふりゆくものは　わが身なりけり","来ぬ人を　松帆の浦の　夕なぎに\n焼くや藻塩の　身もこがれつつ","風そよぐ　楢の小川の　夕暮は\n御禊ぞ夏の　しるしなりける","人も愛し　人も恨めし　あじきなく\n世を思ふゆゑに　もの思ふ身は","百敷や　古き軒端の　しのぶにも\nなほ余りある　昔なりけり"
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
            while(dummyAnswerRnd2 == questionRnd || dummyAnswerRnd2 == dummyAnswerRnd1){
                dummyAnswerRnd2 = Int(arc4random_uniform(10))
            }
        
        
        //<--------  選択肢の設定  ---------->
        if(selectAnswerRnd == 0){
            let answerTategakiTextView1 : UITategakiTextView = UITategakiTextView(frame: CGRectMake(self.answerTextView1.frame.origin.x, self.answerTextView1.frame.origin.y, self.answerTextView1.frame.width, self.answerTextView1.frame.height))
            answerTategakiTextView1.tategakiText(answerArray[questionRnd] as! String, textSize: 17)
            self.view.addSubview(answerTategakiTextView1)

            let answerTategakiTextView2 : UITategakiTextView = UITategakiTextView(frame: CGRectMake(self.answerTextView2.frame.origin.x, self.answerTextView2.frame.origin.y, self.answerTextView2.frame.width, self.answerTextView2.frame.height))
            answerTategakiTextView2.tategakiText(answerArray[dummyAnswerRnd1] as! String, textSize: 17)
            self.view.addSubview(answerTategakiTextView2)
            
            let answerTategakiTextView3 : UITategakiTextView = UITategakiTextView(frame: CGRectMake(self.answerTextView3.frame.origin.x, self.answerTextView3.frame.origin.y, self.answerTextView3.frame.width, self.answerTextView3.frame.height))
            answerTategakiTextView3.tategakiText(answerArray[dummyAnswerRnd2] as! String, textSize: 17)
            self.view.addSubview(answerTategakiTextView3)
            
            
//             answerButton1.setTitle(answerArray[questionRnd], forState: .Normal)
//             answerButton2.setTitle(answerArray[dummyAnswerRnd1], forState: .Normal)
//             answerButton3.setTitle(answerArray[dummyAnswerRnd2], forState: .Normal)
        }else if(selectAnswerRnd == 1){
            let answerTategakiTextView1 : UITategakiTextView = UITategakiTextView(frame: CGRectMake(self.answerTextView1.frame.origin.x, self.answerTextView1.frame.origin.y, self.answerTextView1.frame.width, self.answerTextView1.frame.height))
            answerTategakiTextView1.tategakiText(answerArray[dummyAnswerRnd1] as! String, textSize: 17)
            self.view.addSubview(answerTategakiTextView1)
            
            let answerTategakiTextView2 : UITategakiTextView = UITategakiTextView(frame: CGRectMake(self.answerTextView2.frame.origin.x, self.answerTextView2.frame.origin.y, self.answerTextView2.frame.width, self.answerTextView2.frame.height))
            answerTategakiTextView2.tategakiText(answerArray[questionRnd] as! String, textSize: 17)
            self.view.addSubview(answerTategakiTextView2)
            
            let answerTategakiTextView3 : UITategakiTextView = UITategakiTextView(frame: CGRectMake(self.answerTextView3.frame.origin.x, self.answerTextView3.frame.origin.y, self.answerTextView3.frame.width, self.answerTextView3.frame.height))
            answerTategakiTextView3.tategakiText(answerArray[dummyAnswerRnd2] as! String, textSize: 17)
            self.view.addSubview(answerTategakiTextView3)
            
//            answerButton1.setTitle(answerArray[dummyAnswerRnd1], forState: .Normal)
//            answerButton2.setTitle(answerArray[questionRnd], forState: .Normal)
//            answerButton3.setTitle(answerArray[dummyAnswerRnd2], forState: .Normal)
        }else{ //selectAnswerRnd == 2
            let answerTategakiTextView1 : UITategakiTextView = UITategakiTextView(frame: CGRectMake(self.answerTextView1.frame.origin.x, self.answerTextView1.frame.origin.y, self.answerTextView1.frame.width, self.answerTextView1.frame.height))
            answerTategakiTextView1.tategakiText(answerArray[dummyAnswerRnd1] as! String, textSize: 17)
            self.view.addSubview(answerTategakiTextView1)
            
            let answerTategakiTextView2 : UITategakiTextView = UITategakiTextView(frame: CGRectMake(self.answerTextView2.frame.origin.x, self.answerTextView2.frame.origin.y, self.answerTextView2.frame.width, self.answerTextView2.frame.height))
            answerTategakiTextView2.tategakiText(answerArray[dummyAnswerRnd2] as! String, textSize: 17)
            self.view.addSubview(answerTategakiTextView2)
            
            let answerTategakiTextView3 : UITategakiTextView = UITategakiTextView(frame: CGRectMake(self.answerTextView3.frame.origin.x, self.answerTextView3.frame.origin.y, self.answerTextView3.frame.width, self.answerTextView3.frame.height))
            answerTategakiTextView3.tategakiText(answerArray[questionRnd] as! String, textSize: 17)
            self.view.addSubview(answerTategakiTextView3)
            
//            answerButton1.setTitle(answerArray[dummyAnswerRnd1], forState: .Normal)
//            answerButton2.setTitle(answerArray[dummyAnswerRnd2], forState: .Normal)
//            answerButton3.setTitle(answerArray[questionRnd], forState: .Normal)
        }
        
        
        self.view.bringSubviewToFront(answerButton3)
        self.view.bringSubviewToFront(answerButton2)
        self.view.bringSubviewToFront(answerButton1)
        
        
        
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
