//
//  Api.swift
//  CallBackDemo
//
//  Created by iMac on 19/01/19.
//  Copyright © 2019 MoreYeahs. All rights reserved.


import Foundation
import UIKit
import Reachability
//import Alamofire

typealias HTTParameters = [String: Any]

class ApiResponse {

    static func onResponsePost(url: String,parms: [String:Any], queryType: Bool = false, isProgressIndicator: Bool = true, completion: @escaping (_ res: [String:Any] , _ error : Error?) -> Void) {

        if Reachability()!.isReachable
        {
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)
            let request = NSMutableURLRequest()
            request.httpBody = try! JSONSerialization.data(withJSONObject: parms, options: JSONSerialization.WritingOptions())
            request.url = URL(string: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")

            request.httpMethod = "POST"
            let task = session.dataTask(with: request as URLRequest) {
                data, response, error in
                if isProgressIndicator {
//                    SVProgressHUD.dismiss()
                }

                if (error != nil) {
                    completion([:], error)
                    return
                }
                do {
                    if let httpResponse = response as? HTTPURLResponse{
                            if httpResponse.statusCode == 200{
                                print("Refresh token...")
                                let result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? [String:Any]
                                 completion(result ?? [:], error ?? nil)

                                return
                            }else{
                                if (error != nil) {
                                    print("Refresh token...")
                                    let result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? [String:Any]
                                    completion(result ?? [:], error ?? nil)
                                    return
                                }
                        }
                    }

                }
                catch
                {
                }
            }
            task.resume()
        }else{

          ApiResponse.alert(title: NetworkMessages.DATA_OFF.rawValue, message: AlertMessages.noInternet)
        }

    }

    
    static func onResponseGet(url: String,showHud:Bool=true, completion: @escaping (_ res: [String : Any]  , _ error : String) -> Void) {
        
        
        if Reachability()!.isReachable
        {
            let authkey =  userDef.value(forKey: "apiKey")
            let headers = ["cache-control": "no-cache","Authorization": authkey]
            
   
            guard let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed), let url = URL(string: urlString) else { return }
            let request = NSMutableURLRequest(url: url,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers as? [String : String]
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                DispatchQueue.main.async {
                    //                    SVProgressHUD.dismiss()
                }
                if (error != nil) {
                    
                } else {
                    do {
                        let result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as?  [String : Any]
                        userDef.value(forKey: "apiKey")
                        if let reviews = result!["errors"] as? [NSDictionary] {
                            completion(NSDictionary() as! [String : Any], reviews[0]["message"] as! String)
                        }else{
                            completion(result!, "")
                        }
                        
                    }
                    catch
                    {
                    }
                }
            })
            
            dataTask.resume()
        }else{
            
            ApiResponse.alert(title: NetworkMessages.DATA_OFF.rawValue, message: AlertMessages.noInternet)
        }
    }
    
    static func onResponsePut(url: String,parms: NSDictionary, completion: @escaping (_ res:NSDictionary , _ error : String) -> Void) {
        
        if Reachability()!.isReachable
        {
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)
            let url = NSURL(string:"\(url)")
            let request = NSMutableURLRequest(url: url! as URL)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let authkey = userDef.value(forKey: "apiKey") as! String
            
            request.setValue("\(authkey)", forHTTPHeaderField: "Authorization")
            request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
            //            SVProgressHUD.show()
            //            SVProgressHUD.setBackgroundColor(UIColor.clear)
            //            SVProgressHUD.setRingThickness(2.0)
            //            SVProgressHUD.setDefaultMaskType(.clear)
            //            SVProgressHUD.setForegroundColor(UIColor.init(red: 255.0/255.0, green: 100.0/255.0, blue: 26.0/255.0, alpha: 1.0))
            
            request.httpMethod = "PUT"
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parms, options: JSONSerialization.WritingOptions())
                
                let task = session.dataTask(with: request as URLRequest) {
                    data, response, error in
                    //                    SVProgressHUD.dismiss()
                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode != 200 {
                            completion(["":""], "Status_Not_200")
                            return
                        }
                    }
                    if (error != nil) {
                        completion(["":""], "\(String(describing: error))")
                        return
                    }
                    do {
                        let result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? NSDictionary
                        userDef.value(forKey: "apiKey")
                        completion(result! , "")
                    }
                    catch
                    {
                    }
                }
                task.resume()
            }
            catch
            {
            }
        }else
        {
            //            ApiResponse.alert(title: NetworkMessages.DATA_OFF.rawValue, message: AlertMessages.noInternet)
        }
        
    }
    
    // MARK:- MultiPart Image Upload
