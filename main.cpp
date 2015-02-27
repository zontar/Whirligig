#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "anglestoragemodel.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    AngleStorageModel angleStorage;
    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("angleStorage", &angleStorage);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
