//
//  CollectionViewCell.swift
//  ColecoesView
//
//  Created by Roberto Edgar Geiss on 29/10/18.
//  Copyright © 2018 Roberto Edgar Geiss. All rights reserved.
//

// Esta classe personaliza as funcoes da celula original

import UIKit

class CollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionImage: UIImageView!
    
    var isEditing: Bool = false
    {
        didSet
        {
            selectionImage.isHidden = !isEditing
        }
    }
    
    override var isSelected: Bool
    {
        didSet
        {
            if isEditing
            {
                selectionImage.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
            }
        }
    }
}
