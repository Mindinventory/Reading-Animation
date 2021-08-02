//
//  Model.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/14/21.
//

import UIKit

//MARK:- Home
//MARK:-
struct HomeCollection {
    
    let image: UIImage
    let title: String
    let subTitle: String
}

enum HomeSelection: String {
    
    case numbers = "Numbers"
    case reading = "Reading"
    case shapes = "Shapes"
    case letters = "Vocab & Letters"
    case learningAnalysis = "Learning Analysis"
    case settings = "Settings"
}

//MARK:- Reading
//MARK:-
struct ReadingPage {
    let page: Int
}
