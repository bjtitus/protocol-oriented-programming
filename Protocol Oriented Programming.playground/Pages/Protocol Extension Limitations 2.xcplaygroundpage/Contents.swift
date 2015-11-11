/*:
# Protocol Extension Limitations

Also, you cannot implement a protocol from another protocol in an extension
*/

protocol EqualTo {
    func isEqualTo(other:Any) -> Bool
}

// Error: Extension of protocol 'Equatable' cannot have an inheritance clause
// This is because extensions cannot use inheritance. Even though we are technically "adopting" the EqualTo protocol, this is not something you can do. Maybe a language feature request?
extension Equatable : EqualTo {
    func isEqualTo(other:Any) -> Bool {
        /* ... logic */
        return false
    }
}

// To get around this, you need to inherit from the protocol at the implementors definition

protocol MyProtocol: EqualTo {
}

// And then implement the appropriate methods in an extension as default implementations

extension MyProtocol {
    func isEqualTo(other: Any) -> Bool {
        return false
    }
}

// Obviously this means that you can't add protocol support to system classes

/*:
[⬅ Previous](@previous) || [Next ➡](@next)
*/
