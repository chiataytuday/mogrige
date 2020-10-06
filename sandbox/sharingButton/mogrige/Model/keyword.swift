//
//  keyword.swift
//  mogrige
//
//  Created by Taylor Hyobeen Moon on 2020/09/19.
//

import Foundation

class KeywordSet {
    let quarter: String
    let keywords: [String]
    var artTitle: String?
    var artImg: String?
    var artMemo: String?
    
    init(quarter: String, keywords: [String], artTitle: String?, artImg: String?, artMemo: String?) {
        self.quarter = quarter
        self.artTitle = artTitle
        self.keywords = keywords
        self.artImg = artImg
        self.artMemo = artMemo
    }
    
    static var dummyKeywords = [
        KeywordSet(quarter: "2020-03", keywords: ["고양이", "책", "강아지"], artTitle: "의자위에 고양이", artImg: "catChairBook", artMemo: nil),
        KeywordSet(quarter: "2020-03", keywords: ["허수아비", "옥수수", "가을"], artTitle: nil, artImg: nil, artMemo: "this is autumn")
    ]
}


struct KeywordList {
    let quarter: String
    let keywordId: Int
    let keyword: String
}

/*
struct MyArt {
    let createdDate: Date
    let appliedKeywords: [String]
    var artImg: String
    var artTitle: String
    var artMemo: String
    
    init(appliedKeywords: [String], artImg: String, artTitle: String, artMemo: String) {
        self.createdDate = Date()
        self.appliedKeywords = appliedKeywords
        self.artImg = artImg
        self.artTitle = artTitle
        self.artMemo = artMemo
    }
    
    static var dummyMyArt = [
        MyArt(appliedKeywords: ["고양이", "책", "강아지"], artImg: "catChairBook", artTitle: "untitled", artMemo: ""),
        MyArt(appliedKeywords: ["허수아비", "옥수수", "가을"], artImg: "catChairBook", artTitle: "untitled1", artMemo: "가을이 왔다!")
    ]
    
}


*/
