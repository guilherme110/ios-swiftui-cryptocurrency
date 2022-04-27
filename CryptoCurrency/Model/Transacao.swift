//
//  Transacao.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 31/03/22.
//

import Foundation

struct Transacao: Hashable, Codable, Identifiable {
    var id: Int
    var titulo: String
    var subtitulo: String
    var tipoAcao: String
    var usuarios: [String]
}
