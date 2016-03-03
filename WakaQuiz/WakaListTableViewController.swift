//
//  WakaListTableViewController.swift
//  WakaQuiz
//
//  Created by MiraiNIKI on 2016/02/19.
//  Copyright © 2016年 UnivercityofTsukuba. All rights reserved.
//

import UIKit
import AVFoundation
import RealmSwift

class WakaListTableViewController: UITableViewController {
//
//    @IBOutlet weak var wakaTable: UILabel!
    
    var wakaIndex: Int = 0

    let wakaArray:NSArray = [" 1. 秋の田のかりほの庵の苫をあらみ\n 　わが衣手は露にぬれつつ"," 2. 春過ぎて夏来にけらし白妙の\n 　衣干すてふ天の香具山"," 3. あしびきの山鳥の尾のしだり尾の\n　 ながながし夜をひとりかも寝む"," 4. 田子の浦にうち出でて見れば白妙の\n 　富士の高嶺に雪は降りつつ"," 5. 奥山に紅葉踏み分け鳴く鹿の\n 　声聞く時ぞ秋は悲しき ",
        " 6. 鵲の渡せる橋に置く霜の\n　 白きを見れば夜ぞ更けにける "," 7. 天の原ふりさけ見れば春日なる\n　 三笠の山に出でし月かも"," 8. わが庵は都の辰巳しかぞ住む\n 　世をうぢ山と人はいふなり"," 9. 花の色は移りにけりないたづらに\n 　わが身世にふるながめせしまに"," 10. これやこの行くも帰るも別れては\n　　知るも知らぬもあふ坂の関",
        " 11. わたの原八十島かけて漕ぎ出でぬと\n　　人には告げよ海人の釣船 "," 12. 天つ風雲の通ひ路吹きとぢよ\n　　乙女の姿しばしとどめむ"," 13. 筑波嶺の峰より落つるみなの川\n　　恋ぞ積もりて淵となりぬる "," 14. 陸奥のしのぶもぢずりたれゆえに\n　　乱れそめにしわれならなくに"," 15. 君がため春の野に出でて若菜摘む\n　　わが衣手に雪は降りつつ",
         " 16. 立ち別れいなばの山の峰に生ふる\n　　まつとし聞かば今帰り来む"," 17. ちはやぶる神代も聞かず竜田川\n　　からくれなゐに水くくるとは "," 18. 住の江の岸に寄る波よるさへや\n　　夢の通ひ路人目よくらむ "," 19. 難波潟短き蘆のふしの間も\n　　逢はでこの世を過ぐしてよとや "," 20. わびぬれば今はたおなじ難波なる\n　　みをつくしても逢はむとぞ思ふ ",
        " 21. 今来むといひしばかりに長月の\n　　有明の月を待ち出でつるかな"," 22. 吹くからに秋の草木のしをるれば\n　　むべ山風をあらしといふらむ"," 23. 月見ればちぢにものこそ悲しけれ\n　　わが身ひとつの秋にはあらねど"," 24. このたびは幣も取りあへず手向山\n　　紅葉の錦神のまにまに"," 25. 名にし負はば逢う坂山のさねかずら\n　　人に知られで来るよしもがな",
         " 26. 小倉山峰の紅葉葉心あらば\n　　いまひとたびのみゆき待たなむ "," 27. みかの原わきて流るるいづみ川\n　　いつ見きとてか恋しかるらむ "," 28. 山里は冬ぞ寂しさまさりける\n　　人目も草もかれぬと思へば "," 29. 心あてに折らばや折らむ初霜の\n　　置きまどはせる白菊の花 "," 30. 有明のつれなく見えし別れより\n　　暁ばかり憂きものはなし",
         " 31. 朝ぼらけ有明の月と見るまでに\n　　吉野の里に降れる白雪"," 32. 山川に風のかけたるしがらみは\n　　流れもあへぬ紅葉なりけり"," 33. ひさかたの光のどけき春の日に\n　　しづ心なく花の散るらむ"," 34. 誰をかも知る人にせむ高砂の\n　　松も昔の友ならなくに "," 35. 人はいさ心も知らずふるさとは\n　　花ぞ昔の香に匂ひける",
        " 36. 夏の夜はまだ宵ながら明けぬるを\n　　雲のいずこに月宿るらむ"," 37. 白露に風の吹きしく秋の野は\n　　つらぬきとめぬ玉ぞ散りける"," 38. 忘らるる身をば思はず誓ひてし\n　　人の命の惜しくもあるかな"," 39. 浅茅生の小野の篠原忍ぶれど\n　　あまりてなどか人の恋しき"," 40. 忍ぶれど色に出でにけりわが恋は\n　　ものや思ふと人の問ふまで",
        " 41. 恋すてふわが名はまだき立ちにけり\n　　人知れずこそ思ひそめしか"," 42. 契りきなかたみに袖をしぼりつつ\n　　末の松山波越さじとは "," 43. 逢ひ見てののちの心にくらぶれば\n　　昔はものを思はざりけり"," 44. 逢ふことの絶えてしなくはなかなかに\n　　人をも身をも恨みざらまし"," 45. あはれともいふべき人は思ほえで\n　　身のいたずらになりぬべきかな",
        " 46. 由良の門を渡る舟人かぢを絶え\n　　ゆくへも知らぬ恋のみちかな"," 47. 八重むぐらしげれる宿のさびしきに\n　　人こそ見えね秋は来にけり"," 48. 風をいたみ岩打つ波のおのれのみ\n　　くだけてものを思ふころかな"," 49. 御垣守衛士のたく火の夜は燃え\n　　昼は消えつつものをこそ思へ"," 50. 君がため惜しからざりし命さへ\n　　長くもがなと思ひけるかな",
        " 51. かくとだにえやは伊吹のさしも草\n　　さしも知らじな燃ゆる思ひを "," 52. 明けぬれば暮るるものとは知りながら\n　　なほ恨めしき朝ぼらけかな"," 53. 嘆きつつひとり寝る夜の明くる間は\n　　いかに久しきものとかは知る"," 54. 忘れじのゆく末まではかたければ\n　　今日を限りの命ともがな"," 55. 滝の音は絶えて久しくなりぬれど\n　　名こそ流れてなほ聞こえけれ",
         " 56. あらざらむこの世のほかの思ひ出に\n　　いまひとたびの逢ふこともがな"," 57. めぐり逢ひて見しやそれとも分かぬ間に\n　　雲隠れにし夜半の月影"," 58. 有馬山猪名の篠原風吹けば\n　　いでそよ人を忘れやはする "," 59. やすらはで寝なましものをさ夜更けて\n　　かたぶくまでの月を見しかな"," 60. 大江山いく野の道の遠ければ\n　　まだふみも見ず天の橋立",
         " 61. いにしへの奈良の都の八重桜\n　　けふ九重に匂ひぬるかな"," 62. 夜をこめて鳥のそら音ははかるとも\n　　よに逢坂の関は許さじ"," 63. 今はただ思ひ絶えなむとばかりを\n　　人づてならでいふよしもがな"," 64. 朝ぼらけ宇治の川霧たえだえに\n　　あらはれわたる瀬々の網代木 "," 65. 恨みわび干さぬ袖だにあるものを\n　　恋に朽ちなむ名こそ惜しけれ",
        " 66. もろともにあはれと思え山桜\n　　花よりほかに知る人もなし"," 67. 春の夜の夢ばかりなる手枕に\n　　かひなく立たむ名こそをしけれ"," 68. 心にもあらで憂き夜に長らへば\n　　恋しかるべき夜半の月かな"," 69. 嵐吹く三室の山のもみぢ葉は\n　　竜田の川の錦なりけり"," 70. 寂しさに宿を立ち出でてながむれば\n　　いづくも同じ秋の夕暮れ",
         " 71. 夕されば門田の稲葉訪れて\n　　蘆のまろ屋に秋風ぞ吹く"," 72. 音に聞く高師の浜のあだ波は\n　　かけじや袖のぬれもこそすれ"," 73. 高砂の尾の上の桜咲きにけり\n　　外山のかすみ立たずもあらなむ"," 74. 憂かりける人を初瀬の山おろしよ\n　　激しかれとは祈らぬものを"," 75. 契りおきしさせもが露を命にて\n　　あはれ今年の秋もいぬめり",
         " 76. わたの原漕ぎ出でて見ればひさかたの\n　　雲居にまがふ沖つ白波"," 77. 瀬をはやみ岩にせかるる滝川の\n　　われても末に逢はむとぞ思ふ"," 78. 淡路島通ふ千鳥の鳴く声に\n　　いく夜寝覚めぬ須磨の関守"," 79. 秋風にたなびく雲のたえ間より\n　　漏れ出づる月の影のさやけさ "," 80. ながからむ心も知らず黒髪の\n　　乱れてけさはものをこそ思へ",
        " 81. ほととぎす鳴きつる方をながむれば\n　　ただ有明の月ぞ残れる"," 82. 思ひわびさても命はあるものを\n　　憂きに堪へぬは涙なりけり"," 83. 世の中よ道こそなけれ思ひ入る\n　　山の奥にも鹿ぞ鳴くなる"," 84. 長らへばまたこのごろやしのばれむ\n　　憂しと見し世ぞ今は恋しき"," 85. 夜もすがらもの思ふころは明けやらぬ\n　　ねやのひまさへつれなかりけり",
        " 86. 嘆けとて月やはものを思はする\n　　かこちがほなるわが涙かな"," 87. 村雨の露もまだ干ぬまきの葉に\n　　霧立ちのぼる秋の夕暮"," 88. 難波江の蘆のかりねのひとよゆゑ\n　　身を尽くしてや恋ひわたるべき"," 89. 玉の緒よ絶えなば絶えねながらへば\n　　忍ぶることの弱りもぞする"," 90. 見せばやな雄島の海人の袖だにも\n　　濡れにぞ濡れし色は変はらず",
        " 91. きりぎりす鳴くや霜夜のさむしろに\n　　衣かたしきひとりかも寝む"," 92. わが袖は潮干に見えぬ沖の石の\n　　人こそ知らねかわく間もなし"," 93. 世の中は常にもがもな渚漕ぐ\n　　海人の小舟の綱手かなしも"," 94. み吉野の山の秋風さよ更けて\n　　ふるさと寒く衣打つなり "," 95. おほけなく憂き世の民におほふかな\n　　わが立つ杣にすみ染の袖",
        " 96. 花さそふ嵐の庭の雪ならで\n　　ふりゆくものはわが身なりけり"," 97. 来ぬ人を松帆の浦の夕なぎに\n　　焼くや藻塩の身もこがれつつ"," 98. 風そよぐ楢の小川の夕暮は\n　　御禊ぞ夏のしるしなりける"," 99. 人も愛し人も恨めしあじきなく\n　　世を思ふゆゑにもの思ふ身は"," 100. 百敷や古き軒端のしのぶにも\n　　 なほ余りある昔なりけり"
            ]
    
    var seDetail: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //<-- 効果音の設定 -->
        seDetail = mkAudioPlayer("seDetail", bgmType: "mp3")
        seDetail!.volume = 0.3
        
        tableView.registerNib(UINib(nibName: "WakaListTableViewCell",bundle:nil), forCellReuseIdentifier: "cell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return wakaArray.count

    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! WakaListTableViewCell
        
        cell.wakaLabel.text = "\(wakaArray[indexPath.row])"
        
        let realm = try! Realm()
        let waka = realm.objects(Waka)[indexPath.row]
        if(waka.total != 0){
        cell.scoreLabel.text = "\((Int)((Double)(waka.score)/(Double)(waka.total)*100))%"
        }else{
        cell.scoreLabel.text = "0%"
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        wakaIndex = indexPath.row
        seDetail?.play()
        performSegueWithIdentifier("toDetailViewController", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toDetailViewController"){
            let wakaVC: DetailViewController = (segue.destinationViewController as! DetailViewController)
            wakaVC.wakaIndex = wakaIndex
        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
