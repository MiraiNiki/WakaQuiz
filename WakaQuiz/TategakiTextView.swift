//
//  TategakiTextView.swift
//  WakaQuiz
//
//  Created by MiraiNIKI on 2016/03/01.
//  Copyright © 2016年 UnivercityofTsukuba. All rights reserved.
//

import UIKit

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

