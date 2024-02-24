//
//  SelectCurrency.swift
//  CurrencyConverter2
//
//  Created by Joao Leal on 2/21/24.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            
            VStack{
                
                Text("Select the currency you want to convert \(Currency.silverPenny.rawValue)")
                    .fontWeight(.bold)
                
                IconGrid(currency: $topCurrency)
                
                
                
                Text("Selec the currency you would like to convert to")
                    .fontWeight(.bold)
                
                
                IconGrid(currency: $bottomCurrency)
                
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .padding()
    
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {  
    SelectCurrency(topCurrency: .constant(.copperPenny), bottomCurrency: .constant(.goldPiece))
}
