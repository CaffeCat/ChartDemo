//
//  TushareProManager.swift
//  ChartDemo
//
//  Created by caffe on 2019/5/21.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

import Foundation
import Alamofire

class TushareProManager {
    
    //MARK: - 这是类方法入口, 用于请求TusharePro所有数据
    class func fetchData(type: TushareProAPI) -> Bool {
       
        var result = false
        
        switch type {
        case .TushareProStockList:
            
                let semaphore = DispatchSemaphore.init(value: 0)
                DispatchQueue.global().async {
                    result = self.fetchStockList()
                    semaphore.signal()
                }
                _ = semaphore.wait(timeout: .now() + .seconds(3))
                return result
        }
    }
    
    class func fetchStockList() -> Bool{
        
        let tushareProURL = URL.init(string: "http://api.tushare.pro")!
        let fields = "ts_code, symbol, name, area, industry, fullname, enname, market, exchange, curr_type, list_status, list_date, delist_date, is_hs"
        let requestParameters = ["api_name": "stock_basic",
                                 "token": "8f8f3d53921ba974ece21d699a09d6f7381e0f2bdeb29ff535ef0945",
                                 "params": ["list_status":"L"],
                                 "fields": fields] as [String : Any]
        
        print("\(Date.timeIntervalSinceReferenceDate)")
        let semaphore = DispatchSemaphore.init(value: 0)
        
        DispatchQueue.global().async {
            Alamofire.request(tushareProURL,
                              method: .post,
                              parameters: requestParameters,
                              encoding: JSONEncoding.default,
                              headers: nil).validate().responseJSON { (response) in
                                
                                print("\(response.result)")
                                if response.result.isSuccess {
                                    semaphore.signal()
                                    print("数据响应: \(String(describing: response.data))")
                                    if let data = response.data {
                                        if let dict  = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                                            let json = dict as! Dictionary<String, Any>
                                            let request_id = json["request_id"] as! String
                                            print("request_id: \(String(describing: request_id))")
                                        }
                                    }
                                }
            }
        }
        
        let timeout = semaphore.wait(timeout: .now() + .seconds(3))
        print("\(Date.timeIntervalSinceReferenceDate)")
        
        print("timeout: \(timeout)")
        if (timeout == .success){
            return true
        }
        return false
    }
}
