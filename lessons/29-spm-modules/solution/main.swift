import Greeter
import Toolkit

let greeter = Greeter(name: "Swift")
print(greeter.greet())

var history = Stack<String>()
history.push("first")
history.push("second")
print("Last: \(history.pop() ?? "none"), left: \(history.count)")
