//
//  ViewController.swift
//  PresidentialVote
//
//  Created by Brian Foutty on 4/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    // #1
    // #3
    // MARK: - IB Outlets
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var submitVoteButton: UIButton!
    @IBOutlet weak var voteResultLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var totalButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    // #4
    // MARK: - Instance Properties
    var yesState = false
    var noState = false
    var yesVotes = 0
    var noVotes = 0
    

    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(forState: .startVote)
    }
    
    // MARK: - IB Actions
    // #6
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        // #8
        yesState = true
        noButton.isEnabled = false
    }
    
    // #7
    @IBAction func noButtonTapped(_ sender: UIButton) {
        // #9
        noState = true
        yesButton.isEnabled = false
    }
    
    // #8
    @IBAction func submitVoteButtonTapped(_ sender: UIButton) {
        // #10
        voteCast()
        updateUI(forState: .startVote)
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        yesVotes = 0
        noVotes = 0
        yesState = false
        noState = false
        updateUI(forState: .startVote)
        
        
    }
    
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        updateUI(forState: .startVote)
        
    }
    
    // #11
    @IBAction func totalButtonTapped(_ sender: UIButton) {
        tallyVotes(yesVotes: yesVotes, noVotes: noVotes)
        updateUI(forState: .total)
    }
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        updateUI(forState: .check)
        checkVotes(yesVotes: yesVotes, noVotes: noVotes)
    }
    
    
    // MARK: - Instance Methods
    // #5
    func updateUI(forState state: VotingState) {
        
        switch state {
        case .startVote:
            voteResultLabel.isHidden = true
            resetButton.isHidden = true
            returnButton.isHidden = true
            totalButton.isHidden = false
            resetButton.isEnabled = false
            returnButton.isEnabled = false
            totalButton.isEnabled = true
            yesButton.isEnabled = true
            noButton.isEnabled = true
            submitVoteButton.isEnabled = true
            submitVoteButton.isHidden = false
            checkButton.isEnabled = true
            checkButton.isHidden = false
            detailsLabel.text = VotingState.startVote.status
            
            
        case .check:
            voteResultLabel.isHidden = false
            submitVoteButton.isHidden = true
            submitVoteButton.isEnabled = false
            yesButton.isEnabled = false
            noButton.isEnabled = false
            returnButton.isEnabled = true
            returnButton.isHidden = false
            totalButton.isEnabled = false
            totalButton.isHidden = true
            detailsLabel.text = VotingState.check.status
            
        case .total:
            voteResultLabel.isHidden = false
            submitVoteButton.isHidden = true
            submitVoteButton.isEnabled = false
            yesButton.isEnabled = false
            noButton.isEnabled = false
            returnButton.isHidden = true
            returnButton.isEnabled = false
            resetButton.isHidden = false
            resetButton.isEnabled = true
            checkButton.isEnabled = false
            checkButton.isHidden = true
            detailsLabel.text = VotingState.total.status
            
        }
    }
    
    // #12
    func tallyVotes(yesVotes: Int, noVotes: Int) {
        if yesVotes > noVotes {
            voteResultLabel.text = "The issue passed with a vote total of \(yesVotes) YES votes to \(noVotes) NO votes."
        } else if yesVotes < noVotes {
            voteResultLabel.text = "The issue failed with a vote total of \(yesVotes) YES votes to \(noVotes) NO votes."
        } else if yesVotes == noVotes {
            voteResultLabel.text = "It's a tie. Ummmm...🙄"
        }
    }
    
    func checkVotes(yesVotes: Int, noVotes: Int) {
        voteResultLabel.text = """
        Yes votes = \(yesVotes)
        No votes = \(noVotes)
        """
    }
    
    // #9
    fileprivate func voteCast() {
        if yesState == true {
            yesVotes += 1
            print("Yes vote:\(yesVotes)")
            yesState = false
        }
        
        if noState == true {
            noVotes += 1
            print("No vote:\(noVotes)")
            noState = false
        }
    }

}

// #1 - Create UI according to PDFs Layout folder
// #2 - create VotingState data model as a new .swift file. This has our enum property to update the UI depending upon whether someone is going to vote or has voted.
// #3 - Create the outlet connection for the two labels and all buttons by control-dragging from Main to the Assistant Editor.
// #4 - Create the variable properties to store the vote totals and the state of the vote for tallying purposes.
// #5 - Create the updateUI method to update the UI to show or hide buttons and labels based upon whether the voting is enabled or if you are checking the vote tallys or ending the election.
// #6 - Create the yesVoteButtonTapped action by control-dragging from Main to the Assistant Editor.
// #7 - Create the noVoteButtonTapped action by control-dragging from Main to the Assistant Editor.
// #8 - update the yesState property to true and the "No" button to be disabled
// #9 - update the noState property to true and the "Yes" button to be disabled
// #8 - Create the submitVoteButtonTapped action by control-dragging from Main to the Assistant Editor.
// #7 - Write the method to cast a yes or no vote and disable the corresponding button after the user has voted to prevent multiple votes.
// #8 - call the voteCast() and updateUI() methods in submitVoteButtonTapped method.
// #9 - Create the submitVoteButtonTapped action by control-dragging from Main to the Assistant Editor.
