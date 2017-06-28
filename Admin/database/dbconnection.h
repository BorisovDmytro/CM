#ifndef DBCONNECTION_H
#define DBCONNECTION_H

#include "dbconnectedsetting.h"

#include <QSqlDatabase>
#include <QSqlQuery>

class DbConnection
{
private:
  QSqlDatabase mDb;

public:
  DbConnection();

  void init(const DbConnectedSetting& setting);

  bool connect();

  QSqlQuery getQuery();

  bool isConnected();

  QString getLastError();
};

#endif // DBCONNECTION_H
