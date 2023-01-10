#include "sqldatabase.h"
#include<QSqlQuery>
#include<QSqlRecord>
#include<QSqlError>
#include<QDebug>
SqlDataBase::SqlDataBase(QObject *parent)
    : QObject{parent}
{
}
SqlDataBase::SqlDataBase(const QString &path)
{
 db=QSqlDatabase::addDatabase("QSQLITE");
 db.setDatabaseName(path);

 if(!db.open())
 {
     qDebug()<<"error"<<"\n";
 }
 else
 {
     qDebug()<<"ok"<<"\n";
 }
}
SqlDataBase::~SqlDataBase()
{
    if(db.isOpen())
    {
        db.close();
    }
}
bool SqlDataBase::isOpen() const
{
    return db.isOpen();
}

bool SqlDataBase::createTable()
{
    bool success = false;

    QSqlQuery query;

  query.prepare("CREATE TABLE DataBase(EMPID TEXT,Name TEXT,Designation TEXT,DateOfBirth TEXT,Department TEXT,JoiningDate TEXT,ContactNumber TEXT,Skills TEXT,Address TEXT);");


 if (!query.exec())
    {
        qDebug() << "Couldn't create the table '': one might already exist.";
        success = false;
    }

    return success;
}

bool SqlDataBase::addPerson(const QString emp,const QString name,const QString des,const QString dob,const QString dept,const QString jd,const QString cn,const QString skills,const QString add)
{
    qInfo()<<name;
 removePerson(emp);
    bool success = false;

    if (!emp.isEmpty()||!name.isEmpty()||!des.isEmpty()||!dob.isEmpty()||!dept.isEmpty()||!jd.isEmpty()||!cn.isEmpty()||!skills.isEmpty()||!des.isEmpty())
    {
        QSqlQuery queryAdd;
   queryAdd.prepare("INSERT INTO DataBase(EMPID,Name,Designation,DateOfBirth,Department,JoiningDate,ContactNumber,Skills,Address) values ('"+emp+"','"+name+"','"+des+"','"+dob+"','"+dept+"','"+jd+"','"+cn+"','"+skills+"','"+add+"')");

         queryAdd.bindValue(":EMPID",emp);
        queryAdd.bindValue(":Name",name);
        queryAdd.bindValue(":Designation",des);
        queryAdd.bindValue(":DateOfBirth",dob);
        queryAdd.bindValue(":Department",dept);
        queryAdd.bindValue(":JoiningDate",jd);
        queryAdd.bindValue(":ContactNumber",cn);
        queryAdd.bindValue(":Skills",skills);
        queryAdd.bindValue(":Address",add);



        if(queryAdd.exec())
        {
            success = true;
        }
        else
        {
            qDebug() << "add Data failed: " << queryAdd.lastError();
        }
    }
    else
    {
        qDebug() << "add Data failed: name cannot be empty";
    }

    return success;
}

bool SqlDataBase::removePerson(const QString &emp)
{
    bool success = false;

    if (personExists(emp))
    {
        QSqlQuery queryDelete;
        queryDelete.prepare("DELETE FROM DataBase WHERE EMPID = (:EMPID)");

        queryDelete.bindValue(":EMPID",emp);

        success = queryDelete.exec();


        if(!success)
        {
            qDebug() << "remove Data failed: " << queryDelete.lastError();
        }
    }
    else
    {
        qDebug() << "remove Data failed: person doesnt exist";
    }

    return success;
}
int SqlDataBase::personExists(const QString &emp) const
{
    bool exists = false;

    QSqlQuery checkQuery;
       checkQuery.prepare("SELECT EMPID FROM DataBase WHERE EMPID = (:EMPID)");

    checkQuery.bindValue(":EMPID",emp);


    if (checkQuery.exec())
    {
        if (checkQuery.next())
        {
            exists = true;
              return 1;
        }
    }
    else
    {
        qDebug() << "DATA exists failed: " << checkQuery.lastError();
        return 0;
    }
 qDebug()<<exists;
  return exists;
}



