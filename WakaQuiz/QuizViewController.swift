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
        "今来むと　いひしばかりに　長月の\n有明の月を　待ち出でつるかな","吹くからに　秋の草木の\nしをるれば\nむべ山風を\nあらしといふらむ","月見れば\nちぢにものこそ\n悲しけれ\nわが身ひとつの\n秋にはあらねど","このたびは\n幣も取りあへず\n手向山\n紅葉の錦\n神のまにまに","名にし負はば\n逢う坂山の\nさねかずら\n人に知られで\n来るよしもがな",
        "小倉山\n峰の紅葉\n心あらば\nいまひとたびの\nみゆき待たなむ ","みかの原\nわきて流るる\nいづみ川\nいつ見きとてか\n恋しかるらむ ","山里は\n冬ぞ寂しさ\nまさりける\n人目も草も\nかれぬと思へば ","心あてに\n折らばや折らむ\n初霜の\n置きまどはせる\n白菊の花 ","有明の\nつれなく見えn別れより\n暁ばかり\n憂きものはなし",
        "朝ぼらけ\n有明の月と\n見るまでに\n吉野の里に\n降れる白雪","山川に\n風のかけたる\nしがらみは\n流れもあへぬ\n紅葉なりけり","ひさかたの\n光のどけき\n春の日に\nしづ心なく\n花の散るらむ","誰をかも\n知る人にせむ\n高砂の\n松も昔の\n友ならなくに","人はいさ\n心も知らず\nふるさとは\n花ぞ昔の香に匂ひける",
        "夏の夜は\nまだ宵ながら\n明けぬるを\n雲のいずこに\n月宿るらむ","白露に\n風の吹きしく\n秋の野は\nつらぬきとめぬ\n玉ぞ散りける","忘らるる\n身をば思はず\n誓ひてし\n人の命の\n惜しくもあるかな","浅茅生の\n小野の篠原\n忍ぶれど\nあまりてなどか\n人の恋しき","忍ぶれど\n色に出でにけり\nわが恋は\nものや思ふと\n人の問ふまで",
        "恋すてふ\nわが名はまだき\n立ちにけり\n人知れずこそ\n思ひそめしか","契りきな\nかたみに袖を\nしぼりつつ\n末の松山\n波越さじとは ","逢ひ見ての\nのちの心に\nくらぶれば\n昔はものを\n思はざりけり","逢ふことの\n絶えてしなくは\nなかなかに\n人をも身をも\n恨みざらまし","あはれとも\nいふべき人は\n思ほえで\n身のいたずらに\nなりぬべきかな",
        "由良の門を\n渡る舟人\nかぢを絶え\nゆくへも知らぬ\n恋のみちかな","八重むぐら\nしげれる宿の\nさびしきに\n人こそ見えね\n秋は来にけり","風をいたみ\n岩打つ波の\nおのれのみ\nくだけてものを\n思ふころかな"," みかきもり\n衛士のたく火の\n夜は燃え\n昼は消えつつ\nものをこそ思へ","君がため\n惜しからざりし\n命さへ\n長くもがなと\n思ひけるかな",
        "かくとだに\nえやは伊吹の\nさしも草\nさしも知らじな\n燃ゆる思ひを","明けぬれば\n暮るるものとは\n知りながら\nなほ恨めしき\n朝ぼらけかな","嘆きつつ\nひとり寝る夜の\n明くる間は\nいかに久しき\nものとかは知る","忘れじの\nゆく末までは\nかたければ\n今日を限りの\n命ともがな","滝の音は\n絶えて久しく\nなりぬれど\n名こそ流れて\nなほ聞こえけれ",
        "あらざらむ\nこの世のほかの\n思ひ出に\nいまひとたびの\n逢ふこともがな","めぐり逢ひて\n見しやそれとも\n分かぬ間に\n雲隠れにし\n夜半の月影","有馬山\n猪名の篠原\n風吹けば\nいでそよ人を\n忘れやはする","やすらはで\n寝なましものを\nさ夜更けて\nかたぶくまでの\n月を見しかな","大江山\nいく野の道の\n遠ければ\nまだふみも見ず\n天の橋立",
        "いにしへの\n奈良の都の\n八重桜\nけふ九重に\n匂ひぬるかな","夜をこめて\n鳥のそら音は\nはかるとも\nよに逢坂の\n関は許さじ","今はただ\n思ひ絶えなむ\nとばかりを\n人づてならで\nいふよしもがな","朝ぼらけ\n宇治の川霧\nたえだえに\nあらはれわたる\n瀬々の網代木 ","恨みわび\n干さぬ袖だに\nあるものを\n恋に朽ちなむ\n名こそ惜しけれ",
        "もろともに\nあはれと思え\n山桜\n花よりほかに\n知る人もなし","春の夜の\n夢ばかりなる\n手枕に\nかひなく立たむ\n名こそをしけれ","心にも\nあらで憂き夜に\n長らへば\n恋しかるべき\n夜半の月かな","嵐吹く\n三室の山の\nもみぢ葉は\n竜田の川の\n錦なりけり","寂しさに\n宿を立ち出でて\nながむれば\nいづくも同じ\n秋の夕暮れ",
        "夕されば\n門田の稲葉\n訪れて\n蘆のまろ屋に\n秋風ぞ吹く","音に聞く\n高師の浜の\nあだ波は\nかけじや袖の\nぬれもこそすれ","高砂の\n尾の上の桜\n咲きにけり\n外山のかすみ\n立たずもあらなむ","憂かりける\n人を初瀬の\n山おろしよ\n激しかれとは\n祈らぬものを","契りおきし\nさせもが露を\n命にて\nあはれ今年の\n秋もいぬめり",
        "わたの原\n漕ぎ出でて見れば\nひさかたの\n雲居にまがふ\n沖つ白波","瀬をはやみ\n岩にせかるる\n滝川の\nわれても末に\n逢はむとぞ思ふ","淡路島\n通ふ千鳥の\n鳴く声に\nいく夜寝覚めぬ\n須磨の関守","秋風に\nたなびく雲の\nたえ間より\n漏れ出づる\n月の影のさやけさ","ながからむ\n心も知らず\n黒髪の\n乱れてけさは\nものをこそ思へ",
        "ほととぎす\n鳴きつる方を\nながむれば\nただ有明の\n月ぞ残れる","思ひわび\nさても命は\nあるものを\n憂きに堪へぬは\n涙なりけり","世の中よ\n道こそなけれ\n思ひ入る\n山の奥にも\n鹿ぞ鳴くなる","長らへば\nまたこのごろや\nしのばれむ\n憂しと見し世ぞ\n今は恋しき","夜もすがら\nもの思ふころは\n明けやらぬ\nねやのひまさへ\nつれなかりけり",
        "嘆けとて\n月やはものを\n思はする\nかこちがほなる\nわが涙かな","村雨の\n露もまだ干ぬ\nまきの葉に\n霧立ちのぼる\n秋の夕暮","難波江の\n蘆のかりねの\nひとよゆゑ\n身を尽くしてや\n恋ひわたるべき","玉の緒よ\n絶えなば絶えね\nながらへば\n忍ぶることの\n弱りもぞする","見せばやな\n雄島の海人の\n袖だにも\n濡れにぞ濡れし\n色は変はらず",
        "きりぎりす\n鳴くや霜夜の\nさむしろに\n衣かたしき\nひとりかも寝む","わが袖は\n潮干に見えぬ\n沖の石の\n人こそ知らね\nかわく間もなし","世の中は\n常にもがもな\n渚漕ぐ\n海人の小舟の\n綱手かなしも","み吉野の\n山の秋風さよ\n更けて\nふるさと寒く\n衣打つなり","おほけなく\n憂き世の民に\nおほふかな\nわが立つ杣に\nすみ染の袖",
        "花さそふ\n嵐の庭の\n雪ならで\nふりゆくものは\nわが身なりけり","来ぬ人を\n松帆の浦の\n夕なぎに\n焼くや藻塩の\n身もこがれつつ","風そよぐ\n楢の小川の\n夕暮は\n御禊ぞ夏の\nしるしなりける","人も愛し\n人も恨めし\nあじきなく\n世を思ふゆゑに\nもの思ふ身は","百敷や\n古き軒端の\nしのぶにも\nなほ余りある\n昔なりけり"
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
