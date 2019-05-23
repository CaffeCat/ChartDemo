//
//  TushareProManager.swift
//  ChartDemo
//
//  Created by caffe on 2019/5/21.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum FetchTimeout: Int {
    case FetchTimeoutShort = 1
    case FetchTimeoutMiddle = 3
    case FetchTimeoutLong = 5
    case FetchTimeoutLongLong = 10
}

let FETCH_TIMEOUT = 4
let TUSHARE_PRO_URL = "http://api.tushare.pro"
let TUSHARE_PRO_TOKEN = "126d508b79bd6c2b84056872baefbe8c0731b71b15beed527d7cdbba"

class TushareProManager {
    
    //MARK: - 这是类方法入口, 用于请求TusharePro所有数据
    class func fetchData(type: TushareProAPI, requestData: TushareProRequestData? = nil) -> Bool {
        print(#function , " 进入时间 : \(Date.timeIntervalSinceReferenceDate)")
        var result = false
        //设置同步信号量
        let semaphore = DispatchSemaphore.init(value: 0)
        
        DispatchQueue.global().async {
            
            switch type {
            case .TushareProStockList:
                
                result = self.fetchStockList()
                semaphore.signal()//发出同步信号量
                
            case .TushareProTradeCalendar:
                
                result = self.fetchTradeCalendar()
                semaphore.signal()
                
            case .TushareProStockCompany:
                
                result = self.fetchStockCompany()
                semaphore.signal()
                
            case .TushareProHistoryName:
                
                result = self.fetchHistoryName()
                semaphore.signal()
                
            case .TushareProConstituentStocksOfHS:
                
                result = self.fetchConstituentStocksOfHS()
                semaphore.signal()
                
            case .TushareProNewShareStocks:
                
                result = self.fetchNewShareStocks()
                semaphore.signal()
                
            default:
                
                // need to do something?
                result = false
                print("There are someting needs to do.")
                
            }
        }
        
        //获取同步信号量
        _ = semaphore.wait(timeout: .now() + .seconds(FetchTimeout.FetchTimeoutLongLong.rawValue))
        
        return result
    }
    
    // MARK: - 公共函数列表
    
    // MARK: 通用数据获取
    private class func getDataFromTusharePro(request: TushareProRequestData) -> Bool{
        
        let tushareProURL = request.apiURL!
        let api = request.api!
        let fields = request.fields!
        let params = request.params!
        let requestParameters = ["api_name": api,
                                 "token": TUSHARE_PRO_TOKEN,
                                 "params": params,
                                 "fields": fields] as [String : Any]
        
        let semaphore = DispatchSemaphore.init(value: 0)
        //异步发起请求, 但是同步返回结果
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
                                        
                                        let json = try! JSON.init(data: data)
                                        //print("SwiftyJson 成功解析数据", json)
                                        
