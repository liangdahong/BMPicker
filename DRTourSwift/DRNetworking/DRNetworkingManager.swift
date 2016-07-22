//
//  DRNetworkingManager.swift
//  DRTourSwift
//
//  Created by Daredos on 16/7/22.
//  Copyright © 2016年 LiangDahong. All rights reserved.
//

import UIKit


class DRNetworkingManager: NSObject {

    var timeoutInterval: NSTimeInterval = 20.0;
    var cachePolicy: NSURLRequestCachePolicy = .UseProtocolCachePolicy;
    
// MARK: - 获取单例对象
    /// 获取单例对象
    class var sharedNetworkingManager: DRNetworkingManager {
        struct Static {
            static let instance = DRNetworkingManager()
        }
        return Static.instance
    }
    
// MARK: - get pos base func
    
    /*!
     GET 
     
     - parameter urlString:    url
     - parameter successBlock: 成功回调
     - parameter failureBlock: 失败回调
     */
    internal func GETWithUrlString(urlString: String,
                                   successBlock: ((response: NSURLResponse?,dataDict: NSDictionary?) -> Void)?,
                                   failureBlock: ((response: NSURLResponse?, err: NSError) -> Void)?) -> () {

        let url:NSURL = NSURL(string: urlString)!

        let requets: NSURLRequest = NSURLRequest.init(URL: url   , cachePolicy: self.cachePolicy, timeoutInterval: self.timeoutInterval)

        let configuration: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()

        let session: NSURLSession = NSURLSession(configuration: configuration)

        let task = session.dataTaskWithRequest(requets) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            if error == nil {
                do{
                    let responseData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                    print("\n----------------------\n url = \(urlString)\n 普通GET请求下载成功:\nresponseData = \n\(responseData)\n----------------------");
                    successBlock!(response: response, dataDict: responseData);
                }catch{
                }
            }else {
                print("\n----------------------\nurl = \(urlString)的普通GET请求下载失败:\n error = \n\(error)\n----------------------");
                failureBlock!(response: response, err: error!);
            }
        }
        // 启动任务
        task.resume()
    }

    /*!
     GET 待参数的网络请求
     
     - parameter urlString:    url
     - parameter parameter:    参数
     - parameter successBlock: 成功回调
     - parameter failureBlock: 失败回调
     */
    internal func GETWithUrlString(urlString: String,
                                   parameter: NSDictionary,
                                   successBlock: ((response: NSURLResponse?,dataDict: NSDictionary?) -> Void)?,
                                   failureBlock: ((response: NSURLResponse?, err: NSError) -> Void)?) -> ()  {

        let url: NSURL = NSURL(string: urlString)!
        let request: NSMutableURLRequest = NSMutableURLRequest.init(URL: url   , cachePolicy: self.cachePolicy, timeoutInterval: self.timeoutInterval)
        
        request.HTTPMethod = "GET"
        
        for key in parameter.allKeys {
            request.addValue(parameter.objectForKey(key) as! String, forHTTPHeaderField: key as! String);
        }

        let configuration:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session:NSURLSession = NSURLSession(configuration: configuration)

        let task:NSURLSessionDataTask = session.dataTaskWithRequest(request, completionHandler: {
            (data:NSData?,response:NSURLResponse?,error:NSError?)->Void in
            if error == nil {
                do{
                    let responseData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                    print("\n----------------------\n url = \(urlString)\n 带参数的GET请求下载成功:\nresponseData = \n\(responseData)\n----------------------");
                    successBlock!(response: response, dataDict: responseData);
                }catch{
                }
            }else {
                print("\n----------------------\nurl = \(urlString)带参数的GET请求下载失败:\n error = \n\(error)\n----------------------");
                failureBlock!(response: response, err: error!);
            }
        })
        task.resume()
    }
    /*!
     POST 请求
     
     - parameter urlString:    url
     - parameter parameter:    参数
     - parameter successBlock: 成功回调
     - parameter failureBlock: 失败回调
     */
    internal func POSTWithUrlString(urlString: String,
                                   parameter: NSDictionary,
                                   successBlock: ((response: NSURLResponse?,dataDict: NSDictionary?) -> Void)?,
                                   failureBlock: ((response: NSURLResponse?, err: NSError) -> Void)?) -> ()  {

        let configuration: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session: NSURLSession = NSURLSession(configuration: configuration)
        let request = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        request.HTTPMethod = "POST"
        var postString = ""
        for key in parameter.allKeys {
            postString += "&\(key)=\(parameter.objectForKey(key) as! String)";
        }
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)

        let task = session.dataTaskWithRequest(request, completionHandler: {
            (data:NSData?,response:NSURLResponse?,error:NSError?)->Void in
            if error == nil {
                do{
                    let responseData: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                    print("\n----------------------\n url = \(urlString)\n POST请求下载成功:\nresponseData = \n\(responseData)\n----------------------");
                    successBlock!(response: response, dataDict: responseData);
                }catch{
                }
            }else {
                print("\n----------------------\nurl = \(urlString)\n POST请求下载失败:\n error = \n\(error)\n----------------------");
                failureBlock!(response: response, err: error!);
            }
        })
        task.resume()
    }
}
