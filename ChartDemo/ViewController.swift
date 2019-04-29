//
//  ViewController.swift
//  ChartDemo
//
//  Created by Weibin Wu on 28/4/2019.
//  Copyright © 2019 Weibin Wu. All rights reserved.
//

//Charts 为我们提供了 8 种不同类型的图表：
//LineChart：折线图
//BarChart：柱状图
//Combined-Chart：组合图
//PieChart：饼状图
//RadarChart：雷达图
//ScatterChart：散点图
//CandleStickChart：K 线图（烛形图）
//BubbleChart：气泡图

import UIKit
import Charts

class ViewController: UIViewController {
    
    var lineChartView: LineChartView!//折线图

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建折线图组件对象
        let chartView = LineChartView()
        chartView.frame = CGRect(x: 20, y: 80, width: self.view.bounds.width - 40,
                                 height: 300)
        
        
        //折线图背景色
        chartView.backgroundColor = UIColor.yellow
        
        //折线图无数据时显示的提示文字
        chartView.noDataText = "暂无数据"
        
        //折线图描述文字和样式
        chartView.chartDescription?.text = "考试成绩"
        chartView.chartDescription?.textColor = UIColor.red
        
        //设置交互样式
        chartView.scaleYEnabled = false //取消Y轴缩放
        chartView.doubleTapToZoomEnabled = true //双击缩放
        chartView.dragEnabled = true //启用拖动手势
        chartView.dragDecelerationEnabled = true //拖拽后是否有惯性效果
        chartView.dragDecelerationFrictionCoef = 0.9 //拖拽后惯性效果摩擦系数(0~1)越小惯性越不明显
        
        //生成20条随机数据
        var dataEntries = [ChartDataEntry]()
        for i in 0..<20 {
            let y = arc4random()%100
            let entry = ChartDataEntry.init(x: Double(i), y: Double(y))
            dataEntries.append(entry)
        }
        //这50条数据作为1根折线里的所有数据
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "图例1")
        //目前折线图只包括1根折线
        let chartData = LineChartData(dataSets: [chartDataSet])
        
        //设置折现图数据
        chartView.data = chartData
        
        self.view.addSubview(chartView)
    }

    func setUpLineChartView() {
        lineChartView = LineChartView()
        lineChartView.frame = CGRect.init(x: 20, y: 100, width: self.view.bounds.width - 40, height: 300)
        
        
    }
}

