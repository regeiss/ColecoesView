//
//  ViewController.swift
//  ColecoesView
//
//  Created by Roberto Edgar Geiss on 22/10/18.
//  Copyright © 2018 Roberto Edgar Geiss. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var addButton: UIBarButtonItem!
    @IBOutlet private weak var deleteButton: UIBarButtonItem!
    
    var collectionViewData = ["1🏆" , "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 🍖", "9 🎸", "10 🐯", "11 🐷", "12 🌋"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let width = (view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        // Adiciona botao de edicao
        navigationItem.leftBarButtonItem = editButtonItem

    }
    
    @IBAction func deleteSelected()
    {
        if let selected = collectionView.indexPathsForSelectedItems
        {
            let items = selected.map {$0.item}.sorted().reversed()
            for item in items
            {
                collectionViewData.remove(at: item)
            }
            
            collectionView.deleteItems(at: selected)
        }
    }
    
    @IBAction func addItem()
    {
        let text = "Texto \(collectionViewData.count + 1)"
        collectionViewData.append(text)
        let indexPath = IndexPath(row: collectionViewData.count - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
    }

    // Modifica a edicao padrao da colecao
    override func setEditing(_ editing: Bool, animated: Bool)
    {
        super.setEditing(editing, animated: animated)
        addButton.isEnabled = !editing
        collectionView.allowsMultipleSelection = editing
        let indexPaths = collectionView.indexPathsForVisibleItems
        
        for indexPath in indexPaths
        {
            let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
            cell.isEditing = editing
        }
        deleteButton.isEnabled = isEditing
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    // Retorna a quantidade de itens
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return collectionViewData.count
    }
    
    // Seta o conteudo da celula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.titleLabel.text = collectionViewData[indexPath.row]
        cell.isEditing = isEditing
        return cell

    }

    // Trata a selecao da celula
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if !isEditing
        {
            performSegue(withIdentifier: "DetailSegue", sender: indexPath)
        }
    }
    
    // Trata a navegacao para outra view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "DetailSegue"
        {
            if let dest = segue.destination as? DetailViewController,
            let index = sender as? IndexPath
            {
                dest.selectionString =  collectionViewData[index.row]
            }
        }
    }
}
