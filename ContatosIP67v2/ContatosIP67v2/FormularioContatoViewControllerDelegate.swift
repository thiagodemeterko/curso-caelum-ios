//
//  File.swift
//  ContatosIP67v2
//
//  Created by ios8106 on 21/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import Foundation

protocol FormularioContatoViewControllerDelegate {
    func contatoAtualizado(_ contato:Contato)
    func contatoAdicionado(_ contato:Contato)
}
