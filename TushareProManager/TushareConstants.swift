//
//  TushareFetcher.swift
//  ChartDemo
//
//  Created by caffe on 2019/5/21.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

import Foundation

// MARK: TusharePro 提供的功能接口
enum TushareProAPI {
    case TushareProStockList //股票列表数据
    case TushareProTradeCalendar //股票交易日历
    case TushareProStockCompany //上市公司信息列表
    case TushareProHistoryName //名称变更记录
    case TushareProConstituentStocksOfHS //沪深成分股数据
    case TushareProNewShareStocks //IPO新股列表
}

// MARK: 获取 TusharePro 数据的请求参数
class TushareProRequestData {
    
    // 接口名称
    var apiName: TushareProAPI!
    // 参数设置
    var api: String!
    var apiURL: URL!
    var fields: String!
    var params: Dictionary<String, Any>!
    // 处理事务
    var needSyncToDatabase: Bool!
}

