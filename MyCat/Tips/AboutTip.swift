//
//  AboutTip.swift
//  MyCat
//
//  Created by Sai Vikshit Kode on 11/2/25.
//

import Foundation
import TipKit

struct AboutTip: Tip {
    var title: Text {
        Text("About MyCat")
    }
    
    var message: Text? {
        Text("Tap on this button to know more about the App")
    }
    
    var image: Image? {
        Image(.catimg2)
    }
}
