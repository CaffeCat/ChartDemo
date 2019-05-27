//
//  TushareProBasicData.swift
//  ChartDemo
//  TusharePro 基础数据
//  Created by Weibin Wu on 24/5/2019.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

//MARK: 上市公司列表
class TushareProStockListClass: Object, Mappable{
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var symbol: String = NULL_DATA //股票代码
    @objc dynamic var name: String = NULL_DATA //股票名称
    @objc dynamic var area: String = NULL_DATA //所在地域
    @objc dynamic var industry: String = NULL_DATA //所属行业
    @objc dynamic var fullname: String = NULL_DATA //股票全称
    @objc dynamic var enname: String = NULL_DATA //英文全称
    @objc dynamic var market: String = NULL_DATA //市场类型(主板/中小板/创业板)
    @objc dynamic var exchange: String = NULL_DATA //交易所 SSE上交所 SZSE深交所
    @objc dynamic var curr_type: String = NULL_DATA //交易货币
    @objc dynamic var list_status: String = NULL_DATA //上市状态：L上市/D退市/P暂停上市
    @objc dynamic var list_date: String = NULL_DATA //上市日期
    @objc dynamic var delist_date: String = NULL_DATA //退市日期
    @objc dynamic var is_hs: String = NULL_DATA //是否沪深港通标的，N否 H沪股通 S深股通
    
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
        return ["ts_code", "symbol", "name", "area", "industry", "enname", "fullname"]
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
        delist_date <- map["delist_date"]
        is_hs       <- map["is_hs"]
    }
}

//MARK: 交易日查询
class TushareProTradeCalendarClass: Object, Mappable {
    
    @objc dynamic var exchange: String = NULL_DATA //交易所 SSE上交所 SZSE深交所
    @objc dynamic var cal_date: String = NULL_DATA //日历日期
    @objc dynamic var is_open: String = NULL_DATA //是否交易 0休市 1交易
    @objc dynamic var pretrade_date: String = NULL_DATA //上一个交易日
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    //MARK: Realm 数据库配置
    
    //设置主键
    override class func primaryKey() -> String? {
        return "cal_date"
    }
    //设置索引
    override static func indexedProperties() -> [String] {
        return ["cal_date"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        exchange    <- map["exchange"]
        cal_date    <- map["cal_date"]
        is_open     <- map["is_open"]
        pretrade_date   <- map["pretrade_date"]
    }
}

//MARK: 上市公司基本信息
class TushareProStockCompanyClass: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //股票代码
    @objc dynamic var exchange: String = NULL_DATA //交易所代码 ，SSE上交所 SZSE深交所
    @objc dynamic var chairman: String = NULL_DATA //法人代表
    @objc dynamic var manager: String = NULL_DATA //总经理
    @objc dynamic var secretary: String = NULL_DATA //董秘
    //FIXME: 注册资本在数据源中是 float 类型
    @objc dynamic var reg_capital: String = NULL_DATA //注册资本
    @objc dynamic var setup_date: String = NULL_DATA //注册日期
    @objc dynamic var province: String = NULL_DATA //所在省份
    @objc dynamic var city: String = NULL_DATA //所在城市
    @objc dynamic var introduction: String = NULL_DATA //公司介绍
    @objc dynamic var website: String = NULL_DATA //公司主页
    @objc dynamic var email: String = NULL_DATA //电子邮件
    @objc dynamic var office: String = NULL_DATA //办公室
    @objc dynamic var employees: String = NULL_DATA //员工人数
    @objc dynamic var main_business: String = NULL_DATA //主要业务及产品
    @objc dynamic var business_scope: String = NULL_DATA //经营范围
    
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
        return ["ts_code", "main_business", "business_scope", "province", "city", "setup_date"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code     <- map["ts_code"]
        exchange    <- map["exchange"]
        chairman    <- map["chairman"]
        manager     <- map["manager"]
        secretary   <- map["secretary"]
        reg_capital <- map["reg_capital"]
        setup_date  <- map["setup_date"]
        province    <- map["province"]
        city        <- map["city"]
        introduction   <- map["introduction"]
        website     <- map["website"]
        email       <- map["email"]
        office      <- map["office"]
        employees   <- map["employees"]
        main_business    <- map["main_business"]
        business_scope   <- map["business_scope"]
    }
}

//MARK: 股票曾用名
class TushareProHistoryNameClass: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var name: String = NULL_DATA //证券名称
    @objc dynamic var start_date: String = NULL_DATA //开始日期
    @objc dynamic var end_date: String = NULL_DATA //结束日期
    @objc dynamic var ann_date: String = NULL_DATA //公告日期
    @objc dynamic var change_reason: String = NULL_DATA //变更原因
    
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
        return ["ts_code", "name", "change_reason"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code     <- map["ts_code"]
        name        <- map["name"]
        start_date  <- map["start_date"]
        end_date    <- map["end_date"]
        ann_date    <- map["ann_date"]
        change_reason    <- map["change_reason"]
    }
}

//MARK: 沪股通成分股
class TushareProConstituentStocksOfHSClass: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var hs_type: String = NULL_DATA //沪深港通类型SH沪SZ深
    @objc dynamic var in_date: String = NULL_DATA //纳入日期
    @objc dynamic var out_date: String = NULL_DATA //剔除日期
    @objc dynamic var is_new: String = NULL_DATA //是否最新 1是 0否
    
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
        return ["ts_code", "hs_type"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code     <- map["ts_code"]
        hs_type     <- map["hs_type"]
        in_date     <- map["in_date"]
        out_date    <- map["out_date"]
        is_new      <- map["is_new"]
    }
}

//MARK: IPO新股列表
class TushareProNewShareStocksClass: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var sub_code: String = NULL_DATA //申购代码
    @objc dynamic var name: String = NULL_DATA //名称
    @objc dynamic var ipo_date: String = NULL_DATA //上网发行日期
    @objc dynamic var issue_date: String = NULL_DATA //上市日期
    @objc dynamic var amount: String = NULL_DATA //发行总量（万股）
    @objc dynamic var market_amount: String = NULL_DATA //上网发行总量（万股）
    @objc dynamic var price: String = NULL_DATA //发行价格
    @objc dynamic var pe: String = NULL_DATA //市盈率
    @objc dynamic var limit_amount: String = NULL_DATA //个人申购上限（万股）
    @objc dynamic var funds: String = NULL_DATA //募集资金（亿元）
    @objc dynamic var ballot: String = NULL_DATA //中签率
    
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
        return ["ts_code", "sub_code", "name", "ipo_date", "issue_date"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code     <- map["ts_code"]
        sub_code    <- map["sub_code"]
        name        <- map["name"]
        ipo_date    <- map["ipo_date"]
        issue_date  <- map["issue_date"]
        amount      <- map["amount"]
        market_amount   <- map["market_amount"]
        price       <- map["price"]
        pe          <- map["pe"]
        limit_amount    <- map["limit_amount"]
        funds       <- map["funds"]
        ballot      <- map["ballot"]
    }
}


