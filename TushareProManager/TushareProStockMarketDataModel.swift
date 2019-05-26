//
//  TushareProStockMarketDataModel.swift
//  ChartDemo
//
//  Created by Weibin Wu on 27/5/2019.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

//MARK: 日线/周线/月线 行情数据
class TusahreProMarketDataClass: Object, Mappable {
    
    @objc dynamic var marketDataType = NULL_DATA //行情数据类型, 用于区分: 日线/周线/月线
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var trade_date: String = NULL_DATA //交易日期
    @objc dynamic var open: String = NULL_DATA //开盘价
    @objc dynamic var high: String = NULL_DATA //最高价
    @objc dynamic var low: String = NULL_DATA //最低价
    @objc dynamic var close: String = NULL_DATA //收盘价
    @objc dynamic var pre_close: String = NULL_DATA //昨收价
    @objc dynamic var change: String = NULL_DATA //涨跌额
    @objc dynamic var pct_chg: String = NULL_DATA //涨跌幅, 未复权
    @objc dynamic var vol: String = NULL_DATA //成交量 （手）
    @objc dynamic var amount: String = NULL_DATA //成交额 （千元）
   
    required convenience init?(map: Map) {
        self.init()
    }
    
    //MARK: Realm 数据库配置
    
    //设置主键
    override class func primaryKey() -> String? {
        return "ts_code"
    }
    //设置索引
    override static func indexedProperties() -> [String] {
        return ["ts_code", "trade_date", "marketDataType"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        marketDataType  <- map["marketDataType"]
        ts_code     <- map["ts_code"]
        trade_date  <- map["trade_date"]
        open        <- map["open"]
        high        <- map["high"]
        low         <- map["low"]
        close       <- map["close"]
        pre_close   <- map["pre_close"]
        change      <- map["change"]
        pct_chg     <- map["pct_chg"]
        vol         <- map["vol"]
        amount      <- map["amount"]
    }
}

//MAKR: 复权因子
class TushareProAdjustFactorClass: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var trade_date: String = NULL_DATA //交易日期
    @objc dynamic var adj_factor: String = NULL_DATA //复权因子
   
    required convenience init?(map: Map) {
        self.init()
    }
    
    //MARK: Realm 数据库配置
    
    //设置主键
    override class func primaryKey() -> String? {
        return "ts_code"
    }
    //设置索引
    override static func indexedProperties() -> [String] {
        return ["ts_code", "trade_date"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code     <- map["ts_code"]
        trade_date  <- map["trade_date"]
        adj_factor  <- map["adj_factor"]
    }
}
