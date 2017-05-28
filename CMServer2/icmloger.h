#ifndef ICMLOGER_H
#define ICMLOGER_H

#include <QString>
/*
Public Interface
For create server Loger
*/

class ICMLoger
{
public:
  virtual ~ICMLoger() {}

  virtual void info(const QString &msg);

  virtual void error(const QString &msg);
};

#endif // ICMLOGER_H
