import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

ApplicationWindow {
    title: qsTr("Whirligig")
    width: 640
    height: 480
    visible: true
    MainForm {
        id: mineForm
        anchors.fill: parent
        property real startAngle
        property real prevAngle
        property var prevTime
        property real speed

        mouseArea.onPressed: {
            // Если идет анимация, завершаем.
            if(timer.running) {
                timer.stop()
                mouseArea.blueItem.phi += speed*timer.interval*timer.ticks
                mouseArea.redItem.phi -= speed*timer.interval*timer.ticks
            }
            startAngle = angle(mouse.x, mouse.y)
            prevTime = new Date().getTime()
            prevAngle = startAngle
        }

        mouseArea.onReleased: {
            var stopAngle = angle(mouse.x, mouse.y)
            var curTime = new Date().getTime()

            angleStorage.addAngle(stopAngle)
            var a   // Угол, который нужно пройти для завершения окружности. Вычисляется в интервале от 0 до 2*PI.
            // Так как atan2 дает угол от -PI до PI, то приходится это учитывать тут.
            if(speed > 0 && startAngle>stopAngle) a = startAngle-stopAngle
            else if(speed > 0) a = 2*Math.PI-stopAngle+startAngle
            else a = 2*Math.PI+stopAngle-startAngle
            // Если находимся в некоторой окрестности начальной точки, то просто завершаем анимацию.
            if(Math.abs(startAngle-stopAngle)<5e-2) {
                mouseArea.blueItem.phi += a
                mouseArea.redItem.phi -= a
                return
            }
            timer.ticks = a/Math.abs(speed)/timer.interval
            timer.start()
        }

        mouseArea.onPositionChanged: {
            if(mouseArea.pressed) {
                var curTime = new Date().getTime()
                var curAngle = angle(mouse.x, mouse.y)
                var curSpeed = (curAngle - prevAngle)/(curTime-prevTime)
                mouseArea.blueItem.phi += curAngle - prevAngle
                mouseArea.redItem.phi -= curAngle - prevAngle
                prevTime = curTime
                prevAngle = curAngle
                speed = curSpeed
            }
        }

        Timer {
            id: timer
            running: false
            interval: 5
            repeat: true
            property int ticks: 0
            onTriggered: {
                if(ticks == 0) {
                    stop()
                    return
                }
                --ticks
                mineForm.mouseArea.blueItem.phi += mineForm.speed*interval
                mineForm.mouseArea.redItem.phi -= mineForm.speed*interval
            }
        }

        // Вычисления полярного угла.
        function angle(x, y) {
            return Math.atan2(mouseArea.height/2 - y, x - mouseArea.width/2)
        }
    }
}
