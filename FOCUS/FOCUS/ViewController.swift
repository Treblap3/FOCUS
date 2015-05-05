//
//  ViewController.swift
//  FOCUS
//
//  Created by Adrien Villez on 5/2/15.
//  Copyright (c) 2015 AdrienVillez. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var quoteArray: [Quotes] = [Quotes]()

    @IBOutlet weak var focusLabel: UILabel!
    @IBOutlet weak var appSloganLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var quoteTextField: UILabel!
    @IBOutlet weak var authorTextField: UILabel!
    @IBOutlet weak var twitterShareButton: UIButton!
    @IBOutlet weak var facebookShareButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar:
        self.navigationItem.title = "Quotes"
        
        // Animation to dim the app Name and Slogan.
        var duration: NSTimeInterval = 1.0
        UIView.animateWithDuration(duration, animations: {
            self.appSloganLabel.alpha = 0
            }, completion: {finished in
                UIView.animateWithDuration(duration, animations: {
                    self.focusLabel.alpha = 0
                    }, completion: {Finished in
                        UIView.animateWithDuration(duration, animations: {
                            self.quoteTextField.alpha = 1
                            self.authorTextField.alpha = 1
                            }, completion: {finished in
                                UIView.animateWithDuration(duration, animations: {
                                    self.infoButton.alpha = 1
                                    self.twitterShareButton.alpha = 1
                                    self.facebookShareButton.alpha = 1
                                })
                        })
                })
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.infoButton.alpha = 0
        //self.tableViewButton.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func randomQuoteToDisplay()
    {
        // TODO: Terminate this method and implement the return value.
    }

    // TODO: Add a button to segue to a table view with all quotes.
    // TODO: Add a setting/about button for giving credit to people helping + the link to the Github code.
    // TODO: Add a "next" button to randomly display another quote + animations.
    // TODO: Add a Share on Facebook button.
    // TODO: Add a Share on Twitter button.
}

