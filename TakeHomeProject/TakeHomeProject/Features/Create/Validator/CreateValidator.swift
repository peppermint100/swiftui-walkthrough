//
//  CreateValidator.swift
//  TakeHomeProject
//
//  Created by peppermint100 on 3/25/24.
//

import Foundation

struct CreateValidator {
    
    func validate(_ person: NewPerson) throws {
        
        if person.firstName.isEmpty {
            throw CreateValidatorError.invalidFirstName
        }
        
        if person.lastName.isEmpty {
            throw CreateValidatorError.invalidLastName
        }
        
        if person.job.isEmpty {
            throw CreateValidatorError.invalidJob
        }
    }
}

extension CreateValidator {
    enum CreateValidatorError: LocalizedError {
        case invalidFirstName
        case invalidLastName
        case invalidJob
    }
}

extension CreateValidator.CreateValidatorError {
    
    var errorDescription: String? {
        switch self {
        case .invalidFirstName:
            return "First Name Cannot be empty"
        case .invalidLastName:
            return "Last Name Cannot be empty"
        case .invalidJob:
            return "Job Cannot be empty"
        }
    }
}
