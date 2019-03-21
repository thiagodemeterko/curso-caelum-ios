//
//  ListaContatosViewControllerTableViewController.swift
//  ContatosIP67v2
//
//  Created by ios8106 on 20/03/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

import UIKit

class ListaContatosTableViewController: UITableViewController {
    
    var dao:ContatoDAO
    static let cellIdentifier = "Cell"
    
    required init?(coder aDecoder: NSCoder) {
        self.dao = ContatoDAO.sharedInstance()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dao.listarTodos().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contato:Contato = self.dao.buscaContatoNaPosicao(indexPath.row)
        
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: ListaContatosTableViewController.cellIdentifier)

        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: ListaContatosTableViewController.cellIdentifier)
        }
        
        cell!.textLabel?.text = contato.nome

        return cell!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.dao.remove(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contatoSelecionado = dao.buscaContatoNaPosicao(indexPath.row)
        self.exibeFormulario(contatoSelecionado)
    }
    
    func exibeFormulario(_ contato:Contato) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let formulario = storyboard.instantiateViewController(withIdentifier: "Form-Contato") as! FormularioContatoViewController
        
        formulario.contato = contato
        self.navigationController?.pushViewController(formulario, animated: true)
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
