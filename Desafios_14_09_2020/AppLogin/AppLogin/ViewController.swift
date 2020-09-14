//
//  ViewController.swift
//  AppLogin
//
//  Created by Igor Gavilon on 14/09/20.
//  Copyright © 2020 igorGavilon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrayUsuario = [Usuario]()
    var isPrimeiroCadastro: Bool = true
    
    @IBOutlet var uiView: UIView!
    @IBOutlet weak var labelEmailError: UILabel!
    @IBOutlet weak var labelSenhaError: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    @IBOutlet weak var buttonCadastro: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldEmail.delegate = self
        textFieldSenha.delegate = self
        buttonCadastro.isHidden = true
        labelEmailError.isHidden = true
        labelSenhaError.isHidden = true
        labelStatus.isHidden = true
    }
    
    @IBAction func cadastroClick(_ sender: Any) {
        var color = UIColor.white
        let email = textFieldEmail.text!
        let senha = textFieldSenha.text!
        if buscarUsuario(email: email){
            limparCampos()
            color = UIColor.red
            labelStatus.text = "Usuário já cadastrado."
            labelStatus.isHidden = false
            buttonCadastro.isHidden = true
        }else{
            cadastrarUsuario(email: email, senha: senha)
            if !isPrimeiroCadastro{
                color = UIColor.green
            }
            isPrimeiroCadastro = false
            limparCampos()
            labelStatus.text = "Cadastro efetuado com sucesso."
            labelStatus.isHidden = false
            buttonCadastro.isHidden = true

        }
        uiView.backgroundColor = color
    }
    
    private func validaDados() -> Bool{
        labelEmailError.isHidden = true
        labelSenhaError.isHidden = true
        if textFieldEmail.text == nil || textFieldEmail.text!.isEmpty{
            labelEmailError.isHidden = false
            return false
        }
        else if textFieldSenha.text == nil || textFieldSenha.text!.isEmpty{
            labelSenhaError.isHidden = false
            return false
        }
        return true
    }
    
    private func buscarUsuario(email: String) -> Bool{
        for usuario in arrayUsuario{
            if usuario.getEmail() == email{
                return true
            }
        }
        return false
    }
    
    private func cadastrarUsuario(email: String, senha: String){
        let usuario = Usuario(email: email, senha: senha)
        arrayUsuario.append(usuario)
    }
    
    private func limparCampos(){
        textFieldEmail.text = ""
        textFieldSenha.text = ""
    }


}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        // called when 'return' key pressed. return NO to ignore.
        if textField == textFieldEmail{
                textFieldSenha.becomeFirstResponder()
        }else{
            if validaDados(){
                textField.resignFirstResponder()
                buttonCadastro.isHidden = false
            }
            
        }
        return true
    }
}

class Usuario{
    private var email: String
    private var senha: String
    
    init(email: String, senha: String) {
        self.email = email
        self.senha = senha
    }
    
    func getEmail() -> String{
        return self.email
    }
    
    func setEmail(email: String){
        self.email = email
    }
    
    func getSenha() -> String{
        return self.senha
    }
    
    func setSenha(senha: String){
        self.senha = senha
    }
}

