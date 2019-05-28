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
    
    @objc dynamic var ts_code: String = NULL_DATA //TS股票代码
    @objc dynamic var ann_date: String = NULL_DATA //公告日期
    @objc dynamic var f_ann_date: String = NULL_DATA //实际公告日期
    @objc dynamic var end_date: String = NULL_DATA //报告期
    @objc dynamic var report_type: String = NULL_DATA //报表类型
    @objc dynamic var comp_type: String = NULL_DATA //公司类型
    @objc dynamic var total_share: String = NULL_DATA //期末总股本
    @objc dynamic var cap_rese: String = NULL_DATA //资本公积金
    @objc dynamic var undistr_porfit: String = NULL_DATA //未分配利润
    @objc dynamic var surplus_rese: String = NULL_DATA //盈余公积金
    @objc dynamic var special_rese: String = NULL_DATA //专项储备
    @objc dynamic var money_cap: String = NULL_DATA //货币资金
    @objc dynamic var trad_asset: String = NULL_DATA //交易性金融资产
    @objc dynamic var notes_receiv: String = NULL_DATA //应收票据
    @objc dynamic var accounts_receiv: String = NULL_DATA //应收账款
    @objc dynamic var oth_receiv: String = NULL_DATA //其他应收款
    @objc dynamic var prepayment: String = NULL_DATA //预付款项
    @objc dynamic var div_receiv: String = NULL_DATA //应收股利
    @objc dynamic var int_receiv: String = NULL_DATA //应收利息
    @objc dynamic var inventories: String = NULL_DATA //存货
    @objc dynamic var amor_exp: String = NULL_DATA //长期待摊费用
    @objc dynamic var nca_within_1y: String = NULL_DATA //一年内到期的非流动资产
    @objc dynamic var sett_rsrv: String = NULL_DATA //结算备付金
    @objc dynamic var loanto_oth_bank_fi: String = NULL_DATA //拆出资金
    @objc dynamic var premium_receiv: String = NULL_DATA //应收保费
    @objc dynamic var reinsur_receiv: String = NULL_DATA //应收分保账款
    @objc dynamic var reinsur_res_receiv: String = NULL_DATA //应收分保合同准备金
    @objc dynamic var pur_resale_fa: String = NULL_DATA //买入返售金融资产
    @objc dynamic var oth_cur_assets: String = NULL_DATA //其他流动资产
    @objc dynamic var total_cur_assets: String = NULL_DATA //流动资产合计
    @objc dynamic var fa_avail_for_sale: String = NULL_DATA //可供出售金融资产
    @objc dynamic var htm_invest: String = NULL_DATA //持有至到期投资
    @objc dynamic var lt_eqt_invest: String = NULL_DATA //长期股权投资
    @objc dynamic var invest_real_estate: String = NULL_DATA //投资性房地产
    @objc dynamic var time_deposits: String = NULL_DATA //定期存款
    @objc dynamic var oth_assets: String = NULL_DATA //其他资产
    @objc dynamic var lt_rec: String = NULL_DATA //长期应收款
    @objc dynamic var fix_assets: String = NULL_DATA //固定资产
    @objc dynamic var cip: String = NULL_DATA //在建工程
    @objc dynamic var const_materials: String = NULL_DATA //工程物资
    @objc dynamic var fixed_assets_disp: String = NULL_DATA //固定资产清理
    @objc dynamic var produc_bio_assets: String = NULL_DATA //生产性生物资产
    @objc dynamic var oil_and_gas_assets: String = NULL_DATA //油气资产
    @objc dynamic var intan_assets: String = NULL_DATA //无形资产
    @objc dynamic var r_and_d: String = NULL_DATA //研发支出
    @objc dynamic var goodwill: String = NULL_DATA //商誉
    @objc dynamic var lt_amor_exp: String = NULL_DATA //长期待摊费用
    @objc dynamic var defer_tax_assets: String = NULL_DATA //递延所得税资产
    @objc dynamic var decr_in_disbur: String = NULL_DATA //发放贷款及垫款
    @objc dynamic var oth_nca: String = NULL_DATA //其他非流动资产
    @objc dynamic var total_nca: String = NULL_DATA //非流动资产合计
    @objc dynamic var cash_reser_cb: String = NULL_DATA //现金及存放中央银行款项
    @objc dynamic var depos_in_oth_bfi: String = NULL_DATA //存放同业和其它金融机构款项
    @objc dynamic var prec_metals: String = NULL_DATA //贵金属
    @objc dynamic var deriv_assets: String = NULL_DATA //衍生金融资产
    @objc dynamic var rr_reins_une_prem: String = NULL_DATA //应收分保未到期责任准备金
    @objc dynamic var rr_reins_outstd_cla: String = NULL_DATA //应收分保未决赔款准备金
    @objc dynamic var rr_reins_lins_liab: String = NULL_DATA //应收分保寿险责任准备金
    @objc dynamic var rr_reins_lthins_liab: String = NULL_DATA //应收分保长期健康险责任准备金
    @objc dynamic var refund_depos: String = NULL_DATA //存出保证金
    @objc dynamic var ph_pledge_loans: String = NULL_DATA //保户质押贷款
    @objc dynamic var refund_cap_depos: String = NULL_DATA //存出资本保证金
    @objc dynamic var indep_acct_assets: String = NULL_DATA //独立账户资产
    @objc dynamic var client_depos: String = NULL_DATA //其中：客户资金存款
    @objc dynamic var client_prov: String = NULL_DATA //其中：客户备付金
    @objc dynamic var transac_seat_fee: String = NULL_DATA //其中:交易席位费
    @objc dynamic var invest_as_receiv: String = NULL_DATA //应收款项类投资
    @objc dynamic var total_assets: String = NULL_DATA //资产总计
    @objc dynamic var lt_borr: String = NULL_DATA //长期借款
    @objc dynamic var st_borr: String = NULL_DATA //短期借款
    @objc dynamic var cb_borr: String = NULL_DATA //向中央银行借款
    @objc dynamic var depos_ib_deposits: String = NULL_DATA //吸收存款及同业存放
    @objc dynamic var loan_oth_bank: String = NULL_DATA //拆入资金
    @objc dynamic var trading_fl: String = NULL_DATA //交易性金融负债
    @objc dynamic var notes_payable: String = NULL_DATA //应付票据
    @objc dynamic var acct_payable: String = NULL_DATA //应付账款
    @objc dynamic var adv_receipts: String = NULL_DATA //预收款项
    @objc dynamic var sold_for_repur_fa: String = NULL_DATA //卖出回购金融资产款
    @objc dynamic var comm_payable: String = NULL_DATA //应付手续费及佣金
    @objc dynamic var payroll_payable: String = NULL_DATA //应付职工薪酬
    @objc dynamic var taxes_payable: String = NULL_DATA //应交税费
    @objc dynamic var int_payable: String = NULL_DATA //应付利息
    @objc dynamic var div_payable: String = NULL_DATA //应付股利
    @objc dynamic var oth_payable: String = NULL_DATA //其他应付款
    @objc dynamic var acc_exp: String = NULL_DATA //预提费用
    @objc dynamic var deferred_inc: String = NULL_DATA //递延收益
    @objc dynamic var st_bonds_payable: String = NULL_DATA //应付短期债券
    @objc dynamic var payable_to_reinsurer: String = NULL_DATA //应付分保账款
    @objc dynamic var rsrv_insur_cont: String = NULL_DATA //保险合同准备金
    @objc dynamic var acting_trading_sec: String = NULL_DATA //代理买卖证券款
    @objc dynamic var acting_uw_sec: String = NULL_DATA //代理承销证券款
    @objc dynamic var non_cur_liab_due_1y: String = NULL_DATA //一年内到期的非流动负债
    @objc dynamic var oth_cur_liab: String = NULL_DATA //其他流动负债
    @objc dynamic var total_cur_liab: String = NULL_DATA //流动负债合计
    @objc dynamic var bond_payable: String = NULL_DATA //应付债券
    @objc dynamic var lt_payable: String = NULL_DATA //长期应付款
    @objc dynamic var specific_payables: String = NULL_DATA //专项应付款
    @objc dynamic var estimated_liab: String = NULL_DATA //预计负债
    @objc dynamic var defer_tax_liab: String = NULL_DATA //递延所得税负债
    @objc dynamic var defer_inc_non_cur_liab: String = NULL_DATA //递延收益-非流动负债
    @objc dynamic var oth_ncl: String = NULL_DATA //其他非流动负债
    @objc dynamic var total_ncl: String = NULL_DATA //非流动负债合计
    @objc dynamic var depos_oth_bfi: String = NULL_DATA //同业和其它金融机构存放款项
    @objc dynamic var deriv_liab: String = NULL_DATA //衍生金融负债
    @objc dynamic var depos: String = NULL_DATA //吸收存款
    @objc dynamic var agency_bus_liab: String = NULL_DATA //代理业务负债
    @objc dynamic var oth_liab: String = NULL_DATA //其他负债
    @objc dynamic var prem_receiv_adva: String = NULL_DATA //预收保费
    @objc dynamic var depos_received: String = NULL_DATA //存入保证金
    @objc dynamic var ph_invest: String = NULL_DATA //保户储金及投资款
    @objc dynamic var reser_une_prem: String = NULL_DATA //未到期责任准备金
    @objc dynamic var reser_outstd_claims: String = NULL_DATA //未决赔款准备金
    @objc dynamic var reser_lins_liab: String = NULL_DATA //寿险责任准备金
    @objc dynamic var reser_lthins_liab: String = NULL_DATA //长期健康险责任准备金
    @objc dynamic var indept_acc_liab: String = NULL_DATA //独立账户负债
    @objc dynamic var pledge_borr: String = NULL_DATA //其中:质押借款
    @objc dynamic var indem_payable: String = NULL_DATA //应付赔付款
    @objc dynamic var policy_div_payable: String = NULL_DATA //应付保单红利
    @objc dynamic var total_liab: String = NULL_DATA //负债合计
    @objc dynamic var treasury_share: String = NULL_DATA //减:库存股
    @objc dynamic var ordin_risk_reser: String = NULL_DATA //一般风险准备
    @objc dynamic var forex_differ: String = NULL_DATA //外币报表折算差额
    @objc dynamic var invest_loss_unconf: String = NULL_DATA //未确认的投资损失
    @objc dynamic var minority_int: String = NULL_DATA //少数股东权益
    @objc dynamic var total_hldr_eqy_exc_min_int: String = NULL_DATA //股东权益合计(不含少数股东权益)
    @objc dynamic var total_hldr_eqy_inc_min_int: String = NULL_DATA //股东权益合计(含少数股东权益)
    @objc dynamic var total_liab_hldr_eqy: String = NULL_DATA //负债及股东权益总计
    @objc dynamic var lt_payroll_payable: String = NULL_DATA //长期应付职工薪酬
    @objc dynamic var oth_comp_income: String = NULL_DATA //其他综合收益
    @objc dynamic var oth_eqt_tools: String = NULL_DATA //其他权益工具
    @objc dynamic var oth_eqt_tools_p_shr: String = NULL_DATA //其他权益工具(优先股)
    @objc dynamic var lending_funds: String = NULL_DATA //融出资金
    @objc dynamic var acc_receivable: String = NULL_DATA //应收款项
    @objc dynamic var st_fin_payable: String = NULL_DATA //应付短期融资款
    @objc dynamic var payables: String = NULL_DATA //应付款项
    @objc dynamic var hfs_assets: String = NULL_DATA //持有待售的资产
    @objc dynamic var hfs_sales: String = NULL_DATA //持有待售的负债
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
        ts_code         <- map["ts_code"]
        ann_date        <- map["ann_date"]
        f_ann_date      <- map["f_ann_date"]
        end_date        <- map["end_date"]
        report_type     <- map["report_type"]
        comp_type       <- map["comp_type"]
        total_share     <- map["total_share"]
        cap_rese        <- map["cap_rese"]
        undistr_porfit  <- map["undistr_porfit"]
        surplus_rese    <- map["surplus_rese"]
        special_rese    <- map["special_rese"]
        money_cap       <- map["money_cap"]
        trad_asset      <- map["trad_asset"]
        notes_receiv    <- map["notes_receiv"]
        accounts_receiv <- map["accounts_receiv"]
        oth_receiv      <- map["oth_receiv"]
        prepayment      <- map["prepayment"]
        div_receiv      <- map["div_receiv"]
        int_receiv      <- map["int_receiv"]
        inventories     <- map["inventories"]
        amor_exp        <- map["amor_exp"]
        nca_within_1y   <- map["nca_within_1y"]
        sett_rsrv       <- map["sett_rsrv"]
        loanto_oth_bank_fi <- map["loanto_oth_bank_fi"]
        premium_receiv     <- map["premium_receiv"]
        reinsur_receiv     <- map["reinsur_receiv"]
        reinsur_res_receiv <- map["reinsur_res_receiv"]
        pur_resale_fa      <- map["pur_resale_fa"]
        oth_cur_assets     <- map["oth_cur_assets"]
        total_cur_assets   <- map["total_cur_assets"]
        fa_avail_for_sale  <- map["fa_avail_for_sale"]
        htm_invest         <- map["htm_invest"]
        lt_eqt_invest      <- map["lt_eqt_invest"]
        invest_real_estate <- map["invest_real_estate"]
        time_deposits      <- map["time_deposits"]
        oth_assets          <- map["oth_assets"]
        lt_rec              <- map["lt_rec"]
        fix_assets          <- map["fix_assets"]
        cip                 <- map["cip"]
        const_materials     <- map["const_materials"]
        fixed_assets_disp   <- map["fixed_assets_disp"]
        produc_bio_assets   <- map["produc_bio_assets"]
        oil_and_gas_assets  <- map["oil_and_gas_assets"]
        intan_assets        <- map["intan_assets"]
        r_and_d         <- map["r_and_d"]
        goodwill        <- map["goodwill"]
        lt_amor_exp     <- map["lt_amor_exp"]
        defer_tax_assets    <- map["defer_tax_assets"]
        decr_in_disbur      <- map["decr_in_disbur"]
        oth_nca             <- map["oth_nca"]
        total_nca           <- map["total_nca"]
        cash_reser_cb       <- map["cash_reser_cb"]
        depos_in_oth_bfi    <- map["depos_in_oth_bfi"]
        prec_metals         <- map["prec_metals"]
        deriv_assets        <- map["deriv_assets"]
        rr_reins_une_prem   <- map["rr_reins_une_prem"]
        rr_reins_outstd_cla <- map["rr_reins_outstd_cla"]
        rr_reins_lins_liab  <- map["rr_reins_lins_liab"]
        rr_reins_lthins_liab    <- map["rr_reins_lthins_liab"]
        refund_depos            <- map["refund_depos"]
        ph_pledge_loans         <- map["ph_pledge_loans"]
        refund_cap_depos        <- map["refund_cap_depos"]
        indep_acct_assets       <- map["indep_acct_assets"]
        client_depos        <- map["client_depos"]
        client_prov         <- map["client_prov"]
        transac_seat_fee    <- map["transac_seat_fee"]
        invest_as_receiv    <- map["invest_as_receiv"]
        total_assets        <- map["total_assets"]
        lt_borr             <- map["lt_borr"]
        st_borr             <- map["st_borr"]
        cb_borr             <- map["cb_borr"]
        depos_ib_deposits   <- map["depos_ib_deposits"]
        loan_oth_bank       <- map["loan_oth_bank"]
        trading_fl          <- map["trading_fl"]
        notes_payable       <- map["notes_payable"]
        acct_payable        <- map["acct_payable"]
        adv_receipts        <- map["adv_receipts"]
        sold_for_repur_fa   <- map["sold_for_repur_fa"]
        comm_payable        <- map["comm_payable"]
        payroll_payable     <- map["payroll_payable"]
        taxes_payable       <- map["taxes_payable"]
        int_payable         <- map["int_payable"]
        div_payable         <- map["div_payable"]
        oth_payable         <- map["oth_payable"]
        acc_exp             <- map["acc_exp"]
        deferred_inc        <- map["deferred_inc"]
        st_bonds_payable    <- map["st_bonds_payable"]
        payable_to_reinsurer    <- map["payable_to_reinsurer"]
        rsrv_insur_cont         <- map["rsrv_insur_cont"]
        acting_trading_sec      <- map["acting_trading_sec"]
        acting_uw_sec           <- map["acting_uw_sec"]
        non_cur_liab_due_1y     <- map["non_cur_liab_due_1y"]
        oth_cur_liab        <- map["oth_cur_liab"]
        total_cur_liab      <- map["total_cur_liab"]
        bond_payable        <- map["bond_payable"]
        lt_payable          <- map["lt_payable"]
        specific_payables   <- map["specific_payables"]
        estimated_liab      <- map["estimated_liab"]
        defer_tax_liab      <- map["defer_tax_liab"]
        defer_inc_non_cur_liab  <- map["defer_inc_non_cur_liab"]
        oth_ncl         <- map["oth_ncl"]
        total_ncl       <- map["total_ncl"]
        depos_oth_bfi   <- map["depos_oth_bfi"]
        deriv_liab      <- map["deriv_liab"]
        depos           <- map["depos"]
        agency_bus_liab <- map["agency_bus_liab"]
        oth_liab        <- map["oth_liab"]
        prem_receiv_adva    <- map["prem_receiv_adva"]
        depos_received      <- map["depos_received"]
        ph_invest           <- map["ph_invest"]
        reser_une_prem      <- map["reser_une_prem"]
        reser_outstd_claims <- map["reser_outstd_claims"]
        reser_lins_liab     <- map["reser_lins_liab"]
        reser_lthins_liab   <- map["reser_lthins_liab"]
        indept_acc_liab     <- map["indept_acc_liab"]
        pledge_borr         <- map["pledge_borr"]
        indem_payable       <- map["indem_payable"]
        policy_div_payable  <- map["policy_div_payable"]
        total_liab          <- map["total_liab"]
        treasury_share      <- map["treasury_share"]
        ordin_risk_reser    <- map["ordin_risk_reser"]
        forex_differ        <- map["forex_differ"]
        invest_loss_unconf  <- map["invest_loss_unconf"]
        minority_int        <- map["minority_int"]
        total_hldr_eqy_exc_min_int     <- map["total_hldr_eqy_exc_min_int"]
        total_hldr_eqy_inc_min_int     <- map["total_hldr_eqy_inc_min_int"]
        total_liab_hldr_eqy     <- map["total_liab_hldr_eqy"]
        lt_payroll_payable      <- map["lt_payroll_payable"]
        oth_comp_income         <- map["oth_comp_income"]
        oth_eqt_tools           <- map["oth_eqt_tools"]
        oth_eqt_tools_p_shr     <- map["oth_eqt_tools_p_shr"]
        lending_funds       <- map["lending_funds"]
        acc_receivable      <- map["acc_receivable"]
        st_fin_payable      <- map["st_fin_payable"]
        payables        <- map["payables"]
        hfs_assets      <- map["hfs_assets"]
        hfs_sales       <- map["hfs_sales"]
        update_flag     <- map["update_flag"]
    }
}

