//
//  VotingState.swift
//  PresidentialVote
//
//  Created by Brian Foutty on 4/11/24.
//

import Foundation

// #2
enum VotingState {
    
    case startVote, check, total //castVote //submitVote
    
    var status: String {
        switch self {
        case .startVote:
            return "Would you support a tax increase to support a homeless shelter in Warren?"
        case .check:
            return "Here is the total vote so far"
        case .total:
            return "Here is final vote tally"
        }
    }
    
}