//    static func ImageUploadwithdata(url: String,parms: [String:Any], image: UIImage, completion: @escaping (_ res: [String:Any]? , _ error : Error?) -> Void) {
//
//        if NetworkReachabilityManager()!.isReachable
//        {
//            SVProgressHUD.show()
//            SVProgressHUD.setBackgroundColor(UIColor.clear)
//            SVProgressHUD.setRingThickness(2.0)
//            SVProgressHUD.setDefaultMaskType(.clear)
//            SVProgressHUD.setForegroundColor(UIColor.init(red: 255.0/255.0, green: 100.0/255.0, blue: 26.0/255.0, alpha: 1.0))
//            guard let imgData = UIImage.jpegData(image)(compressionQuality: 0.5) else{ return}
//
//            Alamofire.upload(multipartFormData: { multipartFormData in
//                for (key, value) in parms {
//                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as! String)
//                }
//                multipartFormData.append(imgData, withName: "image",fileName: "file.jpg", mimeType: "image/jpg")
//            }, to:url)
//            { (result) in
//                switch result {
//                case .success(let upload, _, _):
//
//                    upload.uploadProgress(closure: { (progress) in
//                        //                        print("Upload Progress: \(progress.fractionCompleted)")
//                    })
//
//                    upload.responseJSON { response in
//                        SVProgressHUD.dismiss()
//                        let dict = response.result.value as? [String:Any]
//                        completion(dict ?? [:] , nil)
//                    }
//
//                case .failure(let encodingError):
//                    SVProgressHUD.dismiss()
//                    completion(nil , encodingError)
//                }
//            }
//        }else
//        {
//            ApiResponse.alert(title: NetworkMessages.DATA_OFF.rawValue, message: AlertMessages.noInternet)
//        }
//
//
//    }
//
    
    
    // MARK:-  ***************************** Delete API  ***********-------->
    
//    static func doDeletePost(url: String,parms: [String:Any], completion: @escaping (_ res:[String:Any] , _ error : String) -> Void) {
//
//        if NetworkReachabilityManager()!.isReachable
//        {
//            SVProgressHUD.show()
//            SVProgressHUD.setBackgroundColor(UIColor.clear)
//            SVProgressHUD.setRingThickness(2.0)
//            SVProgressHUD.setDefaultMaskType(.clear)
//            SVProgressHUD.setForegroundColor(UIColor.init(red: 255.0/255.0, green: 100.0/255.0, blue: 26.0/255.0, alpha: 1.0))
//
//            let configuration = URLSessionConfiguration.default
//            let session = URLSession(configuration: configuration)
//            let url = NSURL(string:"\(url)")
//            let request = NSMutableURLRequest(url: url! as URL)
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//
//            let authkey = userDef.value(forKey: "apiKey")!
//            request.setValue("\(authkey)", forHTTPHeaderField: "Authorization")
//            request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
//            request.httpMethod = "DELETE"
//
//
//            do {
//                request.httpBody = try JSONSerialization.data(withJSONObject: parms, options: JSONSerialization.WritingOptions())
//                let task = session.dataTask(with: request as URLRequest) {
//                    data, response, error in
//
//                    SVProgressHUD.dismiss()
//
//                    if (error != nil) {
//                        completion([:], "\(String(describing: error))")
//                        return
//                    }
//                    do {
//                        let result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? [String:Any]
//                        completion(result ?? [:] , "")
//                    }
//                    catch
//                    {
//                    }
//                }
//                task.resume()
//            }
//            catch
//            {
//            }
//        }else
//        {
//            ApiResponse.alert(title: NetworkMessages.DATA_OFF.rawValue, message: AlertMessages.noInternet)
//        }
//
//
//    }
    // Delete End...!
    
    
    
    // MARK:-    ***************************** API Key String  ***********-------->
//
//    static func onResponseKeyPost(url: String,parms: [String:Any], completion: @escaping (_ res:[String:Any] , _ error : String) -> Void) {
//
//
//        if NetworkReachabilityManager()!.isReachable
//        {
//
//                SVProgressHUD.show()
//                SVProgressHUD.setBackgroundColor(UIColor.clear)
//                SVProgressHUD.setRingThickness(2.0)
//                SVProgressHUD.setDefaultMaskType(.clear)
//                SVProgressHUD.setForegroundColor(UIColor.init(red: 255.0/255.0, green: 100.0/255.0, blue: 26.0/255.0, alpha: 1.0))
//
//            let configuration = URLSessionConfiguration.default
//            let session = URLSession(configuration: configuration)
//            let apiUrl = NSURL(string:"\(url)")
//            let request = NSMutableURLRequest(url: apiUrl! as URL)
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//            let authkey = (userDef.value(forKey: "apiKey") as? String) ?? ""
//            request.setValue("\(authkey)", forHTTPHeaderField: "Authorization")
//            request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
//            request.httpMethod = "POST"
//
//            do {
//                request.httpBody = try JSONSerialization.data(withJSONObject: parms, options: JSONSerialization.WritingOptions())
//                let task = session.dataTask(with: request as URLRequest) {
//                    data, response, error in
//                        SVProgressHUD.dismiss()
//                    if (error != nil) {
//                        completion(["":""], "\(String(describing: error))")
//                        return
//                    }
//                    do {
//                        let result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? [String:Any]
//                        userDef.value(forKey: "apiKey")
//                        if let reviews = result!["errors"] as? [NSDictionary] {
//                            completion([:] , reviews[0]["message"] as! String)
//                        }else{
//                            completion(result ?? [:], "")
//                        }
//                    }
//                    catch
//                    {
//                        SVProgressHUD.dismiss()
//                    }
//                }
//                task.resume()
//            }
//            catch
//            {
//            }
//        }else
//        {
//            ApiResponse.alert(title: NetworkMessages.DATA_OFF.rawValue, message: AlertMessages.noInternet)
//        }
//    }
    
    
    
    // MARK:-    ***************************** API Key String  ***********-------->
    
    
    
    
    static func alert(title: String, message : String , controller: UIViewController? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            if controller != nil{
                controller?.present(alert, animated: true, completion: nil)
            }else{
                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    static func alertController(title: String, message : String, err: Int, controller: UIViewController?) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
                if err == 1 {
                    controller?.navigationController?.popViewController(animated: true)
                }
            }
            alertController.addAction(action1)
            controller?.present(alertController, animated: true, completion: nil)
        }
    }
}


