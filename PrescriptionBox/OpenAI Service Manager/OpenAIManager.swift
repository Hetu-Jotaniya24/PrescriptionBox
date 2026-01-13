//
//  OpenAIManager.swift
//  PrescriptionBox
//
//  Created by Hetu Jotaniya on 01/10/25.
//

import Foundation
import OpenAI

class OpenAIManager {
    let userSettings: UserSettings
    let openAI: OpenAI
    init(userSettings: UserSettings) {
        self.userSettings = userSettings
        self.openAI = OpenAI(apiToken: userSettings.cred)
    }
    
    func getPrescriptionResult() {
        let query = CreateModelResponseQuery(
            input: .textInput("Return structured output"),
            model: .gpt4_o,
            text: .jsonSchema(.init(
                name: "research_paper_extraction",
                schema: .jsonSchema(.init(
                    .type(.object),
                    .properties([
                        "patientName": .init(
                            .type(.string)
                        ),
                        "medicationName": .init(
                            .type(.string),
                        ),
                        "dosage": .init(
                            .type(.string)
                        ),
                        "frequency": .init(
                            .type(.string)
                        ),
                        "prescribedDate": .init(
                            .type(.string)
                        ),
                        "doctorName": .init(
                            .type(.string)
                        ),
                        "notes": .init(
                            .type(.string)
                        ),
                    ]),
                    .required(["title, authors, abstract, keywords"]),
                    .additionalProperties(.boolean(false))
                )),
                description: "desc",
                strict: false
            ))
        )

        let response = try await openAI.responses.createResponse(query: query)
        for output in response.output {
            switch output {
            case .outputMessage(let message):
                for content in message.content {
                    switch content {
                    case .OutputTextContent(let textContent):
                        print("json output structured by the schema: ", textContent.text)
                    case .RefusalContent(let refusal):
                        // Handle refusal
                        break
                    }
                }
            default:
                // Handle other OutputItems
                break
            }
        }
    }
}