//MARK: 现金流量表
class TushareProCashFlowSheetClass: Object, Mappable {
    
    @objc dynamic var ts_code: String = NULL_DATA //TS股票代码
    @objc dynamic var ann_date: String = NULL_DATA //公告日期
    @objc dynamic var f_ann_date: String = NULL_DATA //实际公告日期
    @objc dynamic var end_date: String = NULL_DATA //报告期
    @objc dynamic var comp_type: String = NULL_DATA //报表类型
    @objc dynamic var report_type: String = NULL_DATA //公司类型
    @objc dynamic var net_profit: String = NULL_DATA //净利润
    @objc dynamic var finan_exp: String = NULL_DATA //财务费用
    @objc dynamic var c_fr_sale_sg: String = NULL_DATA //销售商品、提供劳务收到的现金
    @objc dynamic var recp_tax_rends: String = NULL_DATA //收到的税费返还
    @objc dynamic var n_depos_incr_fi: String = NULL_DATA //客户存款和同业存放款项净增加额
    @objc dynamic var n_incr_loans_cb: String = NULL_DATA //向中央银行借款净增加额
    @objc dynamic var n_inc_borr_oth_fi: String = NULL_DATA //向其他金融机构拆入资金净增加额
    @objc dynamic var prem_fr_orig_contr: String = NULL_DATA //收到原保险合同保费取得的现金
    @objc dynamic var n_incr_insured_dep: String = NULL_DATA //保户储金净增加额
    @objc dynamic var n_reinsur_prem: String = NULL_DATA //收到再保业务现金净额
    @objc dynamic var n_incr_disp_tfa: String = NULL_DATA //处置交易性金融资产净增加额
    @objc dynamic var ifc_cash_incr: String = NULL_DATA //收取利息和手续费净增加额
    @objc dynamic var n_incr_disp_faas: String = NULL_DATA //处置可供出售金融资产净增加额
    @objc dynamic var n_incr_loans_oth_bank: String = NULL_DATA //拆入资金净增加额
    @objc dynamic var n_cap_incr_repur: String = NULL_DATA //回购业务资金净增加额
    @objc dynamic var c_fr_oth_operate_a: String = NULL_DATA //收到其他与经营活动有关的现金
    @objc dynamic var c_inf_fr_operate_a: String = NULL_DATA //经营活动现金流入小计
    @objc dynamic var c_paid_goods_s: String = NULL_DATA //购买商品、接受劳务支付的现金
    @objc dynamic var c_paid_to_for_empl: String = NULL_DATA //支付给职工以及为职工支付的现金
    @objc dynamic var c_paid_for_taxes: String = NULL_DATA //支付的各项税费
    @objc dynamic var n_incr_clt_loan_adv: String = NULL_DATA //客户贷款及垫款净增加额
    @objc dynamic var n_incr_dep_cbob: String = NULL_DATA //存放央行和同业款项净增加额
    @objc dynamic var c_pay_claims_orig_inco: String = NULL_DATA //支付原保险合同赔付款项的现金
    @objc dynamic var pay_handling_chrg: String = NULL_DATA //支付手续费的现金
    @objc dynamic var pay_comm_insur_plcy: String = NULL_DATA //支付保单红利的现金
    @objc dynamic var oth_cash_pay_oper_act: String = NULL_DATA //支付其他与经营活动有关的现金
    @objc dynamic var st_cash_out_act: String = NULL_DATA //经营活动现金流出小计
    @objc dynamic var n_cashflow_act: String = NULL_DATA //经营活动产生的现金流量净额
    @objc dynamic var oth_recp_ral_inv_act: String = NULL_DATA //收到其他与投资活动有关的现金
    @objc dynamic var c_disp_withdrwl_invest: String = NULL_DATA //收回投资收到的现金
    @objc dynamic var c_recp_return_invest: String = NULL_DATA //取得投资收益收到的现金
    @objc dynamic var n_recp_disp_fiolta: String = NULL_DATA //处置固定资产、无形资产和其他长期资产收回的现金净额
    @objc dynamic var n_recp_disp_sobu: String = NULL_DATA //处置子公司及其他营业单位收到的现金净额
    @objc dynamic var stot_inflows_inv_act: String = NULL_DATA //投资活动现金流入小计
    @objc dynamic var c_pay_acq_const_fiolta: String = NULL_DATA //购建固定资产、无形资产和其他长期资产支付的现金
    @objc dynamic var c_paid_invest: String = NULL_DATA //投资支付的现金
    @objc dynamic var n_disp_subs_oth_biz: String = NULL_DATA //取得子公司及其他营业单位支付的现金净额
    @objc dynamic var oth_pay_ral_inv_act: String = NULL_DATA //支付其他与投资活动有关的现金
    @objc dynamic var n_incr_pledge_loan: String = NULL_DATA //质押贷款净增加额
    @objc dynamic var stot_out_inv_act: String = NULL_DATA //投资活动现金流出小计
    @objc dynamic var n_cashflow_inv_act: String = NULL_DATA //投资活动产生的现金流量净额
    @objc dynamic var c_recp_borrow: String = NULL_DATA //取得借款收到的现金
    @objc dynamic var proc_issue_bonds: String = NULL_DATA //发行债券收到的现金
    @objc dynamic var oth_cash_recp_ral_fnc_act: String = NULL_DATA //收到其他与筹资活动有关的现金
    @objc dynamic var stot_cash_in_fnc_act: String = NULL_DATA //筹资活动现金流入小计
    @objc dynamic var free_cashflow: String = NULL_DATA //企业自由现金流量
    @objc dynamic var c_prepay_amt_borr: String = NULL_DATA //偿还债务支付的现金
    @objc dynamic var c_pay_dist_dpcp_int_exp: String = NULL_DATA //分配股利、利润或偿付利息支付的现金
    @objc dynamic var incl_dvd_profit_paid_sc_ms: String = NULL_DATA //其中:子公司支付给少数股东的股利、利润
    @objc dynamic var oth_cashpay_ral_fnc_act: String = NULL_DATA //支付其他与筹资活动有关的现金
    @objc dynamic var stot_cashout_fnc_act: String = NULL_DATA //筹资活动现金流出小计
    @objc dynamic var n_cash_flows_fnc_act: String = NULL_DATA //筹资活动产生的现金流量净额
    @objc dynamic var eff_fx_flu_cash: String = NULL_DATA //汇率变动对现金的影响
    @objc dynamic var n_incr_cash_cash_equ: String = NULL_DATA //现金及现金等价物净增加额
    @objc dynamic var c_cash_equ_beg_period: String = NULL_DATA //期初现金及现金等价物余额
    @objc dynamic var c_cash_equ_end_period: String = NULL_DATA //期末现金及现金等价物余额
    @objc dynamic var c_recp_cap_contrib: String = NULL_DATA //吸收投资收到的现金
    @objc dynamic var incl_cash_rec_saims: String = NULL_DATA //其中:子公司吸收少数股东投资收到的现金
    @objc dynamic var uncon_invest_loss: String = NULL_DATA //未确认投资损失
    @objc dynamic var prov_depr_assets: String = NULL_DATA //加:资产减值准备
    @objc dynamic var depr_fa_coga_dpba: String = NULL_DATA //固定资产折旧、油气资产折耗、生产性生物资产折旧
    @objc dynamic var amort_intang_assets: String = NULL_DATA //无形资产摊销
    @objc dynamic var lt_amort_deferred_exp: String = NULL_DATA //长期待摊费用摊销
    @objc dynamic var decr_deferred_exp: String = NULL_DATA //待摊费用减少
    @objc dynamic var incr_acc_exp: String = NULL_DATA //预提费用增加
    @objc dynamic var loss_disp_fiolta: String = NULL_DATA //处置固定、无形资产和其他长期资产的损失
    @objc dynamic var loss_scr_fa: String = NULL_DATA //固定资产报废损失
    @objc dynamic var loss_fv_chg: String = NULL_DATA //公允价值变动损失
    @objc dynamic var invest_loss: String = NULL_DATA //投资损失
    @objc dynamic var decr_def_inc_tax_assets: String = NULL_DATA //递延所得税资产减少
    @objc dynamic var incr_def_inc_tax_liab: String = NULL_DATA //递延所得税负债增加
    @objc dynamic var decr_inventories: String = NULL_DATA //存货的减少
    @objc dynamic var decr_oper_payable: String = NULL_DATA //经营性应收项目的减少
    @objc dynamic var incr_oper_payable: String = NULL_DATA //经营性应付项目的增加
    @objc dynamic var others: String = NULL_DATA //其他
    @objc dynamic var im_net_cashflow_oper_act: String = NULL_DATA //经营活动产生的现金流量净额(间接法)
    @objc dynamic var conv_debt_into_cap: String = NULL_DATA //债务转为资本
    @objc dynamic var conv_copbonds_due_within_1y: String = NULL_DATA //一年内到期的可转换公司债券
    @objc dynamic var fa_fnc_leases: String = NULL_DATA //融资租入固定资产
    @objc dynamic var end_bal_cash: String = NULL_DATA //现金的期末余额
    @objc dynamic var beg_bal_cash: String = NULL_DATA //减:现金的期初余额
    @objc dynamic var end_bal_cash_equ: String = NULL_DATA //加:现金等价物的期末余额
    @objc dynamic var beg_bal_cash_equ: String = NULL_DATA //减:现金等价物的期初余额
    @objc dynamic var im_n_incr_cash_equ: String = NULL_DATA //现金及现金等价物净增加额(间接法)
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
        comp_type   <- map["comp_type"]
        report_type <- map["report_type"]
        net_profit  <- map["net_profit"]
        finan_exp   <- map["finan_exp"]
        c_fr_sale_sg  <- map["c_fr_sale_sg"]
        recp_tax_rends    <- map["recp_tax_rends"]
        n_depos_incr_fi   <- map["n_depos_incr_fi"]
        n_incr_loans_cb   <- map["n_incr_loans_cb"]
        n_inc_borr_oth_fi <- map["n_inc_borr_oth_fi"]
        prem_fr_orig_contr  <- map["prem_fr_orig_contr"]
        n_incr_insured_dep  <- map["n_incr_insured_dep"]
        n_reinsur_prem      <- map["n_reinsur_prem"]
        n_incr_disp_tfa     <- map["n_incr_disp_tfa"]
        ifc_cash_incr       <- map["ifc_cash_incr"]
        n_incr_disp_faas       <- map["n_incr_disp_faas"]
        n_incr_loans_oth_bank  <- map["n_incr_loans_oth_bank"]
        n_cap_incr_repur       <- map["n_cap_incr_repur"]
        c_fr_oth_operate_a     <- map["c_fr_oth_operate_a"]
        c_inf_fr_operate_a     <- map["c_inf_fr_operate_a"]
        c_paid_goods_s         <- map["c_paid_goods_s"]
        c_paid_to_for_empl     <- map["c_paid_to_for_empl"]
        c_paid_for_taxes       <- map["c_paid_for_taxes"]
        n_incr_clt_loan_adv    <- map["n_incr_clt_loan_adv"]
        n_incr_dep_cbob        <- map["n_incr_dep_cbob"]
        c_pay_claims_orig_inco <- map["c_pay_claims_orig_inco"]
        pay_handling_chrg      <- map["pay_handling_chrg"]
        pay_comm_insur_plcy    <- map["pay_comm_insur_plcy"]
        oth_cash_pay_oper_act  <- map["oth_cash_pay_oper_act"]
        st_cash_out_act        <- map["st_cash_out_act"]
        n_cashflow_act         <- map["n_cashflow_act"]
        oth_recp_ral_inv_act   <- map["oth_recp_ral_inv_act"]
        c_disp_withdrwl_invest <- map["c_disp_withdrwl_invest"]
        c_recp_return_invest   <- map["c_recp_return_invest"]
        n_recp_disp_fiolta     <- map["n_recp_disp_fiolta"]
        n_recp_disp_sobu       <- map["n_recp_disp_sobu"]
        stot_inflows_inv_act   <- map["stot_inflows_inv_act"]
        c_pay_acq_const_fiolta <- map["c_pay_acq_const_fiolta"]
        c_paid_invest          <- map["c_paid_invest"]
        n_disp_subs_oth_biz    <- map["n_disp_subs_oth_biz"]
        oth_pay_ral_inv_act    <- map["oth_pay_ral_inv_act"]
        n_incr_pledge_loan     <- map["n_incr_pledge_loan"]
        stot_out_inv_act       <- map["stot_out_inv_act"]
        n_cashflow_inv_act     <- map["n_cashflow_inv_act"]
        c_recp_borrow          <- map["c_recp_borrow"]
        proc_issue_bonds            <- map["proc_issue_bonds"]
        oth_cash_recp_ral_fnc_act   <- map["oth_cash_recp_ral_fnc_act"]
        stot_cash_in_fnc_act        <- map["stot_cash_in_fnc_act"]
        free_cashflow               <- map["free_cashflow"]
        c_prepay_amt_borr           <- map["c_prepay_amt_borr"]
        c_pay_dist_dpcp_int_exp     <- map["c_pay_dist_dpcp_int_exp"]
        incl_dvd_profit_paid_sc_ms  <- map["incl_dvd_profit_paid_sc_ms"]
        oth_cashpay_ral_fnc_act     <- map["oth_cashpay_ral_fnc_act"]
        stot_cashout_fnc_act        <- map["stot_cashout_fnc_act"]
        n_cash_flows_fnc_act        <- map["n_cash_flows_fnc_act"]
        eff_fx_flu_cash             <- map["eff_fx_flu_cash"]
        n_incr_cash_cash_equ        <- map["n_incr_cash_cash_equ"]
        c_cash_equ_beg_period       <- map["c_cash_equ_beg_period"]
        c_cash_equ_end_period       <- map["c_cash_equ_end_period"]
        c_recp_cap_contrib          <- map["c_recp_cap_contrib"]
        incl_cash_rec_saims         <- map["incl_cash_rec_saims"]
        uncon_invest_loss           <- map["uncon_invest_loss"]
        prov_depr_assets            <- map["prov_depr_assets"]
        depr_fa_coga_dpba           <- map["depr_fa_coga_dpba"]
        amort_intang_assets         <- map["amort_intang_assets"]
        lt_amort_deferred_exp       <- map["lt_amort_deferred_exp"]
        decr_deferred_exp       <- map["decr_deferred_exp"]
        incr_acc_exp            <- map["incr_acc_exp"]
        loss_disp_fiolta        <- map["loss_disp_fiolta"]
        loss_scr_fa         <- map["loss_scr_fa"]
        loss_fv_chg         <- map["loss_fv_chg"]
        invest_loss         <- map["invest_loss"]
        decr_def_inc_tax_assets  <- map["decr_def_inc_tax_assets"]
        incr_def_inc_tax_liab    <- map["incr_def_inc_tax_liab"]
        decr_inventories         <- map["decr_inventories"]
        decr_oper_payable        <- map["decr_oper_payable"]
        incr_oper_payable        <- map["incr_oper_payable"]
        others                   <- map["others"]
        im_net_cashflow_oper_act <- map["im_net_cashflow_oper_act"]
        conv_debt_into_cap       <- map["conv_debt_into_cap"]
        conv_copbonds_due_within_1y  <- map["conv_copbonds_due_within_1y"]
        fa_fnc_leases        <- map["fa_fnc_leases"]
        end_bal_cash         <- map["end_bal_cash"]
        beg_bal_cash         <- map["beg_bal_cash"]
        end_bal_cash_equ     <- map["end_bal_cash_equ"]
        beg_bal_cash_equ     <- map["beg_bal_cash_equ"]
        im_n_incr_cash_equ   <- map["im_n_incr_cash_equ"]
        ts_code     <- map["update_flag"]
    }
}
