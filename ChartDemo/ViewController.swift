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

class ViewController: UIViewController, ChartViewDelegate {
    
    var lineChartView: LineChartView!//折线图

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpLineChartView()
    }

    func setUpLineChartView() {
        lineChartView = LineChartView()
        lineChartView.delegate = self
        lineChartView.frame = CGRect.init(x: 10, y: 100, width: self.view.bounds.width - 20, height: 300)
        
        //创建50个随机数据
        var dataEntries = [ChartDataEntry]()
        for index in 0..<100 {
            let value = arc4random() % 100
            let entry = ChartDataEntry.init(x: Double(index), y: Double(value))
            dataEntries.append(entry)
        }
        //50个随机数据作为一根折线数据
        let chartDataSet = LineChartDataSet.init(entries: dataEntries, label: "随机数")
        
        //设置数据样式
        chartDataSet.colors = [.orange] //折线颜色, 可以设置多个 [.orange, .red, .yellow]会交替显示
        chartDataSet.lineWidth = 2
        
        //修改折点样式
        chartDataSet.circleColors = [.orange] //外圆颜色
        chartDataSet.circleRadius = 6 //外圆半径
        chartDataSet.circleHoleColor = .red //内圆颜色
        chartDataSet.circleHoleRadius = 2 //内圆半径
        chartDataSet.drawCirclesEnabled = false //不显示折点
        chartDataSet.drawCircleHoleEnabled = false //仅仅不显示内圆
        chartDataSet.valueColors = [.green] //折点文字颜色
        chartDataSet.valueFont = .systemFont(ofSize: 9)//折点文字大小
        //chartDataSet.drawValuesEnabled = false //不显示折点文字
        let formatter = NumberFormatter.init()//自定义格式
        formatter.positiveSuffix = "%"//数字后缀单位
        chartDataSet.valueFormatter = DefaultValueFormatter.init(formatter: formatter)//给折点文字加单位
        
        //使用虚线显示, 设置各段长度
        chartDataSet.lineDashLengths = [4, 2]
        
        //折线的线条模式
        //chartDataSet.mode = .linear //直线连接, 默认
        chartDataSet.mode = .cubicBezier //贝塞尔曲线
        
        //绘制填充色背景
        chartDataSet.drawFilledEnabled = true
        chartDataSet.fillColor = .blue
        chartDataSet.fillAlpha = 0.5
        
        //十字线样式
        chartDataSet.highlightColor = .yellow
        chartDataSet.highlightLineWidth = 3
        chartDataSet.highlightLineDashLengths = [4, 2]
        
        //折线图包含一根折线
        //let chartData = LineChartData.init(dataSet: chartDataSet) 单条数据可以用这个
        let chartData = LineChartData.init(dataSets: [chartDataSet]) //无论多少条数据均可以使用这个
        
        //显示数据
        lineChartView.data = chartData
        
        
        lineChartView.backgroundColor = .yellow
        lineChartView.noDataText = "暂无数据"//没有数据时提示
        
        //折线图描述文字及样式
        lineChartView.chartDescription?.text = "随机数？"
        lineChartView.chartDescription?.textColor = .red
        
        //设置交互样式
        lineChartView.scaleYEnabled = false //取消Y轴缩放
        lineChartView.doubleTapToZoomEnabled = true //双击缩放
        lineChartView.dragEnabled = true //拖拽
        lineChartView.dragDecelerationEnabled = true //拖拽惯性
        lineChartView.dragDecelerationFrictionCoef = 0.9 //拖拽后惯性效果摩擦系数(0~1)越小惯性越不明显
        
        //绘图区域的背景
        lineChartView.drawGridBackgroundEnabled = true
        lineChartView.gridBackgroundColor = .lightGray
        
        //绘图区域边框
        lineChartView.drawBordersEnabled = true
        lineChartView.borderColor = .red
        lineChartView.borderLineWidth = 2.5
        
        //图例样式 legend
        lineChartView.legend.form = Legend.Form.line
        
        //设置X轴显示样式
        lineChartView.xAxis.labelPosition = .bottom//在下方显示
        lineChartView.xAxis.axisMinimum = 0 //最小刻度
        lineChartView.xAxis.axisMaximum = 120
        lineChartView.xAxis.granularity = 0.5 //最小间隔
        lineChartView.xAxis.labelTextColor = .black
        lineChartView.xAxis.labelFont = .systemFont(ofSize: 12)
        lineChartView.xAxis.labelRotationAngle = -30
        
        //设置Y轴显示样式, 左侧Y轴为leftAxis、右侧Y轴为rightAxis
        lineChartView.leftAxis.axisMinimum = -10
        lineChartView.leftAxis.axisMaximum = 120
        lineChartView.leftAxis.granularity = 1
        lineChartView.leftAxis.drawZeroLineEnabled = true //绘制0刻度线
        lineChartView.leftAxis.zeroLineColor = .red
        lineChartView.leftAxis.zeroLineWidth = 3
        lineChartView.leftAxis.zeroLineDashLengths = [4, 2]
        
        //绘制限制线或警戒线
        let limitLine1 = ChartLimitLine.init(limit: 85, label: "高")
        let limitLine2 = ChartLimitLine.init(limit: 15, label: "低")
        limitLine1.valueTextColor = .red //标示文字颜色
        limitLine1.valueFont = .systemFont(ofSize: 13)//标示文字大小
        limitLine1.labelPosition = .topLeft//标示位置
        limitLine1.drawLabelEnabled = false//是否显示标示
        limitLine1.lineColor = .brown//线条颜色
        limitLine1.lineWidth = 3
        lineChartView.leftAxis.addLimitLine(limitLine1)
        lineChartView.leftAxis.addLimitLine(limitLine2)
        lineChartView.leftAxis.drawLimitLinesBehindDataEnabled = true//将限制线绘制在折线后面
        
        self.view.addSubview(lineChartView)
        print("绘制折线图")
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("选中了一个数据")
    }
}

