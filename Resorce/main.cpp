#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include"QtQml"
#include"sqldatabase.h"
static const QString path="DataBase.db";


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    SqlDataBase db(path);
    if(db.isOpen())
    {
        db.createTable();
     //  db.removeAllPersons();
       db.printAllPersons();





    }
    QGuiApplication app(argc, argv);
SqlDataBase t;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("input",&t);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
