//
//  Constants.swift
//  Kids_Animation
//
//  Created by mind-288 on 7/13/21.
//

import UIKit

let CScreenHeight = UIScreen.main.bounds.height
let CScreenWidth = UIScreen.main.bounds.width

let CUIDevice = UIDevice.current
let isNotch = CUIDevice.hasNotch

let CMainThread = DispatchQueue.main

let CMainStoryboard = UIStoryboard(name: "Main", bundle: nil)

let rootVC = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
