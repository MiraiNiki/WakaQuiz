//
//  File.swift
//  WakaQuiz
//
//  Created by MiraiNIKI on 2016/03/01.
//  Copyright © 2016年 UnivercityofTsukuba. All rights reserved.
//

import AVFoundation

public func mkAudioPlayer(bgmName:String, bgmType:String) -> AVAudioPlayer{
    
    let bgmName = bgmName
    let bgmType = bgmType
    let bgSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(bgmName, ofType: bgmType)!)
    let bgm = try? AVAudioPlayer(contentsOfURL: bgSound)
    bgm?.prepareToPlay()
    
    return bgm!

}