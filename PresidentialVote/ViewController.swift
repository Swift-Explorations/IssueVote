//
//  ViewController.swift
//  PresidentialVote - initial name and idea
//
//  Created by Brian Foutty on 4/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    // #1 - Create UI in Main
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
        // #13
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
    
    // #10
    @IBAction func submitVoteButtonTapped(_ sender: UIButton) {
        // #12
        voteCast()
        updateUI(forState: .startVote)
        
    }
    
    // #22
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // #23
        yesVotes = 0
        noVotes = 0
        yesState = false
        noState = false
        updateUI(forState: .startVote)
        
        
    }
    
    // #20
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        // #21
        updateUI(forState: .startVote)
        
    }
    
    // #15
    @IBAction func totalButtonTapped(_ sender: UIButton) {
        // #16
        tallyVotes(yesVotes: yesVotes, noVotes: noVotes)
        updateUI(forState: .total)
    }
    
    // #18
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        // #19
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
    
    // #11
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
    
    // #14
    func tallyVotes(yesVotes: Int, noVotes: Int) {
        if yesVotes > noVotes {
            voteResultLabel.text = "The issue passed with a vote total of \(yesVotes) YES votes to \(noVotes) NO votes."
        } else if yesVotes < noVotes {
            voteResultLabel.text = "The issue failed with a vote total of \(yesVotes) YES votes to \(noVotes) NO votes."
        } else if yesVotes == noVotes {
            voteResultLabel.text = "It's a tie. Ummmm...🙄"
        }
    }
    
    // #17
    func checkVotes(yesVotes: Int, noVotes: Int) {
        voteResultLabel.text = """
        Yes votes = \(yesVotes)
        No votes = \(noVotes)
        """
    }
}

// #1 - Create UI according to PDFs Layout folder.
// #2 - Create VotingState data model as a new .swift file. This has our enum property to update the UI depending upon whether someone is going to vote or has voted.
// #3 - Create the outlet connection for the two labels and all buttons by control-dragging from Main to the Assistant Editor.
// #4 - Create the variable properties to store the vote totals and the state of the vote for tallying purposes.
// #5 - Create the updateUI method to update the UI to show or hide buttons and labels based upon whether the voting is enabled or if you are checking the vote tallys or ending the election by finding the total vote.
// #6 - Create the yesVoteButtonTapped action by control-dragging from Main to the Assistant Editor.
// #7 - Create the noVoteButtonTapped action by control-dragging from Main to the Assistant Editor.
// #8 - update the yesState property to true and the "No" button to be disabled
// #9 - update the noState property to true and the "Yes" button to be disabled
// #10 - Create the submitVoteButtonTapped action by control-dragging from Main to the Assistant Editor.
// #11 - Write the voteCast() method to cast a yes or no vote (increment the yesVote or noVote property values) and disable the opposite vote.
// #12 - Call the voteCast() and updateUI() methods in submitVoteButtonTapped method.
// #13 - Call the updateUI() method for the .start state in the viewDidLoad method so the app is ready for the user when the app first launches.
// #14 - Write the tallyVotes() method to check the compare the yesVote and noVote property values and assign the appropriate output to the voteResultLabel's text property.
// #15 - Create the totalButtonTapped action by control-dragging from Main to the Assistant Editor.
// #16 - call the tallyVotes() and updateUI() methods in totalButtonTapped method. We will use the .total state.
// #17 - We now have basic functionality done. We could stop here. However, we are now going to add the ability to check the current vote totals. Write the checkVote() method that passes in the yesVotes and noVotes values into the voteResultLabel's text property.
// #18 - Create the checkButtonTapped action by control-dragging from Main to the Assistant Editor.
// #19 - Call the updateUI() method in totalButtonTapped method with the .check state.
// #20 - Now that we can check the vote tally at any time we need to the normal UI where the user can vote. Create the returnButtonTapped action by control-dragging from Main to the Assistant Editor.
// #21 - Call the updateUI() method for the .start state so that the app is ready for the next user to vote.
// #22 - Once the voting has ended we need to reset the app for a new round of voting. Create the resetButtonTapped action by control-dragging from Main to the Assistant Editor.
// #23 - Reset the yesVote and noVote property values to zero. Reset the yesState and noState values to false. Call the updateUI() method for the .start state.
