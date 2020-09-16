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
        labelEmailError.isHidden = true
        labelSenhaError.isHidden = true
        labelStatus.isHidden = true
    }
    
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated: true, completion: nil)

    }
    
    @IBAction func loginClick(_ sender: Any) {
        
        
        if validaEmail() && validaSenha(){
            let emailUsuario = textFieldEmail.text!
            if buscarUsuario(email: emailUsuario){
                let senhaUsuario = textFieldSenha.text!
                if buscarUsuario(email: emailUsuario, senha: senhaUsuario){
                    //login efetuado com sucesso
                    limparCampos()
                    showAlert(title: "Login Usuário", message: "Login efetuado com sucesso!")
                }else{
                    //senha inválida
                    showAlert(title: "Login Usuário", message: "Senha inválida")

                }
            }else{
                //Usuário não cadastrado
                showAlert(title: "Login Usuário", message: "Usuário inválido")

            }
        }
    }
    
    
    @IBAction func cadastroClick(_ sender: Any) {
        let email = textFieldEmail.text!
        let senha = textFieldSenha.text!
        
        if validaEmail() && validaSenha(){
            if buscarUsuario(email: email){
                limparCampos()
                showAlert(title: "Cadastro Usuário", message: "Usuário já cadastrado.")
            }else{
                cadastrarUsuario(email: email, senha: senha)
                showAlert(title: "Cadastro Usuário", message: "Cadastro efetuado com sucesso.")
                limparCampos()
            }
        }
        
    }
    
    private func validaEmail() -> Bool{
        labelEmailError.isHidden = true
        if textFieldEmail.text == nil || textFieldEmail.text!.isEmpty{
            labelEmailError.isHidden = false
            return false
        }
        return true
    }
    
    private func validaSenha() -> Bool{
        labelSenhaError.isHidden = true
        if textFieldSenha.text == nil || textFieldSenha.text!.isEmpty{
            labelSenhaError.isHidden = false
            return false
        }
        return true

    }
    
    private func buscarUsuario(email: String, senha: String) -> Bool{
        for usuario in arrayUsuario{
            if usuario.getEmail() == email{
                if usuario.getSenha() == senha {
                    return true
                }
                return false
            }
        }
        return false
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
            if validaEmail(){
                textFieldSenha.becomeFirstResponder()
            }
        }else{
            if !validaEmail(){
                textFieldEmail.becomeFirstResponder()
            }
            else if validaSenha(){
                textField.resignFirstResponder()
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

