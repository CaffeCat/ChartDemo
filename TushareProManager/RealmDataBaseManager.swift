//
//  RealmDataBaseManager.swift
//  ChartDemo
//
//  Created by Weibin Wu on 25/5/2019.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

import Foundation
import RealmSwift

class TestClass {
    var name = NULL_DATA
}

class RealmDatabaseManager {
    
    //MARK: 对 Realm 数据父目录关闭系统文件保护
    ///防止设备锁定时, 系统自动对该目录进行数据加密
    class func turnOffNSFileProtection() {
        
        let realm = try! Realm()
        
        // Get our Realm file's parent directory
        let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path
        
        // Disable file protection for this directory
        try! FileManager.default.setAttributes([.protectionKey : FileProtectionType.none], ofItemAtPath: folderPath)
    }
    
    //MARK: 获取 Realm 数据库配置信息
    class func getRealmConfig(request: TushareProRequestData) -> Realm.Configuration {
        
        var dataBaseName = Realm.Configuration.init().fileURL!.deletingLastPathComponent()
        var objectType:Object.Type
        
        var suffixName:String
        switch request.apiType! {
        case .TushareProStockList:
            suffixName = "TushareProStockList"
            objectType = TushareProStockListClass.self
        case .TushareProHistoryName:
            suffixName = "TushareProHistoryName"
            objectType = TushareProHistoryNameClass.self
        case .TushareProStockCompany:
            suffixName = "TushareProStockCompany"
            objectType = TushareProStockCompanyClass.self
        case .TushareProTradeCalendar:
            suffixName = "TushareProTradeCalendar"
            objectType = TushareProTradeCalendarClass.self
        case .TushareProNewShareStocks:
            suffixName = "TushareProNewShareStocks"
            objectType = TushareProNewShareStocksClass.self
        case .TushareProConstituentStocksOfHS:
            suffixName = "TushareProConstituentStocksOfHS"
            objectType = TushareProConstituentStocksOfHSClass.self
        case .TushareProMarketData:
            if request.isTscodeForPrimaryKey {
                suffixName = "\(request.marketDataType)TushareProMarketDataOfTs_code"
                objectType = TushareProMarketDataClassOfTs_codePrimaryKey.self
            }else{
                suffixName = "\(request.marketDataType)TushareProMarketDataOfDate"
                objectType = TushareProMarketDataClassOfDatePrimaryKey.self
            }
        case .TushareProAdjustedFactor:
            if request.isTscodeForPrimaryKey {
                suffixName = "TushareProAdjustedFactorClassOfTs_codePrimaryKey"
                objectType = TushareProAdjustedFactorClassOfTs_codePrimaryKey.self
            }else{
                suffixName = "TushareProAdjustedFactorClassOfDatePrimaryKey"
                objectType = TushareProAdjustedFactorClassOfDatePrimaryKey.self
            }
        case .TushareProSuspend:
            suffixName = "TushareProSuspendClass"
            objectType = TushareProSuspendClass.self
        case .TushareProDailyIndication:
            if request.isTscodeForPrimaryKey {
                suffixName = "TushareProDailyIndicationOfTs_codePrimaryKey"
                objectType = TushareProDailyIndicatorClassOfTs_codePrimaryKey.self
            }else{
                suffixName = "TushareProDailyIndicationOfDatePrimaryKey"
                objectType = TushareProDailyIndicationClassOfDatePrimaryKey.self
            }
        case .TushareProMoneyFlow:
            if request.isTscodeForPrimaryKey {
                suffixName = "TushareProMoneyFlowClassOfTs_codePrimaryKey"
                objectType = TushareProMoneyFlowClassOfTs_codePrimaryKey.self
            }else{
                suffixName = "TushareProMoneyFlowClass"
                objectType = TushareProMoneyFlowClassOfDatePrimaryKey.self
            }
        default:
            //FIXME: 不能走到这里来
            objectType = TushareProStockListClass.self
            suffixName = "default.realm"
            print(#function , "But something needs to do?")
        }
        
        if request.dataBaseName != NULL_DATA{
            dataBaseName = dataBaseName.appendingPathComponent("\(request.dataBaseName).realm")
        }else {
            suffixName += ".realm"
            dataBaseName = dataBaseName.appendingPathComponent(suffixName)
        }
        
        let config = Realm.Configuration.init(fileURL: dataBaseName,
                                              inMemoryIdentifier: nil,
                                              syncConfiguration: nil,
                                              encryptionKey: nil,
                                              readOnly: false,
                                              schemaVersion: SCHEMA_VERSION,
                                              migrationBlock: nil,
                                              deleteRealmIfMigrationNeeded: true,
                                              shouldCompactOnLaunch: nil,
                                              objectTypes: [objectType])
        return config
    }
    
    //MARK: 数据库通用写操作
    class func write(request: TushareProRequestData, data: Object) {
        
        let config = self.getRealmConfig(request: request)
        do {
            let realm = try Realm.init(configuration: config)
            try realm.write {
                realm.add(data, update: true)
            }
        } catch let error {
            print("Something wrong happens in", #function, error)
        }
    }
    
    //MARK: 数据库通用读操作
    class func read(request: TushareProRequestData) {
        
        let config = self.getRealmConfig(request: request)
        do {
            let realm = try Realm.init(configuration: config)
            if let typeC = config.objectTypes?.first {
                let data = realm.objects(typeC)
                print(data)
            }
        } catch let error {
            print("Something wrong happens in", #function, error)
        }
    }
}
