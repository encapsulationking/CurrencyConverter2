//
//  ContentView.swift
//  CurrencyConverter2
//
//  Created by Joao Leal on 2/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var rightTyping
    @FocusState var leftTyping
    
    @State var rightCurrency: Currency = .copperPenny
    @State var leftCurrency: Currency = .copperPenny
    
    @State private var rightAmount = ""
    @State private var leftAmount = ""
    
    @State private var showExchangeInfo = false
    @State private var showSelectedCurrency = false
    var body: some View {
        ZStack{
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Concerter")
                    .font(.title)
                    .foregroundStyle(.white)
                
                HStack{
                    VStack{
                        HStack{
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.padding(.bottom, -5)
                            .onTapGesture {
                                showSelectedCurrency.toggle()
                            }
                        
                        TextField("Amount", text: $leftAmount)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                        
                            .multilineTextAlignment(.trailing)
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack{
                        HStack{
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }.padding(.bottom, -5)
                            .onTapGesture {
                                showSelectedCurrency.toggle()
                            }
                        TextField("Amount", text: $rightAmount)
                        
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)
                            .focused($rightTyping)
                        
                            .multilineTextAlignment(.trailing)
                    }
                }.padding()
                    .background(.black.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 12))
                Spacer()
                Button { showExchangeInfo.toggle() }
            label: {
                Image(systemName: "info.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            }
        }
        .sheet(isPresented: $showSelectedCurrency, content: {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        })
        .sheet(isPresented: $showExchangeInfo, content: {
            ExchangeInfo()
        })
        .onChange(of: leftAmount) {
            if leftTyping == true {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }}
        
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)} }
        
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)}
        
        
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)}
    }

}

#Preview {
    ContentView()
}
