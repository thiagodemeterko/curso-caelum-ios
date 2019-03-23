//
//  ViewController.swift
//  ContatosIP67
//
//  Created by ios8106 on 19/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit

class FormularioContatoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var nome: UITextField!
    @IBOutlet var telefone: UITextField!
    @IBOutlet var endereco: UITextField!
    @IBOutlet var site: UITextField!
    
    @IBOutlet var imageView: UIImageView!
    
    var dao:ContatoDAO
    var contato: Contato!
    var delegate:FormularioContatoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(selecionarFoto(sender:)))
        self.imageView.addGestureRecognizer(tap)
        
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
        
        self.delegate?.contatoAdicionado(contato)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func atualizaContato() {
        pegaDadosDoFormulario()
        
        self.delegate?.contatoAtualizado(contato)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func selecionarFoto(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
        } else {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageSelecionada = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.imageView.image = imageSelecionada
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        
    }
    
}

