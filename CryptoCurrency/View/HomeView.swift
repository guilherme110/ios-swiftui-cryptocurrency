//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 28/03/22.
//

import SwiftUI

struct HomeView: View {
    private struct TestStruct: Identifiable, Hashable {
        let id = UUID()
        let test = "Test"
    }
    
    var body: some View {
        GeometryReader { view in
            VStack {
                Text("Olá,")
                    .font(.custom("Quicksand-Bold", size: 20))
                    .foregroundColor(.grey500)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding([.top, .leading], 15.0)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text("Sr. Guilherme Soares")
                    .font(.custom("Quicksand-Bold", size: 20))
                    .foregroundColor(.darkBlue)
                    .fontWeight(.bold)
                    .padding(.leading, 15.0)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                CardSaldoView()
                    .frame(width: view.size.width, height: 250, alignment: .top)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 15))
                
                TesteCarroselView(
                    spacing: 25,
                    itemsData: [TestStruct(), TestStruct(), TestStruct(), TestStruct()],
                    zoomFactor: 0.8
                ) { itemData in
                    // this view is wrapped in VStack with proper width
                    CardTransacoesView()
                }
                .frame(width: view.size.width, height: 200)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