extension ApiResponse {
    
    private class func urlQueryString(url: URL, parameters: [String: Any]?) -> URL? {
        
        guard parameters != nil else {
            return nil
        }
        
        guard !parameters!.isEmpty else {
            return nil
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        var items = [URLQueryItem]()
        
        for key in (parameters?.keys.sorted(by: <))! {
            let value = parameters![key]!
            items.append(URLQueryItem(name: key, value: value as? String))
        }
        components?.queryItems = items
        
        return components?.url
    }
}

final class SharedData {
    
    //MARK: Shared Instance
    static let sharedInstance: SharedData = SharedData()
    static var date = String()

    static let objSharedInstance: SharedData = SharedData()

    class func getCurrentTImeOffset()->Int{
        let floattime = NSTimeZone.system.secondsFromGMT()
        return  Int(floattime) * 1000
    }
    
    class func getStringFromDateWithDataFormatter(date:NSDate,dateFormatter:DateFormatter)->String{
        
        dateFormatter.dateFormat = "dd MM yyyy"

        dateFormatter.timeZone =  NSTimeZone.local
        
        let dateObj = dateFormatter.string(from: date as Date)
        // print("post data=",dateObj)
        return dateObj
        
    }
    
    class func getStringFromDateWithDataFormatterreturnDate(date:String,dateFormatter:DateFormatter)->Date{
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        // dateFormatter.timeZone =  NSTimeZone.ut
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        
        let dateObj = dateFormatter.date(from: date)
        let dateObj1 = dateFormatter.string(from: dateObj!)
        let dateObj2 = dateFormatter.date(from: dateObj1)
        
        // print("post data=",dateObj)
        return dateObj2!
        
    }
    
    class func getStringFromDateWithDataFormatterreturnTime(dateFormatter: DateFormatter)-> Date {
        
        // dateFormatter.timeZone =  NSTimeZone.ut
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        dateFormatter.timeZone =  NSTimeZone.local
        var dateFromString = Date()
        let dateObj1 = dateFormatter.string(from: Date())
        if let dateObj2 = dateFormatter.date(from:dateObj1) {
            dateFromString = dateObj2
        }
        return dateFromString
    }
    
    class func getStringFromDate(date: Date, dateFormatterString: String)-> String {
        
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = dateFormatterString//"MMMM dd, yyyy"
        //dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let dateObj = dateFormatter.string(from: date as Date)
        return dateObj
        
    }
    
    class func getStringFromString(strDate:String, formatString:String, withFormatString:String)-> String{
        
        //  print("getStringFromString",strDate)
        if strDate.count<=0{
            return ""
        }else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = formatString
            //dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
            
            let dateObj = dateFormatter.date(from: strDate)
            //print(dateObj)
            if dateObj == nil {
                return ""
            }else{
                dateFormatter.dateFormat = withFormatString
                
                return self.getStringFromDateWithDataFormatter(date: dateObj! as NSDate, dateFormatter: dateFormatter)
            }
        }
        
    }
    
    class func getStringFromStringWithoutUTC(strDate:String, formatString:String, withFormatString:String)-> String{
        
        //  print("getStringFromString",strDate)
        if strDate.count<=0{
            return ""
        }else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = formatString
            //dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
            let dateObj = dateFormatter.date(from: strDate)
            //print(dateObj)
            if dateObj == nil {
                return ""
            }else{
                dateFormatter.dateFormat = withFormatString
                
                return self.getStringFromDateWithDataFormatter(date: dateObj! as NSDate, dateFormatter: dateFormatter)
            }
        }
        
    }
    
}
