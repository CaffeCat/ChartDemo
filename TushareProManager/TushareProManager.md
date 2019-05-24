## 这个文件夹用于从 Tushare Pro 中获取数据, 并将数据存储在 Realm Swift 数据库中
### Tushare Pro 简介参见:  <#https://tushare.pro#>  {
            账号: 13411984432
            邮箱: 1285906550@qq.com
        }
        参见 TusharePro 中数据接口简介: <#https://tushare.pro/document/2?doc_id=14#> 可以知道基本使用方法{
            http获取数据使用方式{
                输入参数{
                <#api_name#>：接口名称，比如stock_basic
                <#token#> ：用户唯一标识，可通过登录pro网站获取
                <#params#>：接口参数，如daily接口中start_date和end_date
                <#fields#>：字段列表，用于接口获取指定的字段，以逗号分隔，如"open,high,low,close"
                }
                输出参数{
                <#code#>： 接口返回码，2002表示权限问题。
                <#msg#>：错误信息，比如“系统内部错误”，“没有权限”等
                <#data#>：数据，data里包含fields和items字段，分别为字段和数据内容
                }
            }
        }
}

### 第三方框架的使用情况: 
Charts: 显示图像
RealmSwift: 数据库
Alamofire: 请求 TusharePro 数据
SwiftyJSON : 将 Alamofire 返回数据 JSON 化读取
ObjectMapper: 将字典结构数据转化成 RealmObject 对象
    
        
