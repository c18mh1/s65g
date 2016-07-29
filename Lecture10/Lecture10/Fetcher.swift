//
//  Fetcher.swift
//  Lecture10
//
//  Created by Michelle on 7/25/16.
//  Copyright © 2016 Michelle. All rights reserved.
//

import Foundation

class Fetcher: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate
{
    func session() -> NSURLSession
    {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 15.0
        return NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }
    
    //MARK: NSURLSessionTaskDelegate
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        <#code#>
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        <#code#>
    }
    
    typealias RequestCompletionHandler = (data: NSData?, message: String?) -> Void
    func request(url: NSURL, completion: RequestCompletionHandler)
    {
        _ = session().dataTaskWithURL(url)
        {
            (data: NSData?, response: NSURLResponse?, error: NSError?) in
            let message = parseResponse(response, error: error) //did not use self in class example
            completion(data: data, message: message)
        }
    }
    
    typealias JSONRequestCompletionHandler = (json: NSObject?, message: String?) -> Void
    func requestJSON(url: NSURL, completion: JSONRequestCompletionHandler)
    {
        //trailing closure syntax
        request(url) { (data, message) in
        var json: NSObject?
        if let data = data
        {
            json = try? NSJSONSerialization
                .JSONObjectWithData(data,
                                    options: NSJSONReadingOptions.AllowFragments) as! NSObject
        }
        
            completion(json: json, message: message)
    }
    func parseResponse(response: NSURLResponse?, error: NSError?) -> String?
    {
        if let statusCode = (response as? NSHTTPURLResponse)?.statusCode
        {
            if statusCode == 200
            {
                return nil
            }
            
            else
            {
                if let netErr = error
                {
                    return "Network Error: \(netErr.localizedDescription)"
                }
                
                else
                {
                    return "OS Error: network error was empty"
                }
            }
        }
    }
        
}//class

    
//MARK: NSURLSessionDelegate
extension Fetcher
{
        func URLSession(session: NSURLSession, didBecomeInvalidWithError error: NSError?)
        {
            NSLog("\(#function): Session became invalid: \(error?.localizedDescription)")
        }
        
        //notified something finished
        func URLSessionDidFinishEventsForBackgroundURLSession(session: NSURLSession)
        {
            <#code#>
        }
}


