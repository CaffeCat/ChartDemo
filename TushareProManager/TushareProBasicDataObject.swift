//
//  TushareProBasicDataObject.swift
//  ChartDemo
//
//  Created by Weibin Wu on 23/5/2019.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

// MARK: 上市公司股票列表
@objcMembers class TushareProStockListModel: Object, Mappable{
    
    dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    dynamic var symbol: String = NULL_DATA //股票代码
    dynamic var name: String = NULL_DATA //股票名称
    dynamic var area: String = NULL_DATA //所在地域
    dynamic var industry: String = NULL_DATA //所属行业
    dynamic var fullname: String = NULL_DATA //股票全称
    dynamic var enname: String = NULL_DATA //英文全称
    dynamic var market: String = NULL_DATA //市场类型(主板/中小板/创业板)
    dynamic var exchange: String = NULL_DATA //交易所(代码)
    dynamic var curr_type: String = NULL_DATA //交易货币
    dynamic var list_status: String = NULL_DATA //上市状态：L上市/D退市/P暂停上市
    dynamic var list_date: String = NULL_DATA //上市日期
    dynamic var delist_date: String = NULL_DATA //退市日期
    dynamic var is_hs: String = NULL_DATA //是否沪深港通标的，N否 H沪股通 S深股通
    
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
        return ["ts_code", "symbol", "name"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code     <- map["ts_code"]
        symbol      <- map["symbol"]
        name        <- map["name"]
        area        <- map["area"]
        industry    <- map["industry"]
        fullname    <- map["fullname"]
        enname      <- map["enname"]
        market      <- map["market"]
        exchange    <- map["exchange"]
        curr_type   <- map["curr_type"]
        list_status <- map["list_status"]
        list_date   <- map["list_date"]
        delist_date <- map["list_date"]
        is_hs       <- map["list_date"]
    }
}
