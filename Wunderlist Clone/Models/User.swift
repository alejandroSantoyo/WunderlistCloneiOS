import Foundation

class User {
    
    var _avatar: String!
    var _createdAt: String!
    var _email: String!
    var _id: Int!
    var _id_device: String!
    var _name: String!
    var _password: String!
    var _status: Int!
    var _updatedAt: String!
    var _username: String!
    
    
    
    var avatar: String{
        if _avatar == nil{
            return ""
        }
        return _avatar
    }
    
    var createdAt: String{
        if _createdAt == nil{
            return ""
        }
        return _createdAt
    }
    
    var email: String{
        if _email == nil{
            return ""
        }
        return _email
    }
    
    var id: Int{
        if _id == nil{
            return 0
        }
        return _id
    }
    
    var id_device: String{
        if _id_device == nil{
            return ""
        }
        return _id_device
    }
    
    var name: String{
        if _name == nil{
            return ""
        }
        return _name
    }
    
    var password: String{
        if _password == nil{
            return ""
        }
        return _password
    }
    
    var status: Int{
        if _status == nil{
            return 0
        }
        return _status
    }
    
    var updatedAt: String{
        if _updatedAt == nil{
            return ""
        }
        return _updatedAt
    }
    
    var username: String{
        if _username == nil{
            return ""
        }
        return _username
    }
    
    
    init() {}
    
    init(userJson: Dictionary<String, Any>) {
        
        if let userAvatar = userJson["avatar"] as? String{
            self._avatar = userAvatar
        }
        
        if let userCreatedAt = userJson["createdAt"] as? String{
            self._createdAt = userCreatedAt
        }
        
        if let userEmail = userJson["email"] as? String{
            self._email = userEmail
        }
        
        if let userId = userJson["id"] as? Int{
            self._id = userId
        }
        
        if let userId_device = userJson["id_device"] as? String{
            self._id_device = userId_device
        }
        
        if let userName = userJson["name"] as? String{
            self._name = userName
        }
        
        if let userPassword = userJson["password"] as? String{
            self._password = userPassword
        }
        
        if let userStatus = userJson["status"] as? Int{
            self._status = userStatus
        }
        
        if let userUpdatedAt = userJson["updatedAt"] as? String{
            self._updatedAt = userUpdatedAt
        }
        
        if let userUsername = userJson["username"] as? String{
            self._username = userUsername
        }
        
    }
    
    
}
