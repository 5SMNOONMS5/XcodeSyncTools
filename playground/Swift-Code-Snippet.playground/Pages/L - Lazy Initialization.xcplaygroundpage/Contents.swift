


//: ### Lazy Initialization


class LazyInitializationSmaple {
    
    lazy var coders: [String] = {
        var temporarycoders = [String]()
        temporarycoders.append("John Doe")
        return temporarycoders
    }()
    
    lazy var players: [String] = self.initialPlayers()
    
    func initialPlayers() -> [String] {
        var players = ["John Doe"]
        return players
    }
}


class Person{
    
    var name: String
    
    lazy var personalizedGreeting: String = {
        
        [unowned self] in
        
        return "Hello, \(self.name)!"
    }()
    
    init(name: String) {
        self.name = name
    }
    
    deinit{
        print("Person class is being deinitialized")
    }

}

//: When you initialize a person, their personal greeting hasn’t been created yet:

// person.personalizedGreeting is nil
let person = Person(name: "John Doe")


//: But when you attempt to print out the personalized greeting, it’s calculated on-the-fly:


// personalizedGreeting is calculated when used
// and now contains the value "Hello, John Doe!"
print(person.personalizedGreeting)







