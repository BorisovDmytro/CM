#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "core/cmclientengen.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    CMClientEngene        clientEngen;
    QQmlApplicationEngine engine;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("ClientEngen", &clientEngen);

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    return app.exec();
}
