//
//  TushareProStockMarketDataModel.swift
//  ChartDemo
//  TusharePro 行情数据
//  Created by Weibin Wu on 27/5/2019.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

//MARK: 日线/周线/月线 行情数据:
//以日期为主键值, 查询单个股票历史数据
class TushareProMarketDataClassOfDatePrimaryKey: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var marketDataType = NULL_DATA //行情数据类型, 用于区分: 日线/周线/月线
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
        return "trade_date"
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

//以股票代码为主键值, 查询所有股票单日数据
class TushareProMarketDataClassOfTs_codePrimaryKey: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var marketDataType = NULL_DATA //行情数据类型, 用于区分: 日线/周线/月线
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

//MARK: 复权因子
//以股票代码为主键值, 查询单个股票复权因子历史数据
class TushareProAdjustedFactorClassOfTs_codePrimaryKey: Object, Mappable {
    
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

//以日期为主键值, 查询当日所有股票复权因子
class TushareProAdjustedFactorClassOfDatePrimaryKey: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var trade_date: String = NULL_DATA //交易日期
    @objc dynamic var adj_factor: String = NULL_DATA //复权因子
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    //MARK: Realm 数据库配置
    
    //设置主键
    override class func primaryKey() -> String? {
        return "trade_date"
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

//MARK: 停复牌信息
class TushareProSuspendClass: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var suspend_date: String = NULL_DATA //停牌日期
    @objc dynamic var resume_date: String = NULL_DATA //复牌日期
    @objc dynamic var ann_date: String = NULL_DATA //公告日期
    @objc dynamic var suspend_reason: String = NULL_DATA //停牌原因
    @objc dynamic var reason_type: String = NULL_DATA //停牌原因类别
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    //MARK: Realm 数据库配置
    
    //设置主键
    override class func primaryKey() -> String? {
        return "suspend_date"
    }
    //设置索引
    override static func indexedProperties() -> [String] {
        return ["ts_code", "suspend_reason", "reason_type"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code         <- map["ts_code"]
        suspend_date    <- map["suspend_date"]
        resume_date     <- map["resume_date"]
        ann_date        <- map["ann_date"]
        suspend_reason  <- map["suspend_reason"]
        reason_type     <- map["reason_type"]
    }
}

//MARK: 每日指标
//以股票代码为主键值, 查询每日指标历史数据
class TushareProDailyIndicatorClassOfTs_codePrimaryKey: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var trade_date: String = NULL_DATA //交易日期
    @objc dynamic var close: String = NULL_DATA //当日收盘价
    @objc dynamic var turnover_rate: String = NULL_DATA //换手率（%）
    @objc dynamic var turnover_rate_f: String = NULL_DATA //换手率（自由流通股）
    @objc dynamic var volume_ratio: String = NULL_DATA //量比
    @objc dynamic var pe: String = NULL_DATA //市盈率（总市值/净利润）
    @objc dynamic var pe_ttm: String = NULL_DATA //市盈率（TTM）
    @objc dynamic var pb: String = NULL_DATA //市净率（总市值/净资产）
    @objc dynamic var ps: String = NULL_DATA //市销率
    @objc dynamic var ps_ttm: String = NULL_DATA //市销率（TTM）
    @objc dynamic var total_share: String = NULL_DATA //总股本（万股）
    @objc dynamic var float_share: String = NULL_DATA //流通股本 （万股）
    @objc dynamic var free_share: String = NULL_DATA //自由流通股本 （万）
    @objc dynamic var total_mv: String = NULL_DATA //总市值 （万元）
    @objc dynamic var circ_mv: String = NULL_DATA //流通市值（万元）
    
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
        return ["ts_code", "trade_date", "turnover_rate", "turnover_rate_f", "volume_ratio", "pe", "pe_ttm", "pb", "ps", "ps_ttm"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code     <- map["ts_code"]
        trade_date  <- map["trade_date"]
        close       <- map["close"]
        turnover_rate   <- map["turnover_rate"]
        turnover_rate_f <- map["turnover_rate_f"]
        volume_ratio    <- map["volume_ratio"]
        pe      <- map["pe"]
        pe_ttm  <- map["pe_ttm"]
        pb      <- map["pb"]
        ps      <- map["ps"]
        ps_ttm  <- map["ps_ttm"]
        total_share <- map["total_share"]
        float_share <- map["float_share"]
        free_share  <- map["free_share"]
        total_mv    <- map["total_mv"]
        circ_mv     <- map["circ_mv"]
    }
}

//以日期为主键值, 查询当日所有股票指标数据
class TushareProDailyIndicationClassOfDatePrimaryKey: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var trade_date: String = NULL_DATA //交易日期
    @objc dynamic var close: String = NULL_DATA //当日收盘价
    @objc dynamic var turnover_rate: String = NULL_DATA //换手率（%）
    @objc dynamic var turnover_rate_f: String = NULL_DATA //换手率（自由流通股）
    @objc dynamic var volume_ratio: String = NULL_DATA //量比
    @objc dynamic var pe: String = NULL_DATA //市盈率（总市值/净利润）
    @objc dynamic var pe_ttm: String = NULL_DATA //市盈率（TTM）
    @objc dynamic var pb: String = NULL_DATA //市净率（总市值/净资产）
    @objc dynamic var ps: String = NULL_DATA //市销率
    @objc dynamic var ps_ttm: String = NULL_DATA //市销率（TTM）
    @objc dynamic var total_share: String = NULL_DATA //总股本（万股）
    @objc dynamic var float_share: String = NULL_DATA //流通股本 （万股）
    @objc dynamic var free_share: String = NULL_DATA //自由流通股本 （万）
    @objc dynamic var total_mv: String = NULL_DATA //总市值 （万元）
    @objc dynamic var circ_mv: String = NULL_DATA //流通市值（万元）
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    //MARK: Realm 数据库配置
    
