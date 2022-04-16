//
//  UsersService.swift
//  TableView Primeiro App
//
//  Created by Clei Sabino Gomes De Jesus on 15/04/22.
//  Copyright © 2022 Clei Sabino Gomes De Jesus. All rights reserved.
//

import Foundation


class UsersService{
    
    let urlString = "https://624f3e33bdda77e9a9bc05e0.mockapi.io/"
    var users = [User]()
    var isDeleted = false
    var isCreated = false
    var isUpdated = false
    
    func performRequest(userResult:@escaping ([User])->())  {
        if let url = URL(string: "\(urlString)users"){
            URLSession.shared.dataTask(with: url) {
                data, response, error in
                if error == nil && data != nil{
                    let parse = self.parseJSON(modelUsers: data!)
                    userResult(parse)
                }
            }.resume()
        }
    }
    
    func parseJSON(modelUsers: Data) -> [User]{
        //print(String(data: modelUsers, encoding: .utf8)!)
        let decoder = JSONDecoder()
        do {
            let decodeData =  try decoder.decode([User].self, from: modelUsers)

            return decodeData

        }
        catch{
            print("error parse JSON \(error)")
        }
        
        return []
    }
    
    func deletePeople(id: String)  {
        print(self.users)
//        let usersId =  self.users[Int(id)!].id
//        print(usersId!)
//
//        var request = URLRequest(url:URL(string: "\(urlString)/\(usersId!)")!)
//
//        request.httpMethod  = "DELETE"
//        let session = URLSession(configuration: .default)
//        session.dataTask(with: request){(data,res,err)in
//
//            if err != nil {
//                print(err!.localizedDescription)
//
//            }
//            if err == nil,let data = data, let response = res as? HTTPURLResponse {
//                print(response.statusCode)
//                print(data)
//
//                DispatchQueue.main.async {
//                    self.users.removeAll{
//                        (users)-> Bool in
//                        return users.id == id
//                    }
//                    self.isDeleted = true
//                    self.performRequest()
//                }
//
//            }
//
//        }.resume()
    }
}
