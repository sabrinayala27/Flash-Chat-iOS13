//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth
import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // tableView.delegate = self
        tableView.dataSource = self
        title = K.appTitle
        navigationItem.hidesBackButton = true
        
        //registro de tableView XIB
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    //recuperamos data de la tableView
    func loadMessages() {
       
        
        //getDocuments es una closure y se activa una vez logrado encontrar todos los docs una //colección particular de la base de datos de Firebase pero mejor utilzar addSnapshotListener
        
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { querySnapshot, error in
            self.messages = []
           
            
            if let e = error {
                print("there was an issue retrieving datafrom Firestore\(e). ")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            
                            //puedo ver ahora los mensajes te texto y pruebas en pantalla
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexpath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexpath, at: .top, animated: true)
                            }
                           
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        //será igual a lo que esté dentro de nuestro mensajeTextField
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email { db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.senderField : messageSender, K.FStore.bodyField : messageBody, K.FStore.dateField: Date().timeIntervalSince1970])
            {(error) in
                if let e = error {
                    print("there was an issue saving data to firestore, \(e)")
                } else {
                    print("succesfully saving data")
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
    }
    

    @IBAction func LogOutPressed(_ sender: UIBarButtonItem) {
        //this code allows you to go back to the first viewController
       do {
         try  Auth.auth().signOut()
           navigationController?.popToRootViewController(animated: true)
       } catch let signOutError as NSError {
           print(K.FStore.error , signOutError)
       }
         
    }
}

//MARK: - UITableViewDataSource

//protocol when tableView loads up it's going to make a request for data that it needs
//cuántas celdas necesita y qué celdas se colocan en tableView
//para que funcione hay que ir a override y poner "tableView.dataSource = self"

extension ChatViewController: UITableViewDataSource {
    
    //1.How many rows do you want in your table view
    //delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    //crear una celda y devolverla a la TableView
    //delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        let message = messages[indexPath.row]
        
    // if the sender is "me" avatar should appear the leftimage created in the messageCell and hide the other one
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.backgroundColor = UIColor(named: K.BrandColors.purple)
        } // this is  a message from another sender
        else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
        }
                
        cell.label.text = message.body
        return cell
    }
    
}

//MARK: - UITableViewDelegate

//para que funcione hay que ir a override y poner tableView.delegate = self
//saber si las celdas fueron presionadas x el usuario al interactuar con la tableView, recibir
//mensajes de la tableView

//extension ChatViewController: UITableViewDelegate {
    
  //  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   //     print(indexPath.row)
   // }
//}
