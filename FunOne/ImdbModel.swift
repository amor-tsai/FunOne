//
//  ImdbModel.swift
//  FunOne
//
//  Created by Amor on 2021/9/7.
//

import Foundation


let headers = [
    "x-rapidapi-host": "imdb8.p.rapidapi.com",
    "x-rapidapi-key": "30c24905c9msh8796d529eed07c2p1e2189jsnd9acda567af3"
]

let request = NSMutableURLRequest(url: NSURL(string: "https://imdb8.p.rapidapi.com/auto-complete?q=game%20of%20thr")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "GET"
request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    if (error != nil) {
        print(error)
    } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
    }
})

dataTask.resume()
