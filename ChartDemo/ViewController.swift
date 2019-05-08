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
    var candleStickChartView: CandleStickChartView!//蜡烛图

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setUpLineChartView()
        self.setUpCandleStickChartView()
    }

    func setUpLineChartView() {
        lineChartView = LineChartView()
        lineChartView.delegate = self
        lineChartView.frame = CGRect.init(x: 10, y: 30, width: self.view.bounds.width - 20, height: 300)
        
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
        chartDataSet.lineWidth = 3
        
        //折线的线条模式
        //chartDataSet.mode = .linear //直线连接, 默认
        chartDataSet.mode = .horizontalBezier //贝塞尔曲线
        
        //绘制填充色背景
        chartDataSet.drawFilledEnabled = true
        chartDataSet.fillColor = .blue
        chartDataSet.fillAlpha = 0.5
        
        //十字线样式
        chartDataSet.highlightColor = .yellow
        chartDataSet.highlightLineWidth = 1
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
        lineChartView.xAxis.axisMinimum = lineChartView.data?.xMin ?? 0
        lineChartView.xAxis.axisMaximum = (lineChartView.data?.xMax ?? 0) + 1
        lineChartView.xAxis.granularity = 0.5 //最小间隔
        lineChartView.xAxis.labelTextColor = .black
        lineChartView.xAxis.labelFont = .systemFont(ofSize: 12)
        lineChartView.xAxis.labelRotationAngle = -30
        
        //设置Y轴显示样式, 左侧Y轴为leftAxis、右侧Y轴为rightAxis
        lineChartView.leftAxis.axisMinimum = lineChartView.data?.yMin ?? 0
        lineChartView.leftAxis.axisMaximum = (lineChartView.data?.yMax ?? 10) + 10
        lineChartView.leftAxis.granularity = 1
        lineChartView.leftAxis.drawZeroLineEnabled = true //绘制0刻度线
        lineChartView.leftAxis.zeroLineColor = .red
        lineChartView.leftAxis.zeroLineWidth = 1
        lineChartView.leftAxis.zeroLineDashLengths = [4, 2]
        
        //绘制限制线或警戒线
        let limitLine1 = ChartLimitLine.init(limit: 85, label: "高")
        let limitLine2 = ChartLimitLine.init(limit: 15, label: "低")
        limitLine1.valueTextColor = .red //标示文字颜色
        limitLine1.valueFont = .systemFont(ofSize: 13)//标示文字大小
        limitLine1.labelPosition = .topLeft//标示位置
        limitLine1.drawLabelEnabled = false//是否显示标示
        limitLine1.lineColor = .brown//线条颜色
        limitLine1.lineWidth = 1
        limitLine2.lineWidth = 1
        lineChartView.leftAxis.addLimitLine(limitLine1)
        lineChartView.leftAxis.addLimitLine(limitLine2)
        lineChartView.leftAxis.drawLimitLinesBehindDataEnabled = true//将限制线绘制在折线后面
        
//        lineChartView.setVisibleXRangeMaximum(20)
//        var xvalue = lineChartView.data?.xMax ?? 0
//        xvalue -= 33
//        lineChartView.moveViewToX(xvalue)
//        print("\(String(describing: xvalue))")
        
        //开场动画
        lineChartView.animate(xAxisDuration: 1)
        
        self.view.addSubview(lineChartView)
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("选中了一个数据: [\(entry.x), \(entry.y)]")
        self.showMarkerView(entry: entry, chartView)
        //lineChartView.moveViewToAnimated(xValue: entry.x - 10, yValue: 0, axis: .left, duration: 0.1)
    }
    
    func showMarkerView(entry: ChartDataEntry, _ chartView: ChartViewBase) -> Void {
        let marker = MarkerView.init(frame: CGRect(x: 20, y: 20, width: 80, height: 20))
        marker.chartView = lineChartView
        marker.offset = CGPoint.init(x: 5, y: -marker.frame.height-5)
        let valueLB = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 20))
        valueLB.text = "数据:\(entry.y)"
        valueLB.textColor = .red
        valueLB.font = .systemFont(ofSize: 12)
        valueLB.backgroundColor = .gray
        valueLB.textAlignment = .center
        marker.addSubview(valueLB)
        chartView.marker = marker
    }
    
    func setUpCandleStickChartView() {
        candleStickChartView = CandleStickChartView()
        candleStickChartView.frame = CGRect.init(x: 10, y: 50, width: self.view.bounds.width-20, height: 300)
        
        //第一组烛形图的随机数据
        let dataEntries1 = (0..<100).map { (i) -> CandleChartDataEntry in
            let val = Double(arc4random_uniform(40) + 10)
            let high = Double(arc4random_uniform(9) + 8)
            let low = Double(arc4random_uniform(9) + 8)
            let open = Double(arc4random_uniform(6) + 1)
            let close = Double(arc4random_uniform(6) + 1)
            let even = arc4random_uniform(2) % 2 == 0 //true表示开盘价高于收盘价
            return CandleChartDataEntry.init(x: Double(i),
                                        shadowH: val + high,
                                        shadowL: val - low,
                                        open: even ? val + open : val - open,
                                        close: even ? val - close : val + close,
                                        data: "1000")
        }
        let chartDataSet1 = CandleChartDataSet(entries: dataEntries1, label: "图例1")
        chartDataSet1.drawValuesEnabled = false
        chartDataSet1.increasingColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 0.9112799658)
        chartDataSet1.increasingFilled = true
        chartDataSet1.decreasingColor = .red
        chartDataSet1.decreasingFilled = false
        chartDataSet1.shadowColorSameAsCandle = true
        
        //目前烛形图包括1组数据
        let chartData = CandleChartData(dataSets: [chartDataSet1])
        
        candleStickChartView.data = chartData
        
        candleStickChartView.delegate = self
        candleStickChartView.backgroundColor = .lightText
        candleStickChartView.chartDescription?.text = "K线图"
        candleStickChartView.chartDescription?.textColor = .red
        candleStickChartView.doubleTapToZoomEnabled = false
        candleStickChartView.borderColor = .clear
        candleStickChartView.scaleYEnabled = false
        candleStickChartView.drawGridBackgroundEnabled = false
        candleStickChartView.drawBordersEnabled = false
        candleStickChartView.gridBackgroundColor = .clear
        candleStickChartView.borderColor = .clear
        
        candleStickChartView.xAxis.labelPosition = .bottom
        candleStickChartView.xAxis.drawAxisLineEnabled = true
        candleStickChartView.xAxis.drawGridLinesEnabled = false
        candleStickChartView.xAxis.forceLabelsEnabled = false
        candleStickChartView.xAxis.granularity = 1
        candleStickChartView.xAxis.granularityEnabled = true
        candleStickChartView.xAxis.labelCount = 10
        candleStickChartView.setScaleMinima(1, scaleY: 1)
        candleStickChartView.xAxis.spaceMax = 1
        
        candleStickChartView.rightAxis.drawLabelsEnabled = false
        candleStickChartView.leftAxis.labelCount = 10
        candleStickChartView.setVisibleXRangeMinimum(15)
        candleStickChartView.setVisibleXRangeMaximum(30)
        
        self.view.addSubview(candleStickChartView)
    }
}

