import UIKit

enum election {
    case support, oppose
}

//var votes: [String] = []
var votes: [election] = []

var support = 0
var oppose = 0


// use for Lesson 3.5 Enums in Fundamentals
//votes += ["Support", "Oppose", "Support", "Support", "Oppose", "Support", "Support", "Oppose", "Support", "Oppose"]

votes += [.support, .support, .oppose, .support, .oppose, .oppose, .oppose, .support]
//print(votes)

//for vote in votes {
//    if vote == "Support" {
//        support += 1
//    } else {
//        oppose += 1
//    }
//}

for vote in votes {
    switch vote {
    case .support:
        support += 1
    case .oppose:
        oppose += 1
    }
}

func tallyVotes(supportVotes: Int, opposeVotes: Int) -> String {
    if supportVotes == opposeVotes {
        return "The issue ballot initiative vote is tied. We will have to have another election."
    } else if supportVotes > opposeVotes {
        return "The issue has passed."
    } else {
        return "The issue has not been passed."
    }
}

let results = tallyVotes(supportVotes: support, opposeVotes: oppose)

print(results)