                                        self.parseJSONFromTusharePro(json: json, request: request)
                                        //self.parseDataFromTusharePro(data: data, request: request)
                                    }
                                }
            }
        }
        
        //获取同步信号量
        let timeout = semaphore.wait(timeout: .now() + .seconds(FetchTimeout.FetchTimeoutLong.rawValue))
        print("\(Date.timeIntervalSinceReferenceDate) semaphore signal: \(timeout)")
        
        //判断同步数据是否成功, 或超时？超时不一定代表失败了!
        if (timeout == .success){
            return true
        }
        return false
    }
    
    // MARK: 通用数据解析 -- Data 途径
    private class func parseDataFromTusharePro(data: Data, request: TushareProRequestData) {
        
        if let dict  = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers){
            let json = dict as! Dictionary<String, Any>
            let request_id = json["request_id"] as! String
            let code = json["code"] as! Int
            let msg = json["msg"] as? String   //这个值可能为空
            print("request_id:", request_id, " code:", code, "msg:", msg as Any)
            
            if let data = json["data"] as? Dictionary<String, Any> {
                
                if let fields = data["fields"] as? Array<String> {
                    // 可能需要写入数据库前进行字段对比
                    // 这里拿到 TusharePro 返回的字段列表
                    print("fields:", fields)
                }
                
                if let items = data["items"] as? Array<Any> {
                    for item in items {
                        if let content = item as? Array<Any> {
                            // 可能需要将数据写入数据库
                            // 这里拿到 TusharePro 返回的数据
                            print(content)
                        }
                    }
                }
            }
        }
    }
    
    // MARK: 通用数据解析 -- JSON 途径
    private class func parseJSONFromTusharePro(json: JSON, request: TushareProRequestData) {
        
        let request_id = json["request_id"].string!
        let code = json["code"].int!
        let msg = json["msg"].string  //这个值可能为空
        
        print("request_id: ", request_id)
        
        if code == 0 && msg == nil {
            
            let data = json["data"] //数据
            let fields = data["fields"].array! //字段
            
            //构建字典键值数组
            var keysArray: Array<String> = Array.init()
            for item in fields {
                let str = item.string!
                keysArray.append(str)
            }
            
            var stockList = TushareProStockListClass.init()
            var times:Int = 0 //统计执行次数
            
            if let items = data["items"].array {
                for item in items {
                    let item = item.array!
                    var valuesArray: Array<String> = Array.init()
                    for value in item {
                        let str = value.string
                        valuesArray.append(str ?? NULL_DATA)
                    }
                    let oc_dict = NSDictionary.init(objects: valuesArray, forKeys: keysArray as [NSCopying])
                    
                    stockList = TushareProStockListClass(JSON: oc_dict as! [String : Any]) ?? stockList
                    times += 1
                    print( times, stockList)
                }
            }
        }
    }
    
    // MARK: 解析数据转JSON -- 给 Data 途径使用
    private class func formatJsonFromParseData(fields: Array<String>, data: [[Any]]){
    
    }
    
    // MARK: - 内部私有获取数据方法
    
    // MARK: 股票列表
    private class func fetchStockList() -> Bool{
        
        //配置请求参数
        let tushareProURL = URL.init(string: TUSHARE_PRO_URL)!
        let api = "stock_basic"
        let fields = "ts_code, symbol, name, area, industry, fullname, enname, market, exchange, curr_type, list_status, list_date, delist_date, is_hs"
        let params = ["list_status":"L"]
        
        let request = TushareProRequestData.init()
        request.apiName = .TushareProStockList
        request.api = api
        request.apiURL = tushareProURL
        request.fields = fields
        request.params = params
        request.needSyncToDatabase = false
        
        return self.getDataFromTusharePro(request: request)
    }
    
    //MARK: 股票交易日历
    private class func fetchTradeCalendar() -> Bool {
        
        //配置请求参数
        let tushareProURL = URL.init(string: TUSHARE_PRO_URL)!
        let api = "trade_cal"
        let fields = "exchange, cal_date, is_open, pretrade_date"
        let params = ["exchange": "SSE", "start_date": "20180101", "end_date": "20191231"]
        
        let request = TushareProRequestData.init()
        request.apiName = .TushareProStockList
        request.api = api
        request.apiURL = tushareProURL
        request.fields = fields
        request.params = params
        request.needSyncToDatabase = false
        
        return self.getDataFromTusharePro(request: request)
    }
    
    //MARK: 上市公司基础信息
    private class func fetchStockCompany() -> Bool {
        
        //配置请求参数
        let tushareProURL = URL.init(string: TUSHARE_PRO_URL)!
        let api = "stock_company"
        let fields = "ts_code, exchange, chairman, manager, secretary, reg_capital, setup_date, province, city, introduction, website, email, office, employees, main_business, business_scope"
        let params = ["":""]
        
        let request = TushareProRequestData.init()
        request.apiName = .TushareProStockList
        request.api = api
        request.apiURL = tushareProURL
        request.fields = fields
        request.params = params
        request.needSyncToDatabase = false
        
        return self.getDataFromTusharePro(request: request)
    }
    
    //MARK: 公司名称变更记录
    private class func fetchHistoryName() -> Bool {
        
        //配置请求参数
        let tushareProURL = URL.init(string: TUSHARE_PRO_URL)!
        let api = "namechange"
        let fields = "ts_code, name, start_date, end_date, ann_date, change_reason"
        let params = ["ts_code": "000001"]
        
        let request = TushareProRequestData.init()
        request.apiName = .TushareProStockList
        request.api = api
        request.apiURL = tushareProURL
        request.fields = fields
        request.params = params
        request.needSyncToDatabase = false
        
        return self.getDataFromTusharePro(request: request)
    }
    
    //MARK: 沪股通或深股通成分股数据
    private class func fetchConstituentStocksOfHS() -> Bool {
        
        //配置请求参数
        let tushareProURL = URL.init(string: TUSHARE_PRO_URL)!
        let api = "hs_const"
        let fields = "ts_code, hs_type, in_date, out_date, is_new"
        let params = ["hs_type": "SH"] // ["hs_type": "SZ"]
        
        let request = TushareProRequestData.init()
        request.apiName = .TushareProStockList
        request.api = api
        request.apiURL = tushareProURL
        request.fields = fields
        request.params = params
        request.needSyncToDatabase = false
        
        return self.getDataFromTusharePro(request: request)
    }
    
    //MARK: IPO新股列表
    private class func fetchNewShareStocks() -> Bool {
        
        //配置请求参数
        let tushareProURL = URL.init(string: TUSHARE_PRO_URL)!
        let api = "new_share"
        let fields = "ts_code, sub_code, name, ipo_date, issue_date, amount, market_amount, price, pe, limit_amount, funds, ballot"
        let params = ["": ""] // ["hs_type": "SZ"]
        
        let request = TushareProRequestData.init()
        request.apiName = .TushareProStockList
        request.api = api
        request.apiURL = tushareProURL
        request.fields = fields
        request.params = params
        request.needSyncToDatabase = false
        
        return self.getDataFromTusharePro(request: request)
    }
    
}
