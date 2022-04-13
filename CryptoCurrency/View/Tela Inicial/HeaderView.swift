//
//  HeaderView.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 12/04/22.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("Olá,")
                .font(.custom("Quicksand-Bold", size: 20))
                .foregroundColor(.grey500)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top, 25.0)
                .padding(.leading, 15.0)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            Text("Sr. Guilherme Soares")
                .font(.custom("Quicksand-Bold", size: 25))
                .foregroundColor(.darkBlue)
                .fontWeight(.bold)
                .padding(.leading, 15.0)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
