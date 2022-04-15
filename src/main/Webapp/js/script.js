var canvas = document.getElementById("canvas")
var context = canvas.getContext("2d")
var w = window.innerWidth
var h = window.innerHeight
canvas.width = w
canvas.height = h
var num = 100
var bubbles = []
for(var i = 0; i < num; i++){
    bubbles.push({
        y:Math.random() * w, //泡泡的坐标
        x:Math.random() * h,
        r:Math.random() * 5 + 25, //泡泡的半径，取值范围在25~30之间
        c:rancolor(), //随机颜色
        m:0.5 - Math.random(), //位移为-0.5~0.5
        n:0.5 - Math.random(),
        count:Math.random() * 1000 //随机计数器，用于重置移动方向
    })
}
function rancolor(){
    return "rgba("+Math.random()*255+","+Math.random()*255+","+Math.random()*255+","+Math.random()+")" //拼接为rgba格式的颜色字符串
}
function draw(){
    context.clearRect(0,0,w,h)
    for(var i=0;i<num;i++){
        context.beginPath()
        var bubble = bubbles[i]
        context.fillStyle = bubble.c
        context.moveTo(bubble.x,bubble.y)
        context.arc(bubble.x,bubble.y,bubble.r,0,Math.PI * 2)
        context.fill()
    }
    move()
}
function move(){
    for(var i = 0;i<num;i++){
        var bubble =  bubbles[i]
        bubble.x += bubble.m / 3 // 可以通过改变数字调整移动速度
        bubble.y += bubble.n / 3
        if(bubble.x - bubble.r > w || bubble.x + bubble.r < 0 || bubble.y - bubble.r > h || bubble.y + bubble.r < 0){ //判断是否完全移出窗口
            bubbles[i]={x:Math.random()*w,y:Math.random()*h,r:Math.random()*5 + 25,c:rancolor(),m:bubble.m,n:bubble.n,count:Math.random()*1000} //在随机位置重新生成泡泡
        }
        bubble.count -= 1 // 移动计数器减一
        if(bubble.count < 0){ //当计数器减为0以下时，重新生成移动参数及计数器数值
            bubble.m = 0.5 - Math.random()
            bubble.n = 0.5 - Math.random()
            bubble.count = Math.random() * 1000
        }
    }

}
draw()
setInterval(draw,1)