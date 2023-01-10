#ifndef SQLDATABASE_H
#define SQLDATABASE_H

#include <QObject>
#include <QWidget>
#include<QSqlDatabase>
class SqlDataBase : public QObject
{
    Q_OBJECT
public:
    explicit SqlDataBase(QObject *parent = nullptr);
    SqlDataBase(const QString &path);
    ~SqlDataBase();

signals:
private:
    QSqlDatabase db;
public slots:
    bool createTable();

  bool isOpen() const;
      bool addPerson(const QString emp,const QString name,const QString des,const QString dob,const QString dept,const QString jd,const QString cn,const QString skills,const QString add);
      bool removePerson(const QString &emp);
     int personExists(const QString &emp) const;
    int anyuserExists(const QString &emp,const QString &name,const QString &des,const QString &dob,const QString &dept,const QString &jd,const QString &cn,const QString &skills,const QString &add) const;

     bool removeAllPersons();
    QVector<QString>  printSpecificdata(QString);

void printAllPersons();
   QVector<QString> emp();
   QVector<QString> name();
   QVector<QString>designation();
   QVector<QString>date();
  QVector<QString> dept();
   QVector<QString>jd();
  QVector<QString> cn();
  QVector<QString> skills();
         QVector<QString> add();

};

#endif // SQLDATABASE_H
