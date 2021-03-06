//
//  VideoExcluder.swift
//  CatDogTube
//
//  Created by Kenichiro Sato on 2016/09/02.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

class VideoExcluder: NSObject {

    static private let NG_WORDS:[String] = [
        "シュレディンガー",
        "ワルツ",
        "おまわりさん",
        "オッパイ",
        "織田裕二",
        "マーチ",
        "Greeeen",
        "力士",
        "Lineage",
        "プルー",
        "食糞",
        "ヨンヨン",
        "ソフトバンク",
        "アンドロメダ",
        "えっち",
        "メイク",
        "Mmd",
        "なめこ",
        "迷子",
        "Mimosa",
        "難波",
        "ピアノ",
        "ツチグモ",
        "3D",
        "MGS",
        "クモ",
        "アニメ",
        "CM",
        "ひまわり",
        "はねられ",
        "マツコ",
        "nikon",
        "東方",
        "性",
        "虐待",
        "合唱",
        "ダンス",
        "物語",
        "死",
        "エロ",
        "嵐",
        "マイクラ",
        "運動会",
        "閲覧注意",
        "リンパ",
        "初音",
        "Episode",
        "プリキュア",
        "ミケランジェロ",
        "メガネ",
        "MAD",
        "やさぐれ",
        "ミスキャンパス",
        "踏み潰す",
        "日本橋",
        "りゅりゅ",
        "うんこ",
        "リンゴの森",
        "禁欲",
        "やんちゃな",
        "ペットショップ",
        "きくちペット",
        "歌ってみた",
        "ショッキング",
        "オナクラ",
        "あんスタ",
        "欅坂",
        "観ないで",
        "デリヘル"
        ]
    
    class func excludeInappropriateVideos(_ videos:[Video]?) -> [Video]? {
        return videos?.filter{!VideoExcluder.isInappropriateVideo($0)}
    }
    
    private class func isInappropriateVideo(_ video:Video) -> Bool {
        for ngWord in VideoExcluder.NG_WORDS {
            if (video.title.lowercased().contains(ngWord.lowercased())) {
                return true
            }
        }
        return false
    }
}
