//
//  ViewController.swift
//  ListaCompras
//
//  Created by Igor Gavilon on 16/09/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrayItens = [Item]()
    
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldQuantidade: UITextField!
    @IBOutlet weak var labelListagem: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldNome.delegate = self
    }

    
    @IBAction func buttonSalvarClick(_ sender: Any) {
        let nomeItem = textFieldNome.text!
        let qtdItem = textFieldQuantidade.text!
        
        //verificar se item já existe
        if let item = buscarItem(nome: nomeItem){
            //se item existe, editar
            labelStatus.text = "Editar"
            editarItem(item: item)
        }else{
            //cadastrar novo item
            labelStatus.text = "Produto Novo"

            cadastrarItem(nome: nomeItem, quantidade: qtdItem)
            limparCampos()
            //inserir no label listagem
            labelListagem.text = nomeItem
        }
        
    }
    
    @IBAction func buttonLimparClick(_ sender: Any) {
        //limpar os campos
        limparCampos()
    }
    
    @IBAction func buttonExcluirClick(_ sender: Any) {
        let nomeItem = textFieldNome.text!
        let qtdItem = textFieldQuantidade.text!
        
        //verificar se item já existe
        if let item = buscarItem(nome: nomeItem){
            //se item existe, editar
            labelStatus.text = "Item Removido."
            excluirItem(item: item)
            //implementar a retirada do item do label listagem
        }else{
            //cadastrar novo item
            labelStatus.text = "Produto Novo"

            cadastrarItem(nome: nomeItem, quantidade: qtdItem)
            limparCampos()
            //inserir no label listagem
            labelListagem.text = nomeItem
        }
    }
    
    func cadastrarItem(nome: String,  quantidade: String){
        let item = Item(nome: nome, quantidade: Int(quantidade)!)
        arrayItens.append(item)
    }

    func editarItem(item: Item){
        for itemArray in arrayItens{
            if itemArray.getNome() == item.getNome(){
                itemArray.setQuantidade(quantidade: item.getQuantidade())
            }
        }
        
    }
    
    func excluirItem(item: Item){
        for (index, itemArray) in arrayItens.enumerated(){
            if itemArray.getNome() == item.getNome(){
                arrayItens.remove(at: index)
                return
            }
        }
    }
    
    func buscarItem(nome: String) -> Item?{
        for item in arrayItens{
            if item.getNome() == nome{
                return item
            }
        }
        return nil
    }
    
    private func limparCampos(){
        textFieldNome.text = ""
        textFieldQuantidade.text = ""
    }
}

extension ViewController: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldNome{
            if let item = buscarItem(nome: textFieldNome.text!){
                //se existir o item, popular os textField
                labelStatus.text = "Produto já existe."
                textFieldQuantidade.text = String(item.getQuantidade())
                textFieldQuantidade.becomeFirstResponder()
            }
            
        }
        
        return true
    }
}
