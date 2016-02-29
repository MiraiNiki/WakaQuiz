//
//  QuizViewController.swift
//  WakaQuiz
//
//  Created by MiraiNIKI on 2016/02/19.
//  Copyright © 2016年 UnivercityofTsukuba. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController,AVAudioPlayerDelegate {

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
    var questionArray:[String] = [
        "秋の田んぼの世話をするための仮の小屋は屋根の編み目が荒く、私の袖が夜露に濡れてしまっていることよ。\n","天の香具山に白い衣装が干してある。夏が来たようだ。\n","長い長い夜を愛する人と離れ離れになって一人寂しく寝るのだろうなあ。\n","田子の浦から遠くを眺めると藤の峰に真っ白な雪が降り積もっているなあ。\n","人里離れた山の奥の地一面の紅葉を踏みながら鹿の声が聞こえた時は秋がとても寂しく感じられるなあ。\n",
        "天の川にカササギが掛けていった橋に霜が降りている。その白さを見ると夜が随分更けたなあと思う。\n","大空を見上げてみると、月がとても美しいことよ。故郷の三笠山にかかっている月でもあるのだなあ。\n","私が住んでいる家は静かなところにあるので落ち着く。しかし皆さんは私が人付き合いが煩わしいと思ってこの場所に住んでいると思っているみたいですね。\n","花が色あせるように私の美しさも衰えてしまったわ。恋愛なんかの悩みに、長雨を眺めながら思いを馳せているうちに。\n",
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
        "今すぐに行きますとあなたがおっしゃったのを信じて待っていたら9月の夜明けを待つことになってしまいましたよ。\n",//21
        "風が吹くや否や、秋の草木がしおれてしまうなあ。だから草木を荒らす山から吹く風を”嵐”というのだなあ\n",
        "月を見上げるといろいろなことを考えてしまい心が乱されてしまうなあ。別に私だけの秋ではないけれど。\n",
        "今回の旅では神に捧げるぬさをご用意できませんでした。どうか、この手向山の錦織のように美しい紅葉をどうかお受け取りください。\n",
        "あうという文字を名に逢坂山のさねかずらよ、人に知られずにあなたが私のところへ来る方法はないものかなあ。\n",
        "小倉山の峰の紅葉よ。もしお前に心があるならば、もう一度あるはずの御幸を、散らずに待っておいておくれ。\n",
        "みかの原のいづみ川よ。私はいつあなたにお会いして、あなたを恋しいと思うようになったのでしょうか。あなたは外出なさらないから、お会いしたこともないのに。\n",
        "山里は、ただでさえ寂しいところなのに、冬になると一層寂しくなるなあ。草だけでなく、人の行き来もなくなってしまったと思うと。\n",
        "当てずっぽうに折ってみようかしら。真っ白な初霜が降りて、霜なのか白菊なのか、わからなくなった白菊の花を。\n",
        "夜明け前の有明の月がそっけなく光っていた、あなたとの冷たくそっけない別れの日以来、夜明けの暁ほど私を憂鬱にさせるものはありません。\n",
        "夜があけていく頃に外を眺めると有明の月の光かと思うほどに、吉野の里に真っ白な雪が降り積もっているなあ。\n",//31
        "山の中を流れる川をせき止めるようにして作られた柵は、紅葉が川面にたくさん散って流れている紅葉だったよ。\n",
        "穏やかでのどかな春の日に、どうして桜は落ち着きなく散り急いでいるのだろうか。\n",
        "年老いた私は一体誰を心友としようか。古いと名高い高砂の松の木でさえ昔馴染みの友ではないのに。\n",
        "あなたの心は昔のままでしょうか。昔馴染みのこの里には昔のまま梅の花の香りがしていますよ。\n",
        "夏の短い夜は、あっという間に開けてしまうなあ。一体月は雲のどこに隠れるのだろうか。\n",
        "葉の上の白露に風が吹き当たっている秋の野は、その白露が風に散り乱れて、まるでガラス玉が散らばっているようだなあ。\n",
        
        
        "あなたから忘れられても私は気にしません。しかし、あんなにも神様に誓った愛が消えることで、神様の罰をあなたが受けないか心配になのです。\n",
        "ススキや細い竹がまばらに生えている篠のように私は恋を忍ばせていましたが、忍びきれず、どうしてこんなにあなたを恋しく思ってしまうのでしょうか。\n",
        "誰にも知られないようにしていたのに、私の恋心は周りの人から尋ねられるほどには顔に出るようになってしまいました。\n",
        "私が恋をしているという噂が早くも広まってしまった。人知れずに密かに恋をし始めたところだったのになあ。\n",
        "あなたと二人で袖をしぼれるくらいに涙を流して誓いましたね。松山を波が超えないのと同じくらい、絶対に心変わりはしないと。\n",
        "あなたにお会いできて一緒に過ごした気持ちに比べると、お会いする前の恋の気持ちなどないも同然ですよ。\n",
        "もしも会うことが全くないのならば、あなたの無情を恨んだり私自身の辛さを恨んだりすることはなかったでしょうに。\n",
        "死んだとしても可哀想だと泣いてくれる人がいると思えないまま、私は孤独に死んでいくのだろうか。\n",
        "舟人が舵を失くして、船が行くあても知らずに漂うように、私の恋路もどうなっていくのかわからず漂っている。\n",
        "つる草のむぐらのような雑草がたくさん茂っている荒地の住まいに尋ねる人はいないが、秋だけはやってきてくれたのだなあ。\n",
        "風が激しいので、岩に当たる波がくだけ散るように、私一人だけが心砕かれ、恋して思い悩むのだよ。\n",
        "宮中を守る衛士がたくかがり火のように夜は激しく燃え上り、昼間は消えそうに重い沈んでいることだよ。\n",
        "あなたにお会いするためなら惜しくない命でしたが、お会いしてからは少しでも長く生きたいと思うようになったことだよ。\n",
        "あなたのことをこんなに思っていることを伝えることもできないのだから、伊吹山に生えるさしも草の香りのように、私の熱い思いをあなたはご存知ないのでしょうね。\n",
        "また暮れればあなたにお会いできるとわかっていても夜が明けるのは恨めしく思ってしまいます。\n",
        "あなたがいらっしゃらないことを嘆きながら一人で明ける夜がどんなに長いものか、お分かりになりますか。お分かりにならないでしょうけれど。\n",
        "いつまでも忘れないとおっしゃるけれど、それは難しいことなので、いっその事今日を限りに死んでしまいたい。\n",
        "水が枯れて、音を立てる事もなくなってから随分と長い月日が経ちましたが、その滝の名声は世に流れて知れ渡っています。\n",
        "もう直ぐ病気で死んでしまうので、死ぬ前にもう一度だけあなたに会いたい。\n",
        "久しぶりに会えたのに直ぐに雲に隠れてしまう夜明けの月のように、あなたもあっという間に帰ってしまいましたね。\n",
        "有馬山の近くの笹原に風が吹けば、そよそよと音がする。どうして私があなたのことを忘れることができましょうか。\n",
        "あなたがいらっしゃらないと分かっていたなら、躊躇わずに寝てしまいました。お待ちしているうちに夜も更けて月が西に傾いてしまいました。\n",
        "大江山を超えて幾野へ行く道はとても遠いので、天橋立へは行ったこともありませんし、母からの手紙を見てもいませんよ。\n",
        "昔都があった、奈良の八重桜が今日は九重の宮中に美しくさいていることですよ。\n",
        "夜が明けないうちに鶏の声真似をして私を騙そうとしても、あなたにお会いすることはありませんよ。\n",
        "今はもうあなたのことを諦めてしまおう。このことを人づてではなくあなたにお会いして言う方法があればいいのになあ。\n",
        "夜がほのぼのと明ける頃、宇治川にかかる霧が途切れ途切れになって、その間から見えて来る魚を捕らえるための網代木であったよ。\n",
        "あの人の釣れなさに恨み嘆いて泣き枯れてしまいそうなのにそれにも増して恋の噂がみっともなく広まってしまい、私の名前に傷がつくのは惜しいことだ。\n",
        "山桜よ、私がお前を懐かしく思うように、お前も私を懐かしく思ってくれよ。こんな山奥に入った私にはお前の他に私の心境を知る者などいないのだから。\n",
        "春の夜の夢のように儚くて短い戯れのためにつまらない噂が立ってしまうのでしょう。恥ずかしく私の名前が広がってしまうのは惜しいなあ。\n",
        "辛い世の中を思いがけなく生きながらえば、きっと夜半の月を美しく感じるだろう。\n",
        "神様がいらっしゃる御室山の紅葉は、竜田川に散り落ちてまるで錦のようだ。\n",
        "あまりの寂しさに耐えかねて宿を出てみれば、どこもかしこも寂しい秋の夕暮れだったよ。\n",
        "夕方になると、門の前の稲の葉がそよそよと葉を揺らし葦で出来た粗末な家に秋風が吹いているよ。\n",
        "浮気と名高いあなたに気をつけておかなければ、噂に名高い高師の浜の大げさに立つ波で袖が濡れるように私は涙で袖を濡らすことになってしまいそうで困ります。\n",
        "遠くに見える山の峰に桜が咲いたなあ。どうか、近くの山の霞よ、どうか立ち込めないでおくれ。\n",
        "あの人が振り向いてくれますようにと初瀬の観音様にお祈りしましたが、山おろしの激しさのように恋が辛く激しくなってしまうようにとはお祈りしなかったのになあ。\n",
        "私を頼りにしてくださいとお約束してくださった、させも草に置かれた恵みの露のようなお言葉を命のように大事にしてまいりましたのに、今年の秋も残念ながら過ぎていきますよ。\n",
        "広々とした大海に船を出して周りを見ると遥か彼方の水平線は海と空が一つに見えて雲と見違えてしまうような沖の彼方の白波だなあ。\n",
        "早い浅瀬の流れに、岩に当たって滝川が二つに分かれてもまた合流するように、仲が悪くなっても、離れてしまっても、将来はまた、必ず逢いましょう。\n",
        "あの須磨の関守は淡路島を行き来する千鳥のもの悲しい鳴き声に幾夜目を覚ましたのだろう。\n",
        "秋風に吹かれてたなびいている雲の切れ間から、漏れ出てくる月の光の、なんと清らかなことだろう。\n",
        "あなたがずっと心変わりしないかどうかもわからないのに一夜を過ごしてしまいました。私の心はこの乱れた黒髪のように乱れて、物思いに沈んでしまっています。\n",
        "ホトトギスの鳴き声が聞こえた方を眺めると、ただ明け方の月が残っているだけでした。\n",
        "あなたの無情を嘆いて、耐えられないと思いながらも生きてきましたが、やはり耐えられない辛さに涙がこぼれてしまいます。\n",
        "世の中には、辛さから逃げる方法はないのだなあ。深い山奥に入っても、鹿が悲しそうに鳴いているよ。\n",
        "このまま生きているならば、辛い今を懐かしく思うことがあるのだろうか。今、昔の辛いことを懐かしく思うように。\n",
        "一晩中あなたのことを思い嘆いているこのころは夜がとても長く感じられ、朝日が差し込むはずの寝屋の雨戸の隙間さへ無情に感じてしまうのです。\n",
        "月は私に嘆きなさいと言っているんだろうか。そうではないのだか、月のせいにしてしまう私の涙ですよ。\n",
        "にわか雨の雫もまだ乾ききらない木に霧がほのかに立ちのぼっている、さみしい秋の夕暮れですよ。\n",
        "たった一晩ともにしただけだけれど、私は恋に落ちてしまい、恋の悩みに苦しむことになってしまいました。\n",
        "私の命よ、耐えてしまうなら早く耐えておくれ。耐え忍ぶ心が弱って、私の恋心が知られてしまうかもしれません。\n",
        "涙に濡れて色の変わった私の袖をお見せしたいものです。雄島の漁師の袖ですら、あんなに濡れても色は変わらないというのに。\n",
        "こおろぎがしきりに鳴いています。この寒い冬の夜をむしろに衣を着たまま片袖だけ敷いて私は一人寂しく眠るのだなあ。\n",
        "私の袖は、沖の石のように引き潮の時にも海のなかにあって、誰に知られることもなく、恋の涙で乾く暇もありません。\n",
        "この世がずっと変わらなければいいのに。波打ち際の小舟が引網を引いていくような、世の中の変化を感じてしみじみとしてしまうのです。\n",
        "吉野の山から吹く秋風が吹いている。衣を打つきぬたの音が聞こえてくるようだなあ。\n",
        "私の身にはすぎたことだとは思いますが、この世の中の人々の幸せを祈りながら、この法衣をかけましょう。比叡山の僧侶となった私なのですから。\n",
        "嵐が吹いて庭の桜を散らす、その雪のようにふる花びらなのではなく、ふるびていくのは、私の身なのだなあ。\n",
        "いつまでも来ないあなたを待つ私は、藻塩のように身を焼かれる思いで恋焦がれています。\n",
        "風がそよぐ小川の夕暮れを見ると秋の気配を感じるのだが、川で禊（みそぎ）が行われているのを見ると今は夏なのだと感じるのです。\n",
        "人を愛しくも恨めしくも思います。思う通りにならないつまらない世の中だと思うから色々と思い悩んでしまうのですよ。\n",
        "荒れ果ててしまった御所の古い軒下に生えるしのぶ草の葉を見るにつけて、昔の御所の華やかさがしみじみと偲ばれて偲んでも偲んでも偲びきれない。昔の天皇を中心に平和に治められていたこの時代のことは。\n"
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
        
        //<--------     questionTextViewを編集可能にする。      -------->
        questionTextView.editable = false
        
        ifAnswer = false
        
        //<--------     背景をランダムに設定　　---------->
        rnd = Int(arc4random_uniform(54))
        rndHaikei()
        
        
        //<------------   問題をランダムに設定   ------------->
        //とりあえず10個の配列でやってみる。あとで変更の必要が有る。!!注意!!
        questionRnd = Int(arc4random_uniform(100))
        rndQuestion()
        
        
        //<-------- 正解を表示する場所の決定  ------>
         selectAnswerRnd = Int(arc4random_uniform(3))

        
        //<-------- ダミーの答えのインデックス  ------>
        //とりあえず10個の配列でやってみる。あとで変更の必要が有る。!!注意!!
            dummyAnswerRnd1 = Int(arc4random_uniform(100))
            //正解を一つにする。
            while(dummyAnswerRnd1 == questionRnd){
                dummyAnswerRnd1 = Int(arc4random_uniform(100))
            }
            dummyAnswerRnd2 = Int(arc4random_uniform(100))
            while(dummyAnswerRnd2 == questionRnd || dummyAnswerRnd2 == dummyAnswerRnd1){
                dummyAnswerRnd2 = Int(arc4random_uniform(100))
            }
        
        
        //<--------  選択肢の設定・縦書きテキストの配置  ---------->
        //位置は各textView
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
            
        }
        
        //<-----   縦書きテキストよりもボタンを前に配置する。   ----->
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
            resultView.questionIndex = self.questionRnd
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
