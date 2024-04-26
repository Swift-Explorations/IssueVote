//
//  ViewController.swift
//  PresidentialVote
//
//  Created by Brian Foutty on 4/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    enum election {
        case biden, trump
    }
    
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
    @IBAction func bidenButtonTapped(_ sender: UIButton) {
        yesState = true
        noButton.isEnabled = false
    }
    
    @IBAction func trumpButtonTapped(_ sender: UIButton) {
        noState = true
        yesButton.isEnabled = false
    }
    
    @IBAction func submitVoteButtonTapped(_ sender: UIButton) {
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
    
    @IBAction func totalButtonTapped(_ sender: UIButton) {
        tallyVotes(yesVotes: yesVotes, noVotes: noVotes)
        updateUI(forState: .total)
    }
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        updateUI(forState: .check)
        checkVotes(yesVotes: yesVotes, noVotes: noVotes)
    }
    
    
    // MARK: - Instance Methods
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
            
//        case .castVote:
//            bidenButton.isEnabled = false
//            trumpButton.isEnabled = false
//            voteResultLabel.isHidden = true
            
        //case .submitVote:
            
        }
    }
    
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

