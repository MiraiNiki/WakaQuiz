//
//  DetailViewController.swift
//  WakaQuiz
//
//  Created by MiraiNIKI on 2016/02/19.
//  Copyright © 2016年 UnivercityofTsukuba. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var wakaIndex : Int = 0

    //@IBOutlet weak var wakaTategakiTextView: UITategakiTextView!
    //UITategakiTextView
    @IBOutlet weak var wakaTextView: UITextView!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var setsumeiTextView: UITextView!
    
    let authorArray:NSArray = ["天智天皇","持統天皇","柿本人麻呂","山部赤人","猿丸大夫","中納言家持","阿部仲麿","喜撰法師","小野小町","蝉丸",
        "参議篁","僧正遍照","陽成院","河原左大臣","光孝天皇","中納言行平","在原業平朝臣","藤原敏行朝臣","伊勢","元良親王",
        "素性法師","文屋康秀","大江千里","菅屋","三条右大臣","貞信公","中納言兼輔","源宗于朝臣","凡河内躬恒","壬生忠岑",
        "坂上是則","春道列樹","紀友則","藤原興風","紀貫之","清原深養父","文屋朝康","右近","参議等","平兼盛",
        "壬生忠見","清原元輔","権中納言敦忠","中納言朝忠","謙徳公","曽禰好忠","恵慶法師","源重之","大中臣能宣","藤原義孝",
        "藤原実方朝臣","藤原道信朝臣","右大将道綱母","儀同三司母","大納言公任","和泉式部","紫式部","大弐三位","赤染衛門","小式部内侍",
        "伊勢大輔","清少納言","左京大夫道雅","権中納言定頼","相模","前大僧正行尊","周防内侍","三条院","能因法師","良暹法師",
        "大納言経信","祐子内親王家紀伊","前中納言匡房","源俊頼朝臣","藤原基俊","法性寺入道前関白太政大臣","崇徳院","源兼昌","左京大夫顕輔","待賢門院堀河",
        "後徳大寺左大臣","道因法師","皇太后宮大夫俊成","藤原清輔朝臣","俊恵法師","西行法師","寂蓮法師","皇嘉吉門院別当","式子内親王","殷富門院大輔",
        "後京極摂政前太政大臣","二条院讃岐","鎌倉右大臣","参議雅経","前大僧正慈円","入道前太政大臣","権中納言定家","従二位家隆","後鳥羽院","順徳院"
    
    ]
    
    let wakaArray:NSArray = ["秋の田の\nかりほの庵の\n苫をあらみ\nわが衣手は\n露にぬれつつ","春過ぎて\n夏来にけらし\n白妙の\n衣干すてふ\n天の香具山","あしびきの\n山鳥の尾の\nしだり尾の\nながながし夜を\nひとりかも寝む","田子の浦に\nうち出でて見れば\n白妙の\n富士の高嶺に\n雪は降りつつ\n","奥山に\n紅葉踏み分け\n鳴く鹿の\n声聞く時ぞ\n秋は悲しき",
        "鵲の\n渡せる橋に\n置く霜の\n白きを見れば\n夜ぞ更けにける ","天の原\nふりさけ見れば\n春日なる\n三笠の山に\n出でし月かも","わが庵は\n都の辰巳\nしかぞ住む\n世をうぢ山と\n人はいふなり","花の色は\n移りにけりな\nいたづらに\nわが身世にふる\nながめせしまに","これやこの\n行くも帰るも\n別れては\n知るも知らぬも\nあふ坂の関",
        "わたの原\n八十島かけて\n漕ぎ出でぬと\n人には告げよ\n海人の釣船 ","天つ風\n雲の通ひ路\n吹きとぢよ\n乙女の姿\nしばしとどめむ","筑波嶺の\n峰より落つる\nみなの川\n恋ぞ積もりて\n淵となりぬる","陸奥の\nしのぶもぢずり\nたれゆえに\n乱れそめにし\nわれならなくに","君がため\n春の野に出でて\n若菜摘む\nわが衣手に\n雪は降りつつ",
        "立ち別れ\nいなばの山の\n峰に生ふる\nまつとし聞かば\n今帰り来む","ちはやぶる\n神代も聞かず\n竜田川\nからくれなゐに\n水くくるとは","住の江の\n岸に寄る波\nよるさへや\n夢の通ひ路\n人目よくらむ","難波潟\n短き蘆の\nふしの間も\n逢はでこの世を\n過ぐしてよとや","わびぬれば\n今はたおなじ\n難波なる\nみをつくしても\n逢はむとぞ思ふ",
        "今来むと\nいひしばかりに\n長月の\n有明の月を\n待ち出でつるかな","吹くからに\n秋の草木の\nしをるれば\nむべ山風を\nあらしといふらむ","月見れば\nちぢにものこそ\n悲しけれ\nわが身ひとつの\n秋にはあらねど","このたびは\n幣も取りあへず\n手向山\n紅葉の錦\n神のまにまに","名にし負はば\n逢う坂山の\nさねかずら\n人に知られで\n来るよしもがな",
        "小倉山\n峰の紅葉\n心あらば\nいまひとたびの\nみゆき待たなむ ","みかの原\nわきて流るる\nいづみ川\nいつ見きとてか\n恋しかるらむ ","山里は\n冬ぞ寂しさ\nまさりける\n人目も草も\nかれぬと思へば ","心あてに\n折らばや折らむ\n初霜の\n置きまどはせる\n白菊の花 ","有明の\nつれなく見えし別れより\n暁ばかり\n憂きものはなし",
        "朝ぼらけ\n有明の月と\n見るまでに\n吉野の里に\n降れる白雪","山川に\n風のかけたる\nしがらみは\n流れもあへぬ\n紅葉なりけり","ひさかたの\n光のどけき\n春の日に\nしづ心なく\n花の散るらむ","誰をかも\n知る人にせむ\n高砂の\n松も昔の\n友ならなくに","人はいさ\n心も知らず\nふるさとは\n花ぞ昔の\n香に匂ひける",
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
        "きりぎりす\n鳴くや霜夜の\nさむしろに\n衣かたしき\nひとりかも寝む","わが袖は\n潮干に見えぬ\n沖の石の\n人こそ知らね\nかわく間もなし","世の中は\n常にもがもな\n渚漕ぐ\n海人の小舟の\n綱手かなしも","み吉野の\n山の秋風\nさよ更けて\nふるさと寒く\n衣打つなり","おほけなく\n憂き世の民に\nおほふかな\nわが立つ杣に\nすみ染の袖",
        "花さそふ\n嵐の庭の\n雪ならで\nふりゆくものは\nわが身なりけり","来ぬ人を\n松帆の浦の\n夕なぎに\n焼くや藻塩の\n身もこがれつつ","風そよぐ\n楢の小川の\n夕暮は\n御禊ぞ夏の\nしるしなりける","人も愛し\n人も恨めし\nあじきなく\n世を思ふゆゑに\nもの思ふ身は","百敷や\n古き軒端の\nしのぶにも\nなほ余りある\n昔なりけり"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setsumeiTextView.editable = false //setsumeiTextViewを編集不可能にする。

        let wakaTategakiTextView : UITategakiTextView = UITategakiTextView(frame: CGRectMake(self.wakaTextView.frame.origin.x, self.wakaTextView.frame.origin.y, self.wakaTextView.frame.width, self.wakaTextView.frame.height))
        wakaTategakiTextView.tategakiText(wakaArray[wakaIndex] as! String, textSize: 19)
            self.view.addSubview(wakaTategakiTextView)
        // Do any additional setup after loading the view.

        numberLabel.text = "第\(wakaIndex+1)番"
        authorLabel.text = authorArray[wakaIndex] as? String
    
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


public class UITategakiTextView: UITextView {
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer);
    }
    
    //縦書きテキストを作成
    func tategakiText(text:String,textSize:Int){
        
        let startX = Int(self.bounds.width) - textSize;
        let startY = 0;
        
        let lines = text.componentsSeparatedByString("\n") //\n区切りで配列に入れる
        let linesLen = lines.count
        
        for ( var i = 0; i < linesLen; i++){
            let line = lines[i];
            let colCnt = i;
            var rowCnt = 0;
            let c = line.characters.map{String($0)}
            for a in c {
                let _x = startX - (colCnt * textSize);
                let _y = startY + (rowCnt * textSize);
                self.makeLabel(String(a),x:_x,y:_y,s: textSize);
                rowCnt += 1;
            print(String(a));
            }

        }
    }
    
    //UILabelを作成
    func makeLabel(c :String, x:Int, y:Int, s:Int){
        let label = UILabel(frame: CGRectMake(CGFloat(x), CGFloat(y),CGFloat(s),CGFloat(s)));
        label.font = UIFont(name: "HiraMinProN-W6", size: CGFloat(s))
        label.text = c;
        self.addSubview(label);
    }
}

