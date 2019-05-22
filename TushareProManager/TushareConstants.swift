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
}

// MARK: 获取 TusharePro 数据的请求参数
class TushareProRequestData {
    var api: TushareProAPI!
    var params: Dictionary<String, Any>!
    var needSyncToDatabase: Bool!
}