    //设置主键
    override class func primaryKey() -> String? {
        return "trade_date"
    }
    //设置索引
    override static func indexedProperties() -> [String] {
        return ["ts_code", "trade_date", "turnover_rate", "turnover_rate_f", "volume_ratio", "pe", "pe_ttm", "pb", "ps", "ps_ttm"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code     <- map["ts_code"]
        trade_date  <- map["trade_date"]
        close       <- map["close"]
        turnover_rate   <- map["turnover_rate"]
        turnover_rate_f <- map["turnover_rate_f"]
        volume_ratio    <- map["volume_ratio"]
        pe      <- map["pe"]
        pe_ttm  <- map["pe_ttm"]
        pb      <- map["pb"]
        ps      <- map["ps"]
        ps_ttm  <- map["ps_ttm"]
        total_share <- map["total_share"]
        float_share <- map["float_share"]
        free_share  <- map["free_share"]
        total_mv    <- map["total_mv"]
        circ_mv     <- map["circ_mv"]
    }
}

//MARK: 个股资金流向
//以日期为主键值, 查询单个股票的历史资金流向
class TushareProMoneyFlowClassOfDatePrimaryKey: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var trade_date: String = NULL_DATA //交易日期
    @objc dynamic var buy_sm_vol: String = NULL_DATA //小单买入量（手）
    @objc dynamic var buy_sm_amount: String = NULL_DATA //小单买入金额（万元
    @objc dynamic var sell_sm_vol: String = NULL_DATA //小单卖出量（手）
    @objc dynamic var sell_sm_amount: String = NULL_DATA //小单卖出金额（万元）
    @objc dynamic var buy_md_vol: String = NULL_DATA //中单买入量（手）
    @objc dynamic var buy_md_amount: String = NULL_DATA //中单买入金额（万元）
    @objc dynamic var sell_md_vol: String = NULL_DATA //中单卖出量（手）
    @objc dynamic var sell_md_amount: String = NULL_DATA //中单卖出金额（万元）
    @objc dynamic var buy_lg_vol: String = NULL_DATA //大单买入量（手）
    @objc dynamic var buy_lg_amount: String = NULL_DATA //大单买入金额（万元）
    @objc dynamic var sell_lg_vol: String = NULL_DATA //大单卖出量(手)
    @objc dynamic var sell_lg_amount: String = NULL_DATA //大单卖出金额（万元）
    @objc dynamic var buy_elg_vol: String = NULL_DATA //特大单买入量（手）
    @objc dynamic var buy_elg_amount: String = NULL_DATA //特大单买入金额（万元）
    @objc dynamic var sell_elg_vol: String = NULL_DATA //特大单卖出量（手）
    @objc dynamic var sell_elg_amount: String = NULL_DATA //特大单卖出金额（万元）
    @objc dynamic var net_mf_vol: String = NULL_DATA //净流入量（手）
    @objc dynamic var net_mf_amount: String = NULL_DATA //净流入额（万元）
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    //MARK: Realm 数据库配置
    
