//
//  VotingState.swift
//  PresidentialVote
//
//  Created by Brian Foutty on 4/11/24.
//

import Foundation

enum VotingState {
    
    case startVote, check, total //castVote //submitVote
    
    var status: String {
        switch self {
        case .startVote:
            return "Please vote for President of these United States"
        case .check:
            return "Here is the total vote so far"
        case .total:
            return "Here is final vote tally"
        }
    }
    
}
