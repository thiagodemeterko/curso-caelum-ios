//
//  ViewController.swift
//  ContatosIP67
//
//  Created by ios8106 on 19/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit

class FormularioContatoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var nome: UITextField!
    @IBOutlet var telefone: UITextField!
    @IBOutlet var endereco: UITextField!
    @IBOutlet var siteText: UITextField!
    
    @IBAction func pegaDadosDoFormulario() {
        let nome = self.nome.text!
        let telefone = self.telefone.text!
        let endereco = self.endereco.text!
        let siteText = self.siteText.text!
        
        print("Nome: \(nome), Telefone: \(telefone), Endereço: \(endereco), Site: \(siteText)")
    }
    
}