    //设置主键
    override class func primaryKey() -> String? {
        return "trade_date"
    }
    //设置索引
    override static func indexedProperties() -> [String] {
        return ["ts_code", "trade_date", "turnover_rate", "turnover_rate_f", "volume_ratio", "pe", "pe_ttm", "pb", "ps", "ps_ttm"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code     <- map["ts_code"]
        trade_date  <- map["trade_date"]
        buy_sm_vol      <- map["buy_sm_vol"]
        buy_sm_amount   <- map["buy_sm_amount"]
        sell_sm_vol     <- map["sell_sm_vol"]
        sell_sm_amount  <- map["sell_sm_amount"]
        buy_md_vol      <- map["buy_md_vol"]
        buy_md_amount   <- map["buy_md_amount"]
        sell_md_vol     <- map["sell_md_vol"]
        sell_md_amount  <- map["sell_md_amount"]
        buy_lg_vol      <- map["buy_lg_vol"]
        buy_lg_amount   <- map["buy_lg_amount"]
        sell_lg_vol     <- map["sell_lg_vol"]
        sell_lg_amount  <- map["sell_lg_amount"]
        buy_elg_vol     <- map["buy_elg_vol"]
        buy_elg_amount  <- map["buy_elg_amount"]
        sell_elg_vol    <- map["sell_elg_vol"]
        sell_elg_amount <- map["sell_elg_amount"]
        net_mf_vol      <- map["net_mf_vol"]
        net_mf_amount   <- map["net_mf_amount"]
    }
}
    
    //以股票代码为主键值, 查询当日所有股票的资金流向
class TushareProMoneyFlowClassOfTs_codePrimaryKey: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TusharePro股票代码 -- 这个值是唯一的, 可作为主键
    @objc dynamic var trade_date: String = NULL_DATA //交易日期
    @objc dynamic var buy_sm_vol: String = NULL_DATA //小单买入量（手）
    @objc dynamic var buy_sm_amount: String = NULL_DATA //小单买入金额（万元
    @objc dynamic var sell_sm_vol: String = NULL_DATA //小单卖出量（手）
    @objc dynamic var sell_sm_amount: String = NULL_DATA //小单卖出金额（万元）
    @objc dynamic var buy_md_vol: String = NULL_DATA //中单买入量（手）
    @objc dynamic var buy_md_amount: String = NULL_DATA //中单买入金额（万元）
    @objc dynamic var sell_md_vol: String = NULL_DATA //中单卖出量（手）
    @objc dynamic var sell_md_amount: String = NULL_DATA //中单卖出金额（万元）
    @objc dynamic var buy_lg_vol: String = NULL_DATA //大单买入量（手）
    @objc dynamic var buy_lg_amount: String = NULL_DATA //大单买入金额（万元）
    @objc dynamic var sell_lg_vol: String = NULL_DATA //大单卖出量(手)
    @objc dynamic var sell_lg_amount: String = NULL_DATA //大单卖出金额（万元）
    @objc dynamic var buy_elg_vol: String = NULL_DATA //特大单买入量（手）
    @objc dynamic var buy_elg_amount: String = NULL_DATA //特大单买入金额（万元）
    @objc dynamic var sell_elg_vol: String = NULL_DATA //特大单卖出量（手）
    @objc dynamic var sell_elg_amount: String = NULL_DATA //特大单卖出金额（万元）
    @objc dynamic var net_mf_vol: String = NULL_DATA //净流入量（手）
    @objc dynamic var net_mf_amount: String = NULL_DATA //净流入额（万元）
    
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
        return ["ts_code", "trade_date", "turnover_rate", "turnover_rate_f", "volume_ratio", "pe", "pe_ttm", "pb", "ps", "ps_ttm"]
    }
    
    //MARK:遵守 Mappable 协议
    func mapping(map: Map) {
        ts_code     <- map["ts_code"]
        trade_date  <- map["trade_date"]
        buy_sm_vol      <- map["buy_sm_vol"]
        buy_sm_amount   <- map["buy_sm_amount"]
        sell_sm_vol     <- map["sell_sm_vol"]
        sell_sm_amount  <- map["sell_sm_amount"]
        buy_md_vol      <- map["buy_md_vol"]
        buy_md_amount   <- map["buy_md_amount"]
        sell_md_vol     <- map["sell_md_vol"]
        sell_md_amount  <- map["sell_md_amount"]
        buy_lg_vol      <- map["buy_lg_vol"]
        buy_lg_amount   <- map["buy_lg_amount"]
        sell_lg_vol     <- map["sell_lg_vol"]
        sell_lg_amount  <- map["sell_lg_amount"]
        buy_elg_vol     <- map["buy_elg_vol"]
        buy_elg_amount  <- map["buy_elg_amount"]
        sell_elg_vol    <- map["sell_elg_vol"]
        sell_elg_amount <- map["sell_elg_amount"]
        net_mf_vol      <- map["net_mf_vol"]
        net_mf_amount   <- map["net_mf_amount"]
    }
    
}
