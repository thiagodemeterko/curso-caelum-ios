//
//  ContatoDAO.swift
//  ContatosIP67v2
//
//  Created by ios8106 on 19/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit

class ContatoDAO: CoreDataUtil {

    static private var defaultDAO: ContatoDAO!
    var contatos: Array<Contato>
    
    static func sharedInstance() -> ContatoDAO {
        if defaultDAO == nil {
            defaultDAO = ContatoDAO()
        }
        return defaultDAO
    }
    
    override private init() {
        self.contatos = Array()
        super.init()
        self.inserirDadosIniciais()
        self.carregaContatos()
    }
    
    func adiciona(_ contato: Contato) {
        contatos.append(contato)
        for umContato in contatos {
            print(umContato)
        }
        ContatoDAO.sharedInstance().saveContext()
    }
    
    func listarTodos() -> [Contato] {
        return contatos
    }
    
    func buscaContatoNaPosicao(_ posicao:Int) -> Contato {
        return contatos[posicao]
    }
    
    func remove(_ posicao:Int) {
        persistentContainer.viewContext.delete(contatos[posicao])
        contatos.remove(at:posicao)
        ContatoDAO.sharedInstance().saveContext()
    }
    
    func buscaPosicaoDoContato(_ contato:Contato) -> Int {
        return contatos.index(of: contato)!
    }
    
    func inserirDadosIniciais() {
        let configuracoes = UserDefaults.standard
        
        let dadosInseridos = configuracoes.bool(forKey: "dados_inseridos")
        
        if !dadosInseridos {
            
            let caelumSP = NSEntityDescription.insertNewObject(forEntityName: "Contato", into: self.persistentContainer.viewContext) as! Contato
            
            caelumSP.nome = "Caelum SP"
            caelumSP.endereco = "São Paulo, SP, Rua Vergueiro, 3185";
            caelumSP.telefone = "01155712751";
            caelumSP.site = "http://www.caelum.com.br";
            caelumSP.latitude = -23.5883034
            caelumSP.longitude = -46.632369
            
            self.saveContext()
            
            configuracoes.set(true, forKey: "dados_inseridos")
            
            configuracoes.synchronize()
        }
    }
    
    func carregaContatos() {
        let busca = NSFetchRequest<Contato>(entityName: "Contato")
        
        let orderPorNome = NSSortDescriptor(key: "nome", ascending: true)
        
        busca.sortDescriptors = [orderPorNome]
        
        do {
            self.contatos = try self.persistentContainer.viewContext.fetch(busca)
        } catch let error as NSError {
            print("Fetch Falhou: \(error.localizedDescription)")
        }
    }
    
    func novoContato() -> Contato {
        return NSEntityDescription.insertNewObject(forEntityName: "Contato", into: self.persistentContainer.viewContext) as! Contato
    }
}
