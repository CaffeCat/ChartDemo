//
//  TushareProFinancialDataModel.swift
//  ChartDemo
//
//  Created by Weibin Wu on 28/5/2019.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

//MARK: 利润表
class TushareProIncomeSheetClass: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TS代码
    @objc dynamic var ann_date: String = NULL_DATA //公告日期
    @objc dynamic var f_ann_date: String = NULL_DATA //实际公告日期
    @objc dynamic var end_date: String = NULL_DATA //报告期
//1合并报表 2单季合并 3调整单季合并表 4调整合并报表 5调整前合并报表 6母公司报表 7母公司单季表 8 母公司调整单季表 9母公司调整表 10母公司调整前报表 11调整前合并报表 12母公司调整前报表
    @objc dynamic var report_type: String = NULL_DATA //报告类型
    @objc dynamic var comp_type: String = NULL_DATA //公司类型(1一般工商业2银行3保险4证券)
    @objc dynamic var basic_eps: String = NULL_DATA //基本每股收益
    @objc dynamic var diluted_eps: String = NULL_DATA //稀释每股收益
    @objc dynamic var total_revenue: String = NULL_DATA //营业总收入
    @objc dynamic var revenue: String = NULL_DATA //营业收入
    @objc dynamic var int_income: String = NULL_DATA //利息收入
    @objc dynamic var prem_earned: String = NULL_DATA //已赚保费
    @objc dynamic var comm_income: String = NULL_DATA //手续费及佣金收入
    @objc dynamic var n_commis_income: String = NULL_DATA //手续费及佣金净收入
    @objc dynamic var n_oth_income: String = NULL_DATA //其他经营净收益
    @objc dynamic var n_oth_b_income: String = NULL_DATA //加:其他业务净收益
    @objc dynamic var prem_income: String = NULL_DATA //保险业务收入
    @objc dynamic var out_prem: String = NULL_DATA //减:分出保费
    @objc dynamic var une_prem_reser: String = NULL_DATA //提取未到期责任准备金
    @objc dynamic var reins_income: String = NULL_DATA //其中:分保费收入
    @objc dynamic var n_sec_tb_income: String = NULL_DATA //代理买卖证券业务净收入
    @objc dynamic var n_sec_uw_income: String = NULL_DATA //证券承销业务净收入
    @objc dynamic var n_asset_mg_income: String = NULL_DATA //受托客户资产管理业务净收入
    @objc dynamic var oth_b_income: String = NULL_DATA //其他业务收入
    @objc dynamic var fv_value_chg_gain: String = NULL_DATA //加:公允价值变动净收益
    @objc dynamic var invest_income: String = NULL_DATA //加:投资净收益
    @objc dynamic var ass_invest_income: String = NULL_DATA //其中:对联营企业和合营企业的投资收益
    @objc dynamic var forex_gain: String = NULL_DATA //加:汇兑净收益
    @objc dynamic var total_cogs: String = NULL_DATA //营业总成本
    @objc dynamic var oper_cost: String = NULL_DATA //减:营业成本
    @objc dynamic var int_exp: String = NULL_DATA //减:利息支出
    @objc dynamic var comm_exp: String = NULL_DATA //减:手续费及佣金支出
    @objc dynamic var biz_tax_surchg: String = NULL_DATA //减:营业税金及附加
    @objc dynamic var sell_exp: String = NULL_DATA //减:销售费用
    @objc dynamic var admin_exp: String = NULL_DATA //减:管理费用
    @objc dynamic var fin_exp: String = NULL_DATA //减:财务费用
    @objc dynamic var assets_impair_loss: String = NULL_DATA //减:资产减值损失
    @objc dynamic var prem_refund: String = NULL_DATA //退保金
    @objc dynamic var compens_payout: String = NULL_DATA //赔付总支出
    @objc dynamic var reser_insur_liab: String = NULL_DATA //提取保险责任准备金
    @objc dynamic var div_payt: String = NULL_DATA //保户红利支出
    @objc dynamic var reins_exp: String = NULL_DATA //分保费用
    @objc dynamic var oper_exp: String = NULL_DATA //营业支出
    @objc dynamic var compens_payout_refu: String = NULL_DATA //减:摊回赔付支出
    @objc dynamic var insur_reser_refu: String = NULL_DATA //减:摊回保险责任准备金
    @objc dynamic var reins_cost_refund: String = NULL_DATA //减:摊回分保费用
    @objc dynamic var other_bus_cost: String = NULL_DATA //其他业务成本
    @objc dynamic var operate_profit: String = NULL_DATA //营业利润
    @objc dynamic var non_oper_income: String = NULL_DATA //加:营业外收入
    @objc dynamic var non_oper_exp: String = NULL_DATA //减:营业外支出
    @objc dynamic var nca_disploss: String = NULL_DATA //其中:减:非流动资产处置净损失
    @objc dynamic var total_profit: String = NULL_DATA //利润总额
    @objc dynamic var income_tax: String = NULL_DATA //所得税费用
    @objc dynamic var n_income: String = NULL_DATA //净利润(含少数股东损益)
    @objc dynamic var n_income_attr_p: String = NULL_DATA //净利润(不含少数股东损益)
    @objc dynamic var minority_gain: String = NULL_DATA //少数股东损益
    @objc dynamic var oth_compr_income: String = NULL_DATA //其他综合收益
    @objc dynamic var t_compr_income: String = NULL_DATA //综合收益总额
    @objc dynamic var compr_inc_attr_p: String = NULL_DATA //归属于母公司(或股东)的综合收益总额
    @objc dynamic var compr_inc_attr_m_s: String = NULL_DATA //归属于少数股东的综合收益总额
    @objc dynamic var ebit: String = NULL_DATA //息税前利润
    @objc dynamic var ebitda: String = NULL_DATA //息税折旧摊销前利润
    @objc dynamic var insurance_exp: String = NULL_DATA //保险业务支出
    @objc dynamic var undist_profit: String = NULL_DATA //年初未分配利润
    @objc dynamic var distable_profit: String = NULL_DATA //可分配利润
    @objc dynamic var update_flag: String = NULL_DATA //更新标识
    
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
        ann_date    <- map["ann_date"]
        f_ann_date  <- map["f_ann_date"]
        end_date    <- map["end_date"]
        report_type <- map["report_type"]
        comp_type   <- map["comp_type"]
        basic_eps   <- map["basic_eps"]
        diluted_eps <- map["diluted_eps"]
        total_revenue   <- map["total_revenue"]
        revenue     <- map["revenue"]
        int_income  <- map["int_income"]
        prem_earned <- map["prem_earned"]
        comm_income <- map["comm_income"]
        n_commis_income <- map["n_commis_income"]
        n_oth_income    <- map["n_oth_income"]
        n_oth_b_income  <- map["n_oth_b_income"]
        prem_income     <- map["prem_income"]
        out_prem        <- map["out_prem"]
        une_prem_reser  <- map["une_prem_reser"]
        reins_income    <- map["reins_income"]
        n_sec_tb_income <- map["n_sec_tb_income"]
        n_sec_uw_income <- map["n_sec_uw_income"]
        n_asset_mg_income   <- map["n_asset_mg_income"]
        oth_b_income        <- map["oth_b_income"]
        fv_value_chg_gain   <- map["fv_value_chg_gain"]
        invest_income       <- map["invest_income"]
        ass_invest_income   <- map["ass_invest_income"]
        forex_gain  <- map["forex_gain"]
        total_cogs  <- map["total_cogs"]
        oper_cost   <- map["oper_cost"]
        int_exp     <- map["int_exp"]
        comm_exp    <- map["comm_exp"]
        biz_tax_surchg  <- map["biz_tax_surchg"]
        sell_exp    <- map["sell_exp"]
        admin_exp   <- map["admin_exp"]
        fin_exp     <- map["fin_exp"]
        assets_impair_loss  <- map["assets_impair_loss"]
        prem_refund     <- map["prem_refund"]
        compens_payout  <- map["compens_payout"]
        reser_insur_liab    <- map["reser_insur_liab"]
        div_payt    <- map["div_payt"]
        reins_exp   <- map["reins_exp"]
        oper_exp    <- map["oper_exp"]
        compens_payout_refu <- map["compens_payout_refu"]
        insur_reser_refu    <- map["insur_reser_refu"]
        reins_cost_refund   <- map["reins_cost_refund"]
        other_bus_cost      <- map["other_bus_cost"]
        operate_profit      <- map["operate_profit"]
        non_oper_income     <- map["non_oper_income"]
        non_oper_exp        <- map["non_oper_exp"]
        nca_disploss        <- map["nca_disploss"]
        total_profit        <- map["total_profit"]
        income_tax          <- map["income_tax"]
        n_income            <- map["n_income"]
        n_income_attr_p     <- map["n_income_attr_p"]
        minority_gain       <- map["minority_gain"]
        oth_compr_income    <- map["oth_compr_income"]
        t_compr_income      <- map["t_compr_income"]
        compr_inc_attr_p    <- map["compr_inc_attr_p"]
        compr_inc_attr_m_s  <- map["compr_inc_attr_m_s"]
        ebit            <- map["ebit"]
        ebitda          <- map["ebitda"]
        insurance_exp   <- map["insurance_exp"]
        undist_profit   <- map["undist_profit"]
        distable_profit <- map["distable_profit"]
        update_flag     <- map["update_flag"]
    }
}

//MARK: 资产负债表
class TushareProBalanceSheetClass: Object, Mappable {
    
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
    }
}

//MARK: 现金流量表
class TushareProCashFlowSheetClass: Object, Mappable {
    
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
    }
}
