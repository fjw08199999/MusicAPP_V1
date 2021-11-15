//華氏轉換為攝氏
func temperature(F: Double) -> Double {
    let C: Double = (F - 32) * (5 / 9)
    return C
}

temperature(F: 100)
temperature(F: 50)

//內外func命名
func move(from start: String, to end: String) {
    print("從 " + start + " 到 " + end)
}

move(from: "地球", to: "火星")

//省略func參數命名
func eat(_ name: String, price: Double) {
    print(name + " 價格" + "\(price)" + " 美金")
}
eat("北極頂級牛排", price: 1000000)

//定義class
class Baby {
    var age = 1
    var name = "peter"
    
    func sleep(hour: String, min: String) {
        print("睡了" + hour + "小時" + min + "分鐘")
    }
    
}
var cuteBaby = Baby()
cuteBaby.sleep(hour: "10", min: "10")


