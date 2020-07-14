import Foundation
import CoreFoundation

/*
var request = URLRequest(url: <#T##URL#>)

request.httpMethod = "POST"
request.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
request.httpBody = data

let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

//....
}
    task.resume()
}
*/


struct POST: Codable {
    let userID: Int
    let title: String
    let body: String
}

let post = POST(userID: 1234, title: "Bob", body: "bananas")
var request = URLRequest(url: URL( string: "https//jsonplaceholder.typicode.com")!)
request.httpMethod = "POST"
request.httpBody = try! JSONEncoder().encode(post)
request.addValue("application/JSON", forHTTPHeaderField: "Content-Type")

let runLoop = CFRunLoopGetCurrent()

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    print(String(data: data!, encoding: .utf8))

CFRunLoopStop(runLoop)
}

task.resume()

CFRunLoopRun()





