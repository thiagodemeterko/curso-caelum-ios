//
//  ViewController.swift
//  ContatosIP67
//
//  Created by ios8106 on 19/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit

class FormularioContatoViewController: UIViewController {
    
    @IBOutlet var nome: UITextField!
    @IBOutlet var telefone: UITextField!
    @IBOutlet var endereco: UITextField!
    @IBOutlet var site: UITextField!
    
    var dao:ContatoDAO
    var contato: Contato!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(contato != nil) {
            self.nome.text = contato.nome
            self.telefone.text = contato.telefone
            self.endereco.text = contato.endereco
            self.site.text = contato.site
            
            let botaoAlterar = UIBarButtonItem(title: "Confirmar", style: .plain, target: self, action: #selector(atualizaContato))
            
            self.navigationItem.rightBarButtonItem = botaoAlterar
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.dao = ContatoDAO.sharedInstance()
        super.init(coder: aDecoder)
    }
    
    func pegaDadosDoFormulario() {
        
        if(contato == nil) {
            self.contato = Contato()
        }
        
        contato.nome = self.nome.text!
        contato.telefone = self.telefone.text!
        contato.endereco = self.endereco.text!
        contato.site = self.site.text!
    }
    
    @IBAction func criaContato() {
        self.pegaDadosDoFormulario()
        dao.adiciona(contato)
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func atualizaContato() {
        pegaDadosDoFormulario()
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}

