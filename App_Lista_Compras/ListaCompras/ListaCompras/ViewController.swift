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
    @IBOutlet weak var labelNomeError: UILabel!
    @IBOutlet weak var labelQtdError: UILabel!
    @IBOutlet weak var buttonSalvar: UIButton!
    @IBOutlet weak var buttonLimpar: UIButton!
    @IBOutlet weak var buttonExcluir: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldNome.delegate = self
        textFieldQuantidade.delegate = self
        labelStatus.isHidden = true
        labelNomeError.isHidden = true
        labelQtdError.isHidden = true
        buttonExcluir.isHidden = true
        labelListagem.text = ""

    }

    
    @IBAction func buttonSalvarClick(_ sender: Any) {
        let nomeItem = textFieldNome.text!
        let qtdItem = textFieldQuantidade.text!
        
        if validaNome() && validaQuantidade(){
            //verificar se item já existe
            if let item = buscarItem(nome: nomeItem){
                //se item existe, editar
                labelStatus.text = "Produto Editado."
                editarItem(item: item)
                buttonExcluir.isHidden = true

            }else{
                //cadastrar novo item
                labelStatus.text = "Produto Novo Cadastrado."

                cadastrarItem(nome: nomeItem, quantidade: qtdItem)
                
            }
            //atualiza o label listagem
            atualizaListagem()
            //limpar campos
            limparCampos()

            
        }
        
    }
    
    @IBAction func buttonLimparClick(_ sender: Any) {
        //limpar os campos
        limparCampos()
    }
    
    @IBAction func buttonExcluirClick(_ sender: Any) {
        let nomeItem = textFieldNome.text!
        
        if validaNome(){
            //verificar se item já existe
            if let item = buscarItem(nome: nomeItem){
                //se item existe, editar
                labelStatus.text = "Item Removido."
                excluirItem(item: item)
                buttonExcluir.isHidden = true

            }
            //atualizar o label listagem
            atualizaListagem()
            //limpar campos
            limparCampos()
        }
    }
    
    private func cadastrarItem(nome: String,  quantidade: String){
        let item = Item(nome: nome, quantidade: Int(quantidade)!)
        arrayItens.append(item)
    }

    private func editarItem(item: Item){
        for itemArray in arrayItens{
            if itemArray.getNome() == item.getNome(){
                itemArray.setQuantidade(quantidade: item.getQuantidade())
            }
        }
        
    }
    
    private func excluirItem(item: Item){
        for (index, itemArray) in arrayItens.enumerated(){
            if itemArray.getNome() == item.getNome(){
                arrayItens.remove(at: index)
                return
            }
        }
    }
    
    private func buscarItem(nome: String) -> Item?{
        let nomeLowerCase = nome.folding(options: .diacriticInsensitive, locale: .current).lowercased()

        for item in arrayItens{
            let itemNome = item.getNome()
            let itemNomeLowerCase = itemNome.folding(options: .diacriticInsensitive, locale: .current).lowercased()
            if  itemNomeLowerCase == nomeLowerCase{
                return item
            }
        }
        return nil
    }
    
    private func limparCampos(){
        textFieldNome.text = ""
        textFieldQuantidade.text = ""
    }
    
    private func validaNome() -> Bool{
        labelNomeError.isHidden = true
        if textFieldNome.text == nil || textFieldNome.text!.isEmpty{
            labelNomeError.isHidden = false
            return false
        }
        return true
    }
    
    private func validaQuantidade() -> Bool{
        labelQtdError.isHidden = true
        if textFieldQuantidade.text == nil || textFieldQuantidade.text!.isEmpty{
            labelQtdError.isHidden = false
            return false
        }
        return true
    }
    
    private func atualizaListagem(){
        let novaLinha = "\n"
        labelListagem.text = ""
        for item in arrayItens{
            labelListagem.text = "\(labelListagem.text!)\(item.getNome()) \(novaLinha)"
        }
    }
    
}

extension ViewController: UITextFieldDelegate{
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldNome{
            if validaNome(){
                if let item = buscarItem(nome: textFieldNome.text!){
                    //se existir o item, popular os textField
                    labelStatus.text = "Produto já existente."
                    textFieldQuantidade.text = String(item.getQuantidade())
                    buttonExcluir.isHidden = false
                }else{
                    labelStatus.text = "Produto Novo."
                    
                }
                labelStatus.isHidden = false
                textFieldQuantidade.becomeFirstResponder()
            }
        }else{
            if !validaNome(){
                textFieldNome.becomeFirstResponder()
            }
            else if validaQuantidade(){
                textField.resignFirstResponder()
            }
            
        }
        return true
        
        
    }
    /*
     
    if textField == textFieldNome{
        if let item = buscarItem(nome: textFieldNome.text!){
            //se existir o item, popular os textField
            labelStatus.text = "Produto já existente."
            textFieldQuantidade.text = String(item.getQuantidade())
        }else{
            labelStatus.text = "Produto Novo."

        }
        textFieldQuantidade.becomeFirstResponder()

    }else{
        
    }
    
    return true
     
     */
    
    
    
    
}
