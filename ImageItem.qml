import QtQuick 2.0

Item {
    property var sourceUri
    // Для удобства работы работаем в полярной системе координат. Начало координат в центре экрана.
    property real r         // Длина вектора.
    property real phi       // Полярный угол.
    height: 100
    width: 100
    x: (r*Math.cos(phi) + parent.width/2) - width/2
    y: (parent.height/2 - r*Math.sin(phi)) - height/2

    Image {
      anchors.fill: parent
      source: sourceUri
    }
}
