//
//  TesteLoadImageView.swift
//  CryptoCurrency
//
//  Created by Guilherme Soares on 03/04/22.
//

import SwiftUI

struct TesteLoadImageView: View {
    var body: some View {
        let someUrl = URL(string: "https://cdn.pixabay.com/photo/2016/11/21/14/53/adult-1845814_960_720.jpg")
        if let url = someUrl {
            RemoteImageView(
              url: url,
              placeholder: {
                Image("placeholder")
              },
              image: {
                  $0.resizable()
                      .frame(width: 40, height: 40)
                      .clipShape(Circle())
                      .overlay(Circle().stroke(Color.grey200, lineWidth:2))
                      .padding(.leading, -80.0)
                  
              }
            )
        }
    }
}

struct TesteLoadImageView_Previews: PreviewProvider {
    static var previews: some View {
        TesteLoadImageView()
    }
}
