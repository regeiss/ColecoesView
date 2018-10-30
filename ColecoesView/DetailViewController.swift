//
//  DetailViewController.swift
//  ColecoesView
//
//  Created by Roberto Edgar Geiss on 24/10/18.
//  Copyright © 2018 Roberto Edgar Geiss. All rights reserved.
//
import UIKit

class DetailViewController: UIViewController
{
    var selectionString: String!
    @IBOutlet private weak var detailsLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        detailsLabel.text = selectionString

    }
}
