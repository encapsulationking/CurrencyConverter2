//
//  CurrencyTip.swift
//  CurrencyConverter2
//
//  Created by Joao Leal on 2/24/24.
//
import TipKit
import Foundation

struct CurrencyTip: Tip {
    var title = Text("Tap to Change Currency ")
    var message: Text?
    
    var image: Image = Image(systemName: "info.circle.fill", variableValue: .infinity)
}