bool SqlDataBase::removeAllPersons()
{
    bool success = false;

    QSqlQuery removeQuery;
    removeQuery.prepare("DELETE FROM DataBase");

    if (removeQuery.exec())
    {
        success = true;
    }
    else
    {
        qDebug() << "remove all Data failed: " << removeQuery.lastError();
    }

    return success;
}
int SqlDataBase::anyuserExists(const QString &emp,const QString &name,const QString &des,const QString &dob,const QString &dept,const QString &jd,const QString &cn,const QString &skills,const QString &add) const
{
    bool exists = false;

    QSqlQuery checkQuery;
    checkQuery.prepare("SELECT Name FROM DataBase WHERE Name = (:Name) AND EMPID = (:EMPID) AND Designation = (:Designation) AND DateOfBirth = (:DateOfBirth) AND Department = (:Department) AND JoiningDate = (:JoiningDate) AND ContactNumber = (:ContactNumber) AND Skills = (:Skills) AND Address = (:Address)");

    checkQuery.bindValue(":EMPID",emp);
   checkQuery.bindValue(":Name",name);
  checkQuery.bindValue(":Designation",des);
  checkQuery.bindValue(":DateOfBirth",dob);
  checkQuery.bindValue(":Department",dept);
   checkQuery.bindValue(":JoiningDate",jd);
  checkQuery.bindValue(":ContactNumber",cn);
 checkQuery.bindValue(":Skills",skills);
 checkQuery.bindValue(":Address",add);

    if (checkQuery.exec())
    {
        if (checkQuery.next())
        {
            exists = true;
              return 1;
        }
    }
    else
    {
        qDebug() << "Data exists failed: " << checkQuery.lastError();
        return 0;
    }
 qDebug()<<exists;
  return exists;
}
QVector<QString> SqlDataBase::printSpecificdata(QString input)
{
   QVector<QString>v;
    qDebug() << "Data in db:";
    QSqlQuery query("SELECT * FROM DataBase");

    int idName = query.record().indexOf(input);
    QString name;

    while (query.next())
    {
       name= query.value(idName).toString();
           v.push_back(name);

    }
    for(auto i:v)
    {
        qDebug()<<i<<" ";


    }
    return v;
}

 void SqlDataBase::printAllPersons()
{
     std::array<QList<QString>,9> vec;
   // QVector<QString>vec[8];
  //  QList<QString>vec[8];
    QSqlQuery query("SELECT * FROM DataBase");
    int idName1 = query.record().indexOf("EMPID");

    int idName2 = query.record().indexOf("name");


    int idName3 = query.record().indexOf("Designation");

    int idName4= query.record().indexOf("Department");

    int idName5 = query.record().indexOf("DateOfBirth");

    int idName6 = query.record().indexOf("JoiningDate");
    int idName7 = query.record().indexOf("ContactNumber");
    int idName8= query.record().indexOf("Skills");
    int idName9= query.record().indexOf("Address");



    QString name[8];

    while (query.next())
    {
       name[0]= query.value(idName1).toString();
       name[1]=query.value(idName2).toString();
       name[2]=query.value(idName3).toString();
       name[3]=query.value(idName4).toString();
         name[4]=query.value(idName5).toString();
               name[5]=query.value(idName6).toString();
               name[6]=query.value(idName7).toString();
               name[7]=query.value(idName8).toString();
               name[8]=query.value(idName9).toString();

               for(int i=0;i<9;i++)
               {
                   for(int j=i;j<=i;j++)
               {
                       vec[i].push_back(name[j]);
                   }
               }

    }
    for(auto &i:vec)
    {
       qDebug()<<i<<" ";


    }
    //return vec;

 }

 QVector<QString> SqlDataBase::emp()
 {
     QVector<QString>v;
      qDebug() << "Data in db:";
      QSqlQuery query("SELECT * FROM DataBase");

      int idName1 = query.record().indexOf("EMPID");
      QString name;

      while (query.next())
      {
         name= query.value(idName1).toString();
             v.push_back(name);

      }
      for(auto i:v)
      {
          qDebug()<<i<<" ";


      }
      return v;
 }
 QVector<QString> SqlDataBase::name()
 {
    QVector<QString>v;
     qDebug() << "Data in db:";
     QSqlQuery query("SELECT * FROM DataBase");

     int idName = query.record().indexOf("Name");
     QString name;

     while (query.next())
     {
        name= query.value(idName).toString();
            v.push_back(name);

     }
     for(auto i:v)
     {
         qDebug()<<i<<" ";


     }
     return v;
 }

 QVector<QString> SqlDataBase::designation()
 {
     QVector<QString>v;
      qDebug() << "Data in db:";
      QSqlQuery query("SELECT * FROM DataBase");

      int idName3 = query.record().indexOf("Designation");

      QString name;

      while (query.next())
      {
         name= query.value(idName3).toString();
             v.push_back(name);

      }
      for(auto i:v)
      {
          qDebug()<<i<<" ";
 }
       return v;
 }

 QVector<QString> SqlDataBase::date()
 {
     QVector<QString>v;
      qDebug() << "Data in db:";
      QSqlQuery query("SELECT * FROM DataBase");

      int idName4 = query.record().indexOf("DateOfBirth");
      QString name;

      while (query.next())
      {
         name= query.value(idName4).toString();
             v.push_back(name);

      }
      for(auto i:v)
      {
          qDebug()<<i<<" ";
 }
 return v;

 }

 QVector<QString> SqlDataBase::dept()
 {

     QVector<QString>v;
      qDebug() << "Data in db:";
      QSqlQuery query("SELECT * FROM DataBase");

      int idName4 = query.record().indexOf("Department");
      QString name;

      while (query.next())
      {
         name= query.value(idName4).toString();
             v.push_back(name);

      }
      for(auto i:v)
      {
          qDebug()<<i<<" ";
 }
       return v;
 }

 QVector<QString> SqlDataBase::jd()
 {

     QVector<QString>v;
      qDebug() << "Data in db:";
      QSqlQuery query("SELECT * FROM DataBase");

      int idName4 = query.record().indexOf("JoiningDate");
      QString name;

      while (query.next())
      {
         name= query.value(idName4).toString();
             v.push_back(name);

      }
      for(auto i:v)
      {
          qDebug()<<i<<" ";
 }
       return v;
 }

 QVector<QString> SqlDataBase::cn()
 {

     QVector<QString>v;
      qDebug() << "Data in db:";
      QSqlQuery query("SELECT * FROM DataBase");

      int idName4 = query.record().indexOf("ContactNumber");
      QString name;

      while (query.next())
      {
         name= query.value(idName4).toString();
             v.push_back(name);

      }
      for(auto i:v)
      {
          qDebug()<<i<<" ";
 }
       return v;

 }

 QVector<QString> SqlDataBase::skills()
 {

     QVector<QString>v;
      qDebug() << "Data in db:";
      QSqlQuery query("SELECT * FROM DataBase");

      int idName4 = query.record().indexOf("Skills");
      QString name;

      while (query.next())
      {
         name= query.value(idName4).toString();
             v.push_back(name);

      }
      for(auto i:v)
      {
          qDebug()<<i<<" ";
 }
       return v;
 }

 QVector<QString> SqlDataBase::add()
 {

     QVector<QString>v;
      qDebug() << "Data in db:";
      QSqlQuery query("SELECT * FROM DataBase");

      int idName4 = query.record().indexOf("Address");
      QString name;

      while (query.next())
      {
         name= query.value(idName4).toString();
             v.push_back(name);

      }
      for(auto i:v)
      {
          qDebug()<<i<<" ";
 }
       return v;
 }




