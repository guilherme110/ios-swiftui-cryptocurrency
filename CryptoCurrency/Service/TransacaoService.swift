//
//  RelatorioService.swift
//  CryptoCurrency
//
//  Created by Guilherme Mac on 18/04/22.
//

import Foundation
import Combine
import Alamofire

protocol TransacaoProtocol {
    func buscaTransacoes() -> AnyPublisher<DataResponse<[Transacao], NetworkError>, Never>
    func buscaTransacoesRealizadas() -> AnyPublisher<DataResponse<[TransacaoRealizada], NetworkError>, Never>
}

class TransacaoService {
    //MARK: - URL's
    
    private let urlBuscaTransacoes = "http://localhost:3000/transacoes"
    private let urlBuscaTransacoesRealizadas = "http://localhost:3000/transacoes/realizadas"
    
    static let shared: TransacaoProtocol = TransacaoService()
    private init() { }
}

// MARK: - Extensions

extension TransacaoService: TransacaoProtocol {
    
    func buscaTransacoes() -> AnyPublisher<DataResponse<[Transacao], NetworkError>, Never> {
        return AF.request(urlBuscaTransacoes, method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .publishDecodable(type: [Transacao].self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func buscaTransacoesRealizadas() -> AnyPublisher<DataResponse<[TransacaoRealizada], NetworkError>, Never> {
        return AF.request(urlBuscaTransacoesRealizadas, method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .publishDecodable(type: [TransacaoRealizada].self)
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
