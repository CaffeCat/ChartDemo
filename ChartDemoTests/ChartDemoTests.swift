//
//  ChartDemoTests.swift
//  ChartDemoTests
//
//  Created by Weibin Wu on 28/4/2019.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

import XCTest
import Alamofire
@testable import ChartDemo

class ChartDemoTests: XCTestCase {

    //MARK: - 异步进行单元测试的参考例子
    func testAsyncURLConnection() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let URL = NSURL(string: "http://www.baidu.com")!
        let expect = expectation(description: "GET \(URL)")
        
        let session = URLSession.shared
        let task = session.dataTask(with: URL as URL, completionHandler: {(data, response, error) in
            
            XCTAssertNotNil(data, "返回数据不应该为空")
            XCTAssertNil(error, "error应该为nil")
            print("测试成功?")
            expect.fulfill() //请求结束通知测试
            
            if response != nil {
                let httpResponse: HTTPURLResponse = response as! HTTPURLResponse
                
                XCTAssertEqual(httpResponse.statusCode, 200, "请求失败!")
                
                DispatchQueue.main.async {
                    //主线程中干事情
                }
                
            } else {
                XCTFail("请求失败!")
            }
        })
        
        task.resume()
        
        //请求超时
        waitForExpectations(timeout: (task.originalRequest?.timeoutInterval)!, handler: {error in
            task.cancel()
            print("测试成功!!!")
        })
    }

    func testPerformanceAsyncURLConnection() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let URL = NSURL(string: "http://www.baidu.com")!
            let expect = expectation(description: "GET \(URL)")
            
            let session = URLSession.shared
            let task = session.dataTask(with: URL as URL, completionHandler: {(data, response, error) in
                
                XCTAssertNotNil(data, "返回数据不应该为空")
                XCTAssertNil(error, "error应该为nil")
                print("测试成功?")
                expect.fulfill() //请求结束通知测试
                
                if response != nil {
                    let httpResponse: HTTPURLResponse = response as! HTTPURLResponse
                    
                    XCTAssertEqual(httpResponse.statusCode, 200, "请求失败!")
                    
                    DispatchQueue.main.async {
                        //主线程中干事情
                    }
                    
                } else {
                    XCTFail("请求失败!")
                }
            })
            
            task.resume()
            
            //请求超时
            waitForExpectations(timeout: (task.originalRequest?.timeoutInterval)!, handler: {error in
                task.cancel()
                print("测试成功!!!")
            })
        }
    }
    
    //MARK: - 根据参考例子进行自定义单元测试
    
    /// 测试初始化调用
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    /// 测试结束调用
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchStockList() {
        
        let expect = expectation(description: "请求成功")
        //配置请求参数
        let tushareProURL = URL.init(string: TUSHARE_PRO_URL)!
        let fields = "ts_code, symbol, name, area, industry, fullname, enname, market, exchange, curr_type, list_status, list_date, delist_date, is_hs"
        let params = ["list_status":"L"]
        let requestParameters = ["api_name": "stock_basic",
                                 "token": TUSHARE_PRO_TOKEN,
                                 "params": params,
                                 "fields": fields] as [String : Any]
        
        Alamofire.request(tushareProURL,
                          method: .post,
                          parameters: requestParameters,
                          encoding: JSONEncoding.default,
                          headers: nil).validate().responseJSON { (response) in
                            
                            print("\(response.result)")
                            if response.result.isSuccess {
                                expect.fulfill()
                                
                                print("数据响应: \(String(describing: response.data))")
                                if let data = response.data {
                                    if let dict  = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                                        let json = dict as! Dictionary<String, Any>
                                        let request_id = json["request_id"] as! String
                                        print("request_id: \(String(describing: request_id))")
                                    }
                                }
                            }else {
                                XCTFail("请求失败!")
                            }
        }
        
        waitForExpectations(timeout: 5) { (error) in
            print(#function, " 请求成功!")
        }
    }
    
    func testPerformanceFetchStockList() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
            let expect = expectation(description: "请求成功")
            //配置请求参数
            let tushareProURL = URL.init(string: TUSHARE_PRO_URL)!
            let fields = "ts_code, symbol, name, area, industry, fullname, enname, market, exchange, curr_type, list_status, list_date, delist_date, is_hs"
            let params = ["list_status":"L"]
            let requestParameters = ["api_name": "stock_basic",
                                     "token": TUSHARE_PRO_TOKEN,
                                     "params": params,
                                     "fields": fields] as [String : Any]
            
            Alamofire.request(tushareProURL,
                              method: .post,
                              parameters: requestParameters,
                              encoding: JSONEncoding.default,
                              headers: nil).validate().responseJSON { (response) in
                                
                                print("\(response.result)")
                                if response.result.isSuccess {
                                    expect.fulfill()
                                    
                                    print("数据响应: \(String(describing: response.data))")
                                    if let data = response.data {
                                        if let dict  = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                                            let json = dict as! Dictionary<String, Any>
                                            let request_id = json["request_id"] as! String
                                            print("request_id: \(String(describing: request_id))")
                                        }
                                    }
                                }else {
                                    XCTFail("请求失败!")
                                }
            }
            
            waitForExpectations(timeout: 5) { (error) in
                print(#function, " 请求成功!")
            }
        }
    }
}
