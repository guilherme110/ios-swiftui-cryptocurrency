//
//  RelatorioService.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 18/04/22.
//

import Foundation
import Combine
import Alamofire

protocol RelatorioProtocol {
    func buscaRelatorios() -> AnyPublisher<DataResponse<[Relatorio], NetworkError>, Never>
}

class RelatorioService {
    //MARK: - URL's
    
    private let urlBuscaRelatorios = "http://localhost:3000/relatorios"
    
    static let shared: RelatorioProtocol = RelatorioService()
    private init() { }
}

// MARK: - Extensions

extension RelatorioService: RelatorioProtocol {
    
    func buscaRelatorios() -> AnyPublisher<DataResponse<[Relatorio], NetworkError>, Never> {
        return AF.request(urlBuscaRelatorios, method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .publishDecodable(type: [Relatorio].self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
