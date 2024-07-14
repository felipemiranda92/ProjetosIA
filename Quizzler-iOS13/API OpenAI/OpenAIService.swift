//
//  OpenAIService.swift
//  Quizzler-iOS13
//
//  Created by Michael Bressiani on 07/07/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
import OpenAISwift

final class OpenAIService: ObservableObject {
    
    init() {}
    
    private var client: OpenAISwift?
    
    func setup() {
        let API_KEY = "Chave da API aqui"
        client = OpenAISwift(config: OpenAISwift.Config.makeDefaultOpenAI(apiKey: API_KEY))
    }
    
    func send(text: String, completion: @escaping (String) -> Void) {
        
        guard let client = client else {
            print("Client is not set up")
            return
        }

        client.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
            switch result {
            case .success(let model):
                if let choices = model.choices, let output = choices.first?.text {
                    print("Success: \(output)")
                    completion(output)
                } else {
                    print("No choices found in the response")
                    completion("No response received from the API.")
                }
            case .failure(let error):
                print("API Error: \(error.localizedDescription)")
                completion("Failed to get response from API.")
            }
        })
    }
}
